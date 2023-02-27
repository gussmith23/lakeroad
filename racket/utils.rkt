#lang racket

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
        (define bv-symbolics (symbolics bv-expr))
        (define fuzzing-space-size 4096)

        ;;; Helper function for generating testing input.
        ;;; Given a list of n symbols, generate a list of n-tuples. The ith value in the tuple
        ;;; is a bitvector value that the ith symbolic constant will be set to.
        (define (generate-values symbols)
          (let* ([iteration-space-size (expt 2 (apply + (map bvlen symbols)))])
            ;;; We choose to exhaustively test by looking at the iteration space of bv-expr's symbolics.
            ;;; If the space is smaller than fuzzing-space-size, then we use exhaustive testing -
            ;;; otherwise, we generate a random subset of the iteration space.
            (if (<= iteration-space-size fuzzing-space-size)
                (apply cartesian-product
                       (for/list ([symbol bv-symbolics])
                         (for/list ([i (range 0 (expt 2 (bvlen symbol)))])
                           (bv i (bvlen symbol)))))
                ;;; randomly select tuples of values, each value ranging from
                ;;; 1 to min(2^bvlen - 1, max_random_int)
                (build-list fuzzing-space-size
                            (lambda (i)
                              (let ([random-max-int 4294967087])
                                (map (lambda (curr-bv)
                                       (bv (random (min (expt 2 (bvlen curr-bv)) random-max-int))
                                           (bvlen curr-bv)))
                                     bv-symbolics)))))))

        ;;; Optional syntactic test.
        (when c-expr
          (check-equal? cexpr c-expr))

        ;;; Generate values to test over.
        (define bv-tuples (generate-values bv-symbolics))

        ;;; Save arguments to file.
        (define args-filename (make-temporary-file "~a.txt"))
        (define args-file (open-output-file args-filename #:exists 'replace))
        (for ([bv-tuple bv-tuples])
          (let* ([number-tuple (map bitvector->natural bv-tuple)])
            (displayln number-tuple args-file)))
        (close-output-port args-file)

        ;;; Save C code to file
        (define cfile-filename (make-temporary-file "~a.c"))

        (with-output-to-file
         cfile-filename
         #:exists 'replace
         (lambda ()
           (displayln "#include <stdint.h>")
           (displayln "#include <stdio.h>")
           (displayln "#include <stdlib.h>")
           (displayln "int main(int argc, char* argv[]) {")
           (displayln (format "FILE *fp = fopen(\"~a\", \"r\");" args-filename))
           (displayln "if (!fp) { return 1; }")
           (displayln (format "for (int i = 0; i < ~a; i++) {" (length bv-tuples)))
           (displayln (format "uint64_t values[~a];" (length bv-symbolics)))
           (displayln "if (fgetc(fp) != '(') { return 1; }")
           (displayln (format "for (int j = 0; j < ~a; j++) {" (length (car bv-tuples))))
           (displayln "fscanf(fp, \"%lu\", &values[j]);")
           (displayln "}")
           (displayln "if (fgetc(fp) != ')') { return 1; }")
           (displayln "if (fgetc(fp) != '\\n') { return 1; }")
           (for ([(bv-name idx) (in-indexed (symbolics bv-expr))])
             (displayln (format "uint64_t ~a = values[~a];" bv-name idx)))
           (displayln (format "printf(\"%llu\\n\", ~a);" cexpr))
           (displayln "}")
           (displayln "return 0;")
           (displayln "}")))

        (define executable-filename (make-temporary-file "~a.out"))
        (check-true (system (format "gcc -o ~a ~a" executable-filename cfile-filename)))

        (define c-result
          (map string->number
               (string-split (with-output-to-string (thunk (system* executable-filename))) "\n")))

        (for ([bv-tuple bv-tuples] [current-c-result c-result])
          (begin
            (define rosette-result
              (with-vc
               (evaluate bv-expr (sat (make-immutable-hash (map cons bv-symbolics bv-tuple))))))
            (check-true (normal? rosette-result))
            (check-equal? current-c-result
                          (let ([rosette-value-num (result-value rosette-result)])
                            (bitvector->natural (if (boolean? rosette-value-num)
                                                    (bool->bitvector rosette-value-num)
                                                    rosette-value-num))))))

        (clear-terms! (symbolics bv-expr))))))

  ;;; Basic cases that do not work. (GitHub issue #171)
  ;;;   (for ([sz (list 1 2 3 4 5 6 7 8 12 16 32 64)])
  ;;;   ;;; Here, concatenating two bv64s throws a compile error. The integer literal in the bitmask
  ;;;   ;;; required to represent all 128 bits isn't possible to include in a C file.
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

  ;;; (semantic-test #:name "basic bvashr"
  ;;;                #:defines (define-symbolic a (bitvector sz))
  ;;;                #:bv-expr (bvashr a (bv (random (- sz 1)) sz))
  ;;;                #:c-expr #f))

  ;;; Basic test cases that work well with bitvector sizes up to 64.
  (for ([sz (list 1 2 3 4 5 6 7 8 12 16 32 64)])
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
  (for ([sz (list 1 2 3 4 5 6 7 8 12 16 32 64)])
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
