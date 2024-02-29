#lang rosette

(require rosette
         rosette/lib/destruct
         (prefix-in gator: "gator-language.rkt"))

(provide gator-interpret)

(define (gator-interpret expr env id t cache)
  (when (< t 0)
    (error 'gator-interpret "i broke your stupid crap moron"))
  (destruct
   (list-ref expr id)
   [(gator:bv val bitwidth) (bv val bitwidth)]
   [(gator:var name)
    (begin
      (when (not (symbol? name))
        (error 'gator-interpret (format "~a is not a symbol" name)))
      (env name t))]
   [(gator:op op ids) (apply op (map (lambda (id) (gator-interpret expr env id t cache)) ids))]
   [(gator:reg reg-id init)
    (if (= t 0)
        init
        (if (assoc t cache) (cdr (assoc t cache)) (gator-interpret expr env reg-id (- t 1) cache)))]
   [(gator:prim bs body-id)
    (let ([env-prime (lambda (var t) (gator-interpret expr env (dict-ref bs var) t cache))])
      ;;; TODO(@ninehusky): this isn't a a one-to-one translation from the paper;
      ;;; in the paper prog[body-id] becomes the program passed to interpret().
      ;;; That is, in the paper, once the body starts getting interpreted, there's not a
      ;;; way to get back to the original program.
      ;;; I don't immediately see how there's a problem with this, but may be worth revisiting.
      (gator-interpret expr env-prime body-id t cache))]))

(module+ test
  (require rackunit)
  (define-syntax-rule (test-interpret #:name name expr env id t cache expected)
    (test-case name
      (check-true (equal? (gator-interpret expr env id t cache) expected))))

  (test-interpret #:name "interpret BV" (list (gator:bv 10 4)) '() 0 0 (list) (bv 10 4))
  (test-interpret #:name "interpret Var"
                  (list (gator:var 'x))
                  (lambda (var t)
                    (when (not (equal? var 'x))
                      (error 'test-interpret "SHIT"))
                    (bv 10 4))
                  0
                  0
                  (list)
                  (bv 10 4))
  (test-interpret #:name "interpret add"
                  (list (gator:op bvadd (list 1 2)) (gator:bv 1 4) (gator:bv 2 4))
                  (list)
                  0
                  0
                  (list)
                  (bv 3 4))
  (test-interpret
   #:name "interpret extract"
   ;;; Observe that here, we can provide composition of arbitrary Rosette bv operators through currying, etc
   (list (gator:op (curry extract 2 1) (list 1)) (gator:bv -1 4))
   (list)
   0
   0
   (list)
   ;;; TODO(@ninehusky): potentially risky that bv is truncated here (i.e. bitwidth changes)
   ;;; but is probably okay because we support sign extending, etc
   (bv #b11 2))
  (test-interpret #:name "interpret single prim"
                  ;;; pseudocode:
                  ;;; def my_prim(y):
                  ;;;   return y + 1
                  ;;; def main(x):
                  ;;;   return my_prim(x)
                  ;;; main(2)
                  (list (gator:prim (list (cons 'y 4)) 1)
                        (gator:op bvadd (list 2 3))
                        (gator:bv 1 4)
                        (gator:var 'y)
                        (gator:var 'x))
                  (lambda (var t)
                    (when (not (equal? var 'x))
                      (error 'test-interpret "so stupid"))
                    (bv 2 4))
                  0
                  0
                  (list)
                  (bv 3 4))
  ;;; TODO(@ninehusky): okay later i'm gonna do use prims to abstract away muls
  ;;; rough idea: composition of muls like (assert (equal? (bvadd (bvmul 1 2) (bvmul 2 1)) (bv 4 4))
  )
