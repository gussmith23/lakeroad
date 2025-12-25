#lang racket

(provide assoc-ref
         bvlen
         bvtype
         dup-extend
         get-lakeroad-directory
         interleave
         window)

(require (only-in rosette concat bitvector bitvector->bits bitvector-size lsb bv define-symbolic)
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

(define (assoc-ref v alist)
  (cdr (or (assoc v alist) (error (format "Key ~a not found in alist ~a" v alist)))))
