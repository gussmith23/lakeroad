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
         run-lakeroad
         interleave
         window)

(require rosette
         rosette/base/core/polymorphic
         racket/runtime-path)

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
    [(? constant? a) (format "(~a & ~aULL)" a (- (expt 2 (bvlen a)) 1))]))

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

(define (interleave args)
  (flatten (apply map list args)))

(define (window xs size)
  (cond
    [(= (length xs) 0) (list)]
    [(<= (length xs) size) (list xs)]
    [else (cons (take xs size) (window (drop xs size) size))]))
