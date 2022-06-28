#lang errortrace racket

(provide bvlen
         bvtype
         bvexpr->cexpr
         json->verilog)

(require rosette)

;;; Length of bitvector.
(define (bvlen v)
  (length (bitvector->bits v)))

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
    [(expression (== bvand) a b) (format "(~a & ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvxor) a b) (format "(~a ^ ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvor) a b) (format "(~a | ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvsub) a b) (format "(~a - ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvadd) a b) (format "(~a + ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvnot) a) (format "(~~~a)" (bvexpr->cexpr a))]
    [(expression (== bvneg) a) (format "(-~a)" (bvexpr->cexpr a))]
    [(expression (== bvshl) a b) (format "(~a << ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(expression (== bvmul) a b) (format "(~a * ~a)" (bvexpr->cexpr a) (bvexpr->cexpr b))]
    [(? concrete? (? (bitvector 8) a)) (format "((uint8_t) ~a)" (bitvector->natural a))]
    [(? concrete? (? (bitvector 16) a)) (format "((uint16_t) ~a)" (bitvector->natural a))]
    [(? constant? a) (~a a)]))

(define (json->verilog json verilog)
  (let ([command (format "yosys -p \"read_json ~a ; write_verilog ~a\"" json verilog)])
    (when (not (system command))
      (error (format "Failed to translate JSON to Verilog w/ command: `~a`" command)))))
