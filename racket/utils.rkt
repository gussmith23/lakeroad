#lang errortrace racket

(provide bvlen
         bvtype
         dup-extend
         bvexpr->cexpr
         get-lakeroad-directory
         json->verilog
         ??*
         make-n-symbolics
         rdisplayln
         rprintf
         run-lakeroad)

(require rosette
         rosette/base/core/polymorphic
         racket/runtime-path
         racket/random)

;;; Length of bitvector.
(define (bvlen v)
  (length (bitvector->bits v)))

;;; Creates a bit vector of type ty such that it contains only
;;; the least significant digit of v.
(define (dup-extend v ty)
  (apply concat (make-list (bitvector-size ty) (lsb v))))

(module+ test
  (require rackunit)
  (check-equal? (bvlen (bv 2 2)) 2)
  (check-equal? (bvlen (bv 0 3)) 3)
  (define-symbolic a (bitvector 8))
  (check-equal? (bvlen a) 8))

;;; Type of bitvector.
(define (bvtype v)
  (bitvector (bvlen v)))

(module+ test
  (require rackunit)
  (check-true ((bvtype (bv 2 2)) (bv 0 2)))
  (check-true ((bvtype (bv 2 2)) (bv 1 2)))
  (check-true ((bvtype (bv 2 2)) (bv 2 2)))
  (check-false ((bvtype (bv 2 2)) (bv 0 3)))
  (check-false ((bvtype (bv 2 2)) (bv 1 3)))
  (define-symbolic b (bitvector 8))
  (define-symbolic c (bitvector 8))
  (define-symbolic d (bitvector 3))
  (check-true ((bvtype b) c))
  (check-false ((bvtype b) d)))

;;; Rosette bitvector expression to C expression.
(define (bvexpr->cexpr expr)
  (string-append
   "("
   (match expr
     [(expression (== concat) a b)
      (format "((((uint64_t)~a) << ~a) | (~a))" (bvexpr->cexpr a) (bvlen b) (bvexpr->cexpr b))]
     [(expression (== extract) h l v)
      ;;; Just b/c I'm lazy. Doesn't have to be the case.
      (when (or (not (concrete? h)) (not (concrete? l)))
        (error "Only supporting concrete h and l for now."))
      (format "((~a >> ~a) & ((1<<(~a - ~a + 1)) - 1))" (bvexpr->cexpr v) l h l)]
     [(expression (== bvlshr) a b)
      ;;; Shifting by more than the length of the bitvector is undefined in C.
      (format "((~a > ~a) ? 0 : (((uint64_t)~a) >> ~a))"
              (bvexpr->cexpr b)
              (bvlen a)
              (bvexpr->cexpr a)
              (bvexpr->cexpr b))]
     [(expression (== bvashr) a b)
      ;;; TODO(@gussmith23): Signedness is really messed up. Do we need to convert back to unsigned
      ;;; here?
      (format
       "((~a > ~a) ? ((~a & (1<<~a)) ? ((uint64_t)~a) : 0) : ((uint64_t)(((int64_t) ( ~a | ((~a & (1<<~a)) ? (0xFFFFFFFFFFFFFFFF&(~~((uint64_t)~a))) : 0)  )) >> ~a)))"
       (bvexpr->cexpr b)
       (bvlen a)
       (bvexpr->cexpr a)
       (sub1 (bvlen a))
       (string-append "0b" (make-string (bvlen a) #\1))
       (bvexpr->cexpr a)
       (bvexpr->cexpr a)
       (sub1 (bvlen a))
       (string-append "0b" (make-string (bvlen a) #\1))
       (bvexpr->cexpr b))]
     [(expression (== zero-extend) a b) (bvexpr->cexpr a)]
     [(expression (== bvult) a b)
      (when (> (bvlen a) 64)
        (error))
      (when (> (bvlen b) 64)
        (error))
      (format "((uint8_t)((uint64_t)~a < (uint64_t)~a))" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvule) a b)
      (when (> (bvlen a) 64)
        (error))
      (when (> (bvlen b) 64)
        (error))
      (format "((uint8_t)((uint64_t)~a <= (uint64_t)~a))" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvugt) a b)
      (when (> (bvlen a) 64)
        (error))
      (when (> (bvlen b) 64)
        (error))
      (format "((uint8_t)((uint64_t)~a > (uint64_t)~a))" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvuge) a b)
      (when (> (bvlen a) 64)
        (error))
      (when (> (bvlen b) 64)
        (error))
      (format "((uint8_t)((uint64_t)~a >= (uint64_t)~a))" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== ite) cond a b)
      (format "(~a ? ~a : ~a)" (bvexpr->cexpr cond) (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bveq) a b) (format "((uint8_t)(~a == ~a))" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvand) a b) (format "(~a & ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvxor) a b) (format "(~a ^ ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvor) a b) (format "(~a | ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvsub) a b) (format "(~a - ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvadd) a b) (format "(~a + ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(expression (== bvnot) a) (format "(~~~a)" (bvexpr->cexpr a))]
     [(expression (== bvneg) a) (format "(-~a)" (bvexpr->cexpr a))]
     [(expression (== bvshl) a b)
      (format "((~a > ~a) ? 0 : (~a << ~a))"
              (bvexpr->cexpr b)
              (bvlen a)
              (bvexpr->cexpr a)
              (bvexpr->cexpr b))]
     [(expression (== bvmul) a b) (format "(~a * ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
     [(? concrete? (? (bitvector 1) a)) (format "((bool) ~a)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 2) a)) (format "((uint8_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 3) a)) (format "((uint8_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 4) a)) (format "((uint8_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 5) a)) (format "((uint8_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 6) a)) (format "((uint8_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 7) a)) (format "((uint8_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 8) a)) (format "((uint8_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 12) a)) (format "((uint16_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 16) a)) (format "((uint16_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 32) a)) (format "((uint32_t) ~aULL)" (bitvector->natural a))]
     [(? concrete? (? (bitvector 64) a)) (format "((uint64_t) ~aULL)" (bitvector->natural a))]
     ;;; We suffix the mask with ULL to be safe.
     [(? constant? a) (format "(~a & ~aULL)" a (- (expt 2 (bvlen a)) 1))])
   ;;; Treat booleans differently - (bvlen (bveq a b)) throws an error.
   (format " & ~aULL)" (if (boolean? expr) 1 (- (expt 2 (bvlen expr)) 1)))))

(module+ test
  (define-syntax-rule (semantic-test #:name name
                                     #:defines defines
                                     ...
                                     #:bv-expr bv-expr
                                     #:c-expr c-expr)
    (test-case
     name
     (with-terms
      (begin
        defines ...
        (define cexpr (bvexpr->cexpr bv-expr))

        ;;; Optional syntactic test.
        (if c-expr (check-equal? cexpr c-expr) 0)

        ;;; Save C code to file
        (define cfile-filename (make-temporary-file "~a.c"))
        (define cfile (open-output-file cfile-filename #:exists 'replace))
        (displayln "#include <stdint.h>" cfile)
        (displayln "#include <stdio.h>" cfile)
        (displayln "#include <stdlib.h>" cfile)
        (displayln "int main(int argc, char* argv[]) {" cfile)
        (for ([(i id) (in-indexed (symbolics bv-expr))])
          (displayln (format "uint64_t ~a = atoll(argv[~a]);" i (+ id 1))
                     cfile)) ;;; add 1 to ID to offset that argv[0] -> filename
        (displayln (format "printf(\"%llu\", ~a);" cexpr) cfile)
        (displayln "return 0;" cfile)
        (displayln "}" cfile)

        (close-output-port cfile)
        (define executable-filename (make-temporary-file "~a.out"))
        (check-true (system (format "gcc -o ~a ~a" executable-filename cfile-filename)))

        (define (generate-values symbols)
          (let* ([bitwidth (bvlen (car symbols))])
            ;;; If the bitwidth is sufficiently small, then generate exhaustive testing arguments over every possible combination of values.
            (if (< bitwidth 8)
                (apply cartesian-product
                       (map (lambda (symbol) (range 0 (- (expt 2 (bvlen symbol)) 1))) symbols))
                ;;; otherwise, randomly select ~2^16 tuples of values, each value ranging from 1 to min(2^bvlen, max_random_int)
                (build-list 65535
                            (lambda (i)
                              (build-list (length symbols)
                                          (lambda (j)
                                            (min (- (expt 2 (bvlen (car symbols))) 1)
                                                 (random 4294967087)))))))))

        (for ([args (generate-values (symbolics bv-expr))])
          (begin
            ;;; We use zip to give `evaluate` a hash from each symbolic constant to a given value in an element of `args`.
            (define (zip lst1 lst2)
              (cond
                [(and (null? lst1) (null? lst2)) '()]
                [(or (null? lst1) (null? lst2)) (error "unequal lengths")]
                [#t
                 (begin
                   (cons (cons (car lst1) (bv (car lst2) (bvlen (car lst1))))
                         (zip (cdr lst1) (cdr lst2))))]))
            (define result
              (evaluate bv-expr (sat (make-immutable-hash (zip (symbolics bv-expr) args)))))
            (define output
              (string->number
               (with-output-to-string
                (thunk (apply system* executable-filename (map number->string args))))))
            ;;; note: for larger(?) integers (check-eq? num (string->number "num")) fails. switched to check-equal?
            (check-equal? output
                          (if (boolean? result)
                              (bitvector->natural (bool->bitvector result))
                              (bitvector->natural result)))))
        (clear-terms! (symbolics bv-expr))))))

  ;;; Basic cases that do not work.
  ;;; (for ([sz (list 32)])
  ;;;   ;;; Here, concatenating two bv64s throws a compile error. The integeral literal in the bitmask
  ;;;   ;;; required to represent all 128 bits isn't possible to write out.
  ;;;   (semantic-test
  ;;;    #:name "basic concat"
  ;;;    #:defines (define-symbolic a b (bitvector sz))
  ;;;    #:bv-expr (concat a b)
  ;;;    #:c-expr #f)

  ;;;   (semantic-test
  ;;;    #:name "basic bvlshr"
  ;;;    #:defines (define-symbolic a (bitvector sz))
  ;;;    #:bv-expr (bvlshr a (bv (random (- sz 1)) sz))
  ;;;    #:c-expr #f)

  ;;;   (semantic-test
  ;;;    #:name "basic bvashr"
  ;;;    #:defines (define-symbolic a (bitvector sz))
  ;;;    #:bv-expr (bvashr a (bv (random (- sz 1)) sz))
  ;;;    #:c-expr #f)
  ;;;   )

  ;;; Basic test cases that work well with bitvector sizes up to 64.
  (for ([sz (list 1 2 3 16 32 64)])
    (let* ([j (random sz)] [i (+ j (random (- sz j)))])
      (semantic-test #:name "basic extract"
                     #:defines (define-symbolic a (bitvector sz))
                     #:bv-expr (extract i j a)
                     #:c-expr #f))

    (semantic-test #:name "basic bveq"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bveq a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvadd"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvadd a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvand"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvand a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvxor"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvxor a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvor"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvor a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvsub"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvsub a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvnot"
                   #:defines (define-symbolic a (bitvector sz))
                   #:bv-expr (bvnot a)
                   #:c-expr #f)

    (semantic-test #:name "complex bvnot expression"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvnot (bvxor a b))
                   #:c-expr #f)

    (semantic-test #:name "complex bvnot expression"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvnot (bvxor a b))
                   #:c-expr #f)

    (semantic-test #:name "basic bvneg"
                   #:defines (define-symbolic a (bitvector sz))
                   #:bv-expr (bvneg a)
                   #:c-expr #f)

    (semantic-test #:name "basic bvshl"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvshl a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvult"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvult a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvle"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvule a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvgt"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvugt a b)
                   #:c-expr #f)

    (semantic-test #:name "basic bvmul"
                   #:defines (define-symbolic a b (bitvector sz))
                   #:bv-expr (bvmul a b)
                   #:c-expr #f))

  ;;; More complex cases that string together many operators.
  (for ([sz (list 1 2 3 4 16 32 64)])
    (semantic-test #:name "complex bvadd expression"
                   #:defines (define-symbolic a b c (bitvector sz))
                   #:bv-expr (bvadd (bvadd a b) c)
                   #:c-expr #f)

    (semantic-test #:name "complex expression with lots of arithmetic operators"
                   #:defines (define-symbolic a b c (bitvector sz))
                   #:bv-expr (bvsub (bvadd (bvmul b (bvxor (bvadd a c) (bvsub a c))))
                                    (bvnot (bvneg (bvadd (bvmul b c) b))))
                   #:c-expr #f)))

(define (json->verilog json verilog #:logfile [logfile "/dev/null"])
  (let ([command
         (format "yosys -p \"read_json ~a ; write_verilog ~a\" > ~a 2>&1" json verilog logfile)])
    (when (not (system command))
      (error (format "Failed to translate JSON to Verilog w/ command: `~a`" command)))))

(define (make-n-symbolics n type)
  (define (helper)
    (define-symbolic* x type)
    x)
  (for/list ([x (range n)])
    (helper)))

(define (??* shape)
  (define (helper)
    (define-symbolic* hole shape)
    hole)
  (helper))

;; This function displays a new line with the value v and then returns the value
(define (rdisplayln v)
  (displayln v)
  v)

;; This function prints a value using printf syntax and then returns a value.
;; By default rprintf returns the first argument passed as a format string.
;; This can be overridden by specifying the #:RETURN argument (defaults to
;; 'default-return-value)
(define (rprintf s #:RETURN [return 'default-return-value] . args)
  (apply printf s args)
  ;; Now return the value. Default to the first argument unless another value
  ;; was passed.
  (if (equal? return 'default-return-value) (if (empty? args) #f (first args)) return))

; Runs a fully formed (no holes!) lakeroad program `p` with inputs
; defined by `inputs`. `inputs` is a hash table mapping symbolic variables to
(define (run-lakeroad p inputs interpreter)
  ; TODO: is there a nicer way to make a model?
  (define sol
    (solve (for ([input (hash-keys inputs)])
             (assume (bveq input (hash-ref inputs input))))))
  (evaluate (interpreter p) sol))

(define-runtime-path LAKEROAD_DIR "..")
(define (get-lakeroad-directory)
  LAKEROAD_DIR)
