#lang rosette

(require rosette)

(provide gator-interpret)

(define (gator-interpret expr env id t cache)
  (when (< t 0)
    (error 'gator-interpret "i broke your freakin crap moron"))
  (match (list-ref expr id)
    [`(BV ,val ,bw) (bv val bw)]
    [`(Var ,name)
     (begin
       (when (not (symbol? name))
         (error 'gator-interpret "var is not a symbol")
         (let ([val (assoc name env)])
           (if val (cdr val) (error 'gator-interpret "var not found in env")))))]
    [`(Op ,op ,ids ...) (apply op (map (lambda (id) (gator-interpret expr env id t cache)) ids))]
    [`(Reg ,reg-id ,init)
     (if (= t 0)
         init
         (if (assoc t cache)
             (cdr (assoc t cache))
             (gator-interpret expr env reg-id (- t 1) cache)))]))

(module+ test
  (require rackunit)
  (define-syntax-rule (test-interpret #:name name expr env id t cache expected)
    (test-case name
      (equal? (gator-interpret expr env id t cache) expected)))

  (test-interpret #:name "interpret BV" (list `(BV ,#b1010 4)) '() 0 0 (list) (bv #b1010 4)))
