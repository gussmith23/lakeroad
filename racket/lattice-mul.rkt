#lang errortrace racket

(require rosette
         rosette/solver/smt/boolector
         rosette/lib/synthax
         json
         racket/pretty
         "interpreter.rkt"
         "compile-to-json.rkt"
         "utils.rkt"
         "lattice-ecp5.rkt")

(provide lattice-mul-with-carry)
;; Return inputs to be added as pairs _in order_.
;; Also, if there are an odd number of elements, pad the list with a final
;; element (default is (bv -1 4)) to make it an even list.
(define (break-ccu2c-inputs-into-pairs-helper xs #:pad-item [pad-item (bv -1 4)])
  (match xs
    [(list) (list)]
    [(list a) (list (list a pad-item))]
    [(list a b) (list (list a b))]
    [(list a b rst ...) (cons (list a b) (break-ccu2c-inputs-into-pairs-helper rst))]))

;; Add two length N lists of LR expressions of the form `(list e0 e1 ... eN-1)`,
;; where each `ei` evaluates to a `(list (bitvector 1))` when interpreted by the
;; LR interpreter.
;;
;; Inputs should be ordered from LSB to MSB (that is, the first item e0 of each
;; input list is the least significant bit)
;;
;; Returns a length N list of LR expressions of the form `(list r0 r1 ... rN-1)`,
;; where each `ri` evaluates to a `(list (bitvector 1))` when interpreted by the
;; LR interpreter.
;;
;; The result is ordered from LSB to MSB (that is, the first item r0 of the
;; result is the least significant bit).
;;
;; LRType:
;; + a: (list (list (bitvector 1)))
;; + b: (list (list (bitvector 1)))
;; + returns: (list (list (bitvector 1)))
(define (add-two-lists a b #:INIT0 [INIT0 #f] #:INIT1 [INIT1 #f])
  ;; a and b are both of the form a = (a0 a1 ... an-1), each ai outputs a list
  ;; containing a single bit (e.g., a LUT4)
  (let* (;; Transform a and b into inputs list of length-4 bitvector inputs to
         ;; LUT4s with the form:
         ;;
         ;;     '((1 1 a0 b0)
         ;;       (1 1 a1 b1)
         ;;       ...
         ;;       (1 1 an-1 bn-1))
         ;;
         ;; Thus, element 0 of the resulting list is the input bitvector to the
         ;; least significant adder
         [lut4-inputs (for/list ([a-bit a] [b-bit b])
                        `(concat ,(bv -1 2) (first ,a-bit) (first ,b-bit)))]

         ;; paired-inputs: We need to combine `inputs` formed in the previous step
         ;; so that hey can be fed into ccu2cs (which have 2 luts each). Thus we
         ;; must pair them up using a helper function
         [paired-inputs (break-ccu2c-inputs-into-pairs-helper lut4-inputs)]

         ;; ccu2c-foldl-helper. folding over inputs w/ this helper should
         ;; return a list of ccu2cs where item 0 is the most significant
         ;; ccu2c processed, and such that CCU2C i's carry out is CCU2C i+1's
         ;; carry in (i.e., their carries are chained starting at the tail of
         ;; the list and moving towards the head of the list)
         ;;
         ;; This helper expects an input to a CCU2C (i.e., two (bitvector 4)s as
         ;; provided by paired-inputs) and a carry in (which will come from the
         ;; accumulator).
         ;;
         ;; When the accumulator is empty, the carry-in is taken to be 0.
         [ccu2c-foldl-helper
          (lambda (input acc)
            (let* (;; When our accumulator `acc` is empty (that is, when we are
                   ;; starting the fold and have not created any CCU2Cs), we
                   ;; supply a (bv 0 1) literal.
                   ;;
                   ;; Otherwise, `acc`'s head is the most recently generated
                   ;; (i.e., most significant) CCU2C, and we want to get its
                   ;; carry bit. When a CCU2C is interpreted it returns:
                   ;; (list S0 S1 CO), which are the two sum bits and the carry
                   ;; out bit. Thus, we want to grab the third item of the
                   ;; interpreted result
                   [carry-in (match acc
                               ['() (bv 0 1)]
                               [(list cc rst ...) `(third ,cc)])]
                   [ccu2c (match input
                            ;; Inputs are in (Least significant, most significant) order
                            [(list i0 i1)
                             (make-lattice-ccu2c-expr #:inputs (list i0 i1)
                                                      #:CIN carry-in
                                                      #:INIT0 INIT0
                                                      #:INIT1 INIT1
                                                      #:INJECT1_0 (bv 0 1)
                                                      #:INJECT1_1 (bv 0 1))])])
              (cons ccu2c acc)))])

    (let* (;; ccu2cs holds the CCU2Cs in MSB to LSB order. We now want to fold
           ;; over these and collect the individual bits (below)
           [ccu2cs (foldl ccu2c-foldl-helper '() paired-inputs)]
           [ccu2c-bit-extractor-helper
            (lambda (ccu2c acc) (cons (list `(first ,ccu2c)) (cons (list `(second ,ccu2c)) acc)))]

           ;; bits is a list of list of individual bits in reverse order (LSB to
           ;; MSB). It may be the case that bits has an extra bit (e.g., if we
           ;; are adding 5 bit numbers we need 3 CCU2Cs, and these each create
           ;; two bits, resulting in a total of 6 output bits). The 'dummy' bit
           ;; is at the tail of `bits`, so we can drop it with a `take`.
           ;; TODO: Probably not super important, but this final `take` is
           ;; linear to bitwidth...we could actually accomplish this in
           ;; ccu2c-bit-extractor-helper but that would involve a more
           ;; complicated function. For readability I'm keeping it as is.
           [bits (foldl ccu2c-bit-extractor-helper '() ccu2cs)])
      ;; Finally, take only as many bits as we need.
      (take bits (length a)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;  TESTS FOR `add-two-lists  ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ test
  (require rackunit)
  (define (test-for-values a b)
    (define a_ (map list (bitvector->bits a)))
    (define b_ (map list (bitvector->bits b)))
    (define result (add-two-lists a_ b_ #:INIT0 (bv #x6ffe 16) #:INIT1 (bv #x6ffe 16)))
    (define interpreted (interpret result))
    (cons result interpreted))

  (test-case "exhaustively add all 4-bit numbers"
             (begin
               (printf "\033[34m Adding pairs of 4-bit numbers\033[0m\n")
               (for* ([a (range 15)] [b (range 15)])
                 (match (test-for-values (bv a 4) (bv b 4))
                   [(cons result interpreted)
                    (check-equal? (map first interpreted) (bitvector->bits (bv (+ a b) 4)))]))))

  (test-case "add 5-bit numbers"
             (begin
               (printf "\033[34m Adding pairs of 5-bit numbers\033[0m\n")
               (for* ([a (range 15)] [b (range 20 32)])
                 (match (test-for-values (bv a 5) (bv b 5))
                   [(cons result interpreted)
                    (check-equal? (map first interpreted)
                                  (bitvector->bits (bv (+ a b) 5))
                                  (format "inputs ~a ~a" a b))])))))

;; This builds on add-two-lists, and adds all lists together (one or more).
;; We cannot handle zero lists because we don't know the bit width to output.
;; LRType:
;; + operands: (list (list (list (bitvector 1))))
;; + returns: (list (list (bitvector 1)))
(define (add-all-lists operands #:INIT0 [INIT0 #f] #:INIT1 [INIT1 #f])
  (define (add-helper a b)
    (add-two-lists a b #:INIT0 INIT0 #:INIT1 INIT1))
  (match operands
    ['() (error "cannot apply adder to empty list (unknown bitwidth!)")]
    ;; If there is only a single item to be added just return it!
    [(list a) a]
    [(list a b) (add-helper a b)]
    ;; Note: since we already check for length 2 lists above this should never
    ;; match when `rst` is empty!
    [(list a b rst ...)
     (add-helper (add-all-lists rst #:INIT0 INIT0 #:INIT1 INIT1) (add-helper a b))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;  TESTS FOR `add-all-lists  ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(module+ test
  (require rackunit)
  (define (test-for-vals . operands)
    (define rands
      (for/list ([rand operands])
        (map list (bitvector->bits rand))))
    (interpret (add-all-lists rands #:INIT0 (bv #x6ffe 16) #:INIT1 (bv #x6ffe 16))))

  (test-case "add pairs of 1-bit numbers"
             (begin
               (printf "\033[34m Testing pairs of 1-bit numbers\033[0m\n")
               (for* ([a (range 2)] [b (range 2)])
                 (let ([interpreted (test-for-vals (bv a 1) (bv b 1))])
                   (check-equal? (map first interpreted)
                                 (bitvector->bits (bv (+ a b) 1))
                                 (format "inputs ~a ~a" a b)))
                 (report-memoization))))

  (test-case "add triples of 4-bit numbers"
             (begin
               (printf "\033[34m Testing triples of 4-bit numbers\033[0m\n")
               (for* ([a (range 0 16 2)] [b (range 0 16 3)] [c (range 1 16 2)])
                 (let ([interpreted (test-for-vals (bv a 4) (bv b 4) (bv c 4))])
                   (check-equal? (map first interpreted)
                                 (bitvector->bits (bv (+ a b c) 4))
                                 (format "inputs ~a ~a ~a" a b c))))))

  (test-case "add triples of 5-bit numbers"
             (begin
               (printf "\033[34m Testing triples of 5-bit numbers\033[0m\n")
               (for* ([a (range 0 11 1)] [b (range 11 32 2)] [c (range 0 32 5)])
                 (let ([interpreted (test-for-vals (bv a 5) (bv b 5) (bv c 5))])
                   (check-equal? (map first interpreted)
                                 (bitvector->bits (bv (+ a b c) 5))
                                 (format "inputs ~a ~a ~a" a b c))))))

  (test-case "add 8-tuples of 8-bit numbers"
             (begin
               (printf "\033[34m Adding 8-tuples of 8-bit numbers\033[0m\n")
               ;; We iterate over a large number inputs. This blows up real fast so we
               ;; constrain the first few inputs to only range over a single number
               (for* ([a (range 0 1 1)]
                      [b (range 30 31 1)]
                      [c (range 40 41 1)]
                      [d (range 50 76 25)]
                      [e (range 100 120 19)]
                      [f (range 130 162 31)]
                      [g (range 165 249 73)]
                      [h (range 150 256 55)])
                 (let ([interpreted (test-for-vals (bv a 8)
                                                   (bv b 8)
                                                   (bv c 8)
                                                   (bv d 8)
                                                   (bv e 8)
                                                   (bv f 8)
                                                   (bv g 8)
                                                   (bv h 8))])
                   (check-equal? (map first interpreted)
                                 (bitvector->bits (bv (+ a b c d e f g h) 8))
                                 (format "inputs ~a ~a ~a ~a ~a ~a ~a ~a" a b c d e f g h)))))))

; An exponential solution to multiplication. This template sets up output bit i
; to be a function of input bits j for j <= i.
;
; That is, the 3rd output bit depends on input bits a0 a1 a2 a3 b0 b1 b2 b3.
;
; Each new bit to a LUT requires a doubling of the LUT memory. Since increasing
; the bit size by 1 increases input bits by 2 (one for each logical input), this
; results in a 4x LUT memory size each time we increment the bitsize.
;
; TODO: This is much more general than for multiplication, and can handle any
; function where output bit i is determined by all bits less than or equal to i.
(define (nbit-mul-exponential a b)
  ;; TODO: zero-extend the smaller bv?
  (when (not (= (bvlen b) (bvlen a)))
    (error "Unequal input sizes to nbit-mul-exponential"))
  (let* ([n (bvlen a)]
         [bits-out (for/list ([bit-idx (range n)])
                     (make-lattice-n-bit-lookup-expr
                      (concat (extract bit-idx 0 a) (extract bit-idx 0 b))))])
    `(extract ,(sub1 n) 0 (first (physical-to-logical-mapping (bitwise) ,bits-out)))))

(define (and-lut-helper a b i j #:INIT [INIT (?? (bitvector 16))])
  (if (> i j)
      (list (bv 0 1))
      (let* ([a-idx (- j i)]
             [b-idx i]
             [lut-inputs
              `(concat (extract ,a-idx ,a-idx ,a) (extract ,b-idx ,b-idx ,b) ,(bv 1 1) ,(bv 1 1))])
        (make-lattice-lut4-expr lut-inputs #:INIT INIT))))

; Create a lakeroad expression capable of discovering `bitwidth`-bit
; multiplication.
;
; Note: bitwith must be specified since we may now get a `choose` instead of a
; symbolic bitvector.
(define (lattice-mul-with-carry bitwidth
                                a
                                b
                                #:AND-LUT-INIT [and-lut-init (?? (bitvector 16))]
                                #:ADD-LUT-INIT [add-lut-init (?? (bitvector 16))])
  ;; TODO: zero-extend the smaller bv?
  (let* (; Generate a list of lists of bitwise ands:
         ; (list
         ;   (list a0b0     a1b0     a2b0      a3b0)
         ;   (list (bv 0 1) a0b1     a1b1      a2b1)
         ;   (list (bv 0 1) (bv 0 1) a0b2      a1b2)
         ;   (list (bv 0 1) (bv 0 1) (bv 0 1)  a0b3))
         ;
         ; The i-jth entry has the properties that:
         ; + entry i-j is `(bv 0 1)` when i > j
         ; + entry i-j is `a(j-i)bi` when i <= j

         ; This helper lambda extracts the input bits from `a` and `b` for
         ; index (i, j) and pads this with `(bv 1 1)` bitvecs to be fed to
         ; a LUT4. It then feeds these into a LUT4 as inputs, and returns
         ; the LUT4. If i > j, returns `(bv 0 0)
         ;
         ; E.g., for i = 3, j = 2, returns (bv 0 0)
         ;   and for i = 2, j = 3, returns (list (extract 1 1 a) (extract 2 2 b) (bv 0 1) (bv 0 1))
         ;
         ; Note: these bits are in reverse order of how you would expect to see
         ; them in a normal addition: that is, you'd expect this to be set up
         ; as:
         ;     a3b0 a2b0 a1b0 a0b0
         ;     a2b1 a1b1 a0b1    0
         ;     a1b2 a0b2    0    0
         ;     a0b3    0    0    0
         ;
         ; but the returned matrix reverses the order of the columns.
         ;; and-luts contains rows of luts. Each row corresponds to a number to be added
         [and-luts (for/list ([i (range bitwidth)])
                     (for/list ([j (range bitwidth)])
                       (and-lut-helper a b i j #:INIT and-lut-init)))]
         [output (add-all-lists and-luts #:INIT0 add-lut-init #:INIT1 add-lut-init)]
         [output2 (for/list ([x output])
                    `(first ,x))])
    `(extract ,(sub1 bitwidth) 0 (first (physical-to-logical-mapping (bitwise) ,output2)))))

(module+ test
  (require rackunit
           rosette/solver/smt/boolector)

  (current-solver (boolector))

  ; Helper function that returns a list
  ;
  ;   (a b bv-expr lakeroad-expr soln complete-soln evaluated runner)
  (define (mul-test-helper nbits #:AND-LUT-INIT [and-lut-init #f] #:ADD-LUT-INIT [add-lut-init #f])
    (clear-terms!)
    (clear-vc!)
    (define-symbolic a b (bitvector nbits))
    (define lakeroad-expr
      (lattice-mul-with-carry nbits a b #:AND-LUT-INIT and-lut-init #:ADD-LUT-INIT add-lut-init))
    (define bv-expr (bvmul a b))
    (define interpreted (interpret lakeroad-expr))

    (define soln
      (synthesize #:forall (list a b)
                  #:guarantee (begin
                                (assert (bveq bv-expr interpreted)))))
    (define complete-soln
      (complete-solution soln
                         (set->list (set-subtract (list->set (symbolics lakeroad-expr))
                                                  (list->set (symbolics bv-expr))))))
    (define evaluated (and (sat? soln) (evaluate lakeroad-expr complete-soln)))
    (define (runner x y)
      ; a helper to replace an expression's a and b instances with x and y
      (define x-bv
        (cond
          [(int? x) (bv x nbits)]
          [(bitvector? x) x]
          [else (error "Bad value for x")]))
      (define y-bv
        (cond
          [(int? y) (bv y nbits)]
          [(bitvector? y) y]
          [else (error "Bad value for y")]))
      (define (helper expr)
        (cond
          [(list? expr) (map helper expr)]
          [(equal? (format "~a" expr) "a") x-bv]
          [(equal? (format "~a" expr) "b") y-bv]
          [else expr]))
      (let ([expr-replaced (helper evaluated)]) (interpret expr-replaced)))
    (list a b bv-expr lakeroad-expr soln complete-soln evaluated runner))

  ; test that implementation (returned as `evaluated` from the helper), applied to
  ; arguments x and y
  (displayln "=== Running multiplication tests ===")
  (test-begin (displayln " --- 1 bit ---")
              (match-define (list a b bv-expr lakeroad-expr soln complete-soln evaluated runner)
                (mul-test-helper 1))
              (report-memoization)
              (printf "1 * 1 = ~a\n" (runner 1 1))
              (printf "0 * 1 = ~a\n" (runner 0 1))
              (check-true (sat? soln)))

  (test-begin (displayln " --- 2 bit ---")
              (match-define (list a b bv-expr lakeroad-expr soln complete-soln evaluated runner)
                (mul-test-helper 2))
              (report-memoization)
              (printf "1 * 2 = ~a\n" (runner 1 2))
              (printf "0 * 1 = ~a\n" (runner 0 1))
              (check-true (sat? soln)))

  (test-begin (displayln " --- 3 bit ---")
              (match-define (list a b bv-expr lakeroad-expr soln complete-soln evaluated runner)
                (mul-test-helper 3))
              (report-memoization)
              (printf "0 * 1 = ~a\n" (runner 0 0))
              (printf "0 * 1 = ~a\n" (runner 0 1))
              (printf "3 * 1 = ~a\n" (runner 3 1))
              (printf "1 * 2 = ~a\n" (runner 1 2))
              (check-true (sat? soln)))

  (test-begin (displayln " --- 4 bit ---")
              (match-define (list a b bv-expr lakeroad-expr soln complete-soln evaluated runner)
                (mul-test-helper 4))
              (report-memoization)
              (printf "0 * 1 = ~a\n" (runner 0 0))
              (printf "0 * 1 = ~a\n" (runner 0 1))
              (printf "2 * 3 = ~a\n" (runner 2 3))
              (printf "4 * 2 = ~a\n" (runner 4 2))
              (check-true (sat? soln)))

  (test-begin (displayln " --- 8 bit ---")
              (match-define (list a b bv-expr lakeroad-expr soln complete-soln evaluated runner)
                (mul-test-helper 8))
              (report-memoization)
              (printf "10 * 20 = ~a\n" (runner 10 20))
              (printf "19 * 11 = ~a\n" (runner 19 11))
              (printf "33 * 4 = ~a\n" (runner 33 4))
              (printf "17 * 5 = ~a\n" (runner 17 5))
              (check-true (sat? soln))))

;;; Special case for 2bit multiplication
(define (2bit-mul a b #:INIT0 [INIT0 #f] #:INIT1 [INIT1 #f])
  (define a0 (extract 0 0 a))
  (define a1 (extract 1 1 a))
  (define b0 (extract 0 0 b))
  (define b1 (extract 1 1 b))
  (define m
    (list (make-lattice-lut4-expr (apply concat (list a0 b0 (bv 1 1) (bv 1 1))) #:INIT INIT0)
          (make-lattice-lut4-expr (apply concat (list a0 b0 a1 b1)) #:INIT INIT1)))
  `(extract 1 0 (first (physical-to-logical-mapping (bitwise) ,m))))

;;; Special case for 3bit multiplication
(define (3bit-mul a b #:INIT0 [INIT0 #f] #:INIT1 [INIT1 #f] #:INIT2 [INIT2 #f])
  (define a0 (extract 0 0 a))
  (define a1 (extract 1 1 a))
  (define a2 (extract 2 2 a))
  (define b0 (extract 0 0 b))
  (define b1 (extract 1 1 b))
  (define b2 (extract 2 2 b))
  (define m
    (list (make-lattice-lut4-expr (apply concat (list a0 b0 (bv 1 1) (bv 1 1))) #:INIT INIT0)
          (make-lattice-lut4-expr (apply concat (list a0 b0 a1 b1)) #:INIT INIT1)
          (make-lattice-lut6-expr (apply concat (list a0 b0 a1 b1 a2 b2)) #:INIT INIT2)))
  `(extract 2 0 (first (physical-to-logical-mapping (bitwise) ,m))))
