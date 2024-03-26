#lang rosette

(require rosette
         rosette/lib/destruct
         (prefix-in gator: "gator-language.rkt"))

(provide gator-interpret)

(define (gator-interpret prog env id t cache)
  ;;; Maps symbols to their corresponding bvop
  (define bvops (list (cons 'And bvand) (cons 'Add bvadd)))
  (when (< t 0)
    (error 'gator-interpret "i broke your stupid crap moron"))
  (destruct (list-ref prog id)
            [(gator:int val) val] ; this might not be good -- now, this might not return a bv, so
            ; it doesn't exactly reflect the coq stuff we did.
            [(gator:string val) val]
            [(gator:bvop bvop) (dict-ref bvops bvop)]
            [(gator:bv val-id bw-id)
             (bv (gator-interpret prog env val-id t cache) (gator-interpret prog env bw-id t cache))]
            [(gator:var name-id bw-id) ; we don't do anything with bw
             (env (gator-interpret prog env name-id t cache) t)]
            [(gator:reg init-id) "reg: You shouldn't be evaluating me directly"]
            [(gator:extract high-id low-id)
             (lambda (bv)
               (extract (gator-interpret prog env high-id t cache)
                        (gator-interpret prog env low-id t cache)
                        bv))]
            [(gator:concat bv1-id bv2-id)
             (lambda (bv1 bv2)
               (concat (gator-interpret prog env bv1-id t cache)
                       (gator-interpret prog env bv2-id t cache)))]
            [(gator:op fn-id op-ids)
             (match (list-ref prog fn-id)
               [(gator:bvop ??)
                (apply (gator-interpret prog env fn-id t cache)
                       (map (lambda (id) (gator-interpret prog env id t cache)) op-ids))]
               [(gator:reg init-id)
                ;;; roughly, here's how it should go:
                ;;; let [clock-expr-id, data-expr-id] = op-ids;
                ;;; let bw = bitwidth (interpret data-expr-id t=0); # t = 0 should work, since
                ;;;                                                 # expr should always eval
                ;;;                                                 # to something
                ;;; let init-val = interpret init-id;
                ;;; lambda t:
                ;;;    if t = 0 then (bv init-val bw) else
                ;;;         (interpret data-expr-id (- t 1))
                (define clock-expr-id (car op-ids))
                (define data-expr-id (cadr op-ids))
                (match (gator-interpret prog env data-expr-id 0 cache)
                  [(bv val (bitvector bw)) (displayln (format "val is ~a, bw is ~a" val bw))]
                  [other (displayln (format "hi other is ~a" other))])
                (lambda (t) (if (= t 0) 1 2))
                (gator-interpret prog env fn-id t cache)]
               [(gator:bv val-id bw-id)
                (when (not (empty? op-ids))
                  (error 'gator-interpret "trying to call bv with op ids"))
                ;;; Just return the bitvector. Honestly am unsure
                ;;; why BV is considered an op in the egraph?
                (gator-interpret prog env fn-id t cache)])]))

(module+ test
  (require rackunit)
  (define-syntax-rule (test-interpret #:name name expr env id t cache expected)
    (test-case name
      (check-true (equal? (gator-interpret expr env id t cache) expected))))

  (test-interpret #:name "interpret int" (list (gator:int 1)) '() 0 0 (list) 1)
  (test-interpret #:name "interpret string" (list (gator:string "hi")) '() 0 0 (list) "hi")
  (test-interpret #:name "interpret bvop" (list (gator:bvop 'And)) '() 0 0 (list) bvand)
  (test-interpret #:name "interpret BV"
                  (list (gator:bv 1 2) (gator:int 1) (gator:int 8))
                  '()
                  0
                  0
                  (list)
                  (bv 1 8))
  (test-interpret #:name "interpret Var"
                  (list (gator:var 1 200) (gator:string "x"))
                  (lambda (var t)
                    (when (not (equal? var "x"))
                      (error 'test-interpret "panic!"))
                    (bv 10 4))
                  0
                  0
                  (list)
                  (bv 10 4))
  (test-interpret #:name "interpret bvop Op"
                  (list (gator:op 1 (list 2 3))
                        (gator:bvop 'Add)
                        (gator:bv 4 6)
                        (gator:bv 5 6)
                        (gator:int 1)
                        (gator:int 2)
                        (gator:int 6))
                  '()
                  0
                  0
                  (list)
                  (bv 3 6))
  (test-interpret #:name "interpret bv Op"
                  (list (gator:op 1 (list)) (gator:bv 2 2) (gator:int 1))
                  '()
                  0
                  0
                  (list)
                  (bv 1 1))
  (test-interpret #:name "interpret reg at t=0"
                  (list (gator:op 1 (list 2 3))
                        (gator:reg 2)
                        (gator:int 0)
                        (gator:op 1 (list 4 4))
                        (gator:bv 5 5)
                        (gator:int 3))
                  '()
                  0
                  0
                  (list)
                  (bv 0 3))
  ;;; TODO(@ninehusky): We can't really test extract in isolation because equal? can't verify
  ;;; that the function is the same.
  ;;; (test-interpret #:name "interpret extract"
  ;;;                 (list (gator:extract 1 2) (gator:int 2) (gator:int 1))
  ;;;                 '()
  ;;;                 0
  ;;;                 0
  ;;;                 (list)
  ;;;                 (lambda (bv) (extract 2 1 bv)))

  ;;; (test-interpret #:name "interpret Var"
  ;;;                 (list (gator:var 'x))
  ;;;                 (lambda (var t)
  ;;;                   (when (not (equal? var 'x))
  ;;;                     (error 'test-interpret "SHIT"))
  ;;;                   (bv 10 4))
  ;;;                 0
  ;;;                 0
  ;;;                 (list)
  ;;;                 (bv 10 4))
  ;;; (test-interpret #:name "interpret add"
  ;;;                 (list (gator:op bvadd (list 1 2)) (gator:bv 1 4) (gator:bv 2 4))
  ;;;                 (list)
  ;;;                 0
  ;;;                 0
  ;;;                 (list)
  ;;;                 (bv 3 4))
  ;;; (test-interpret
  ;;;  #:name "interpret extract"
  ;;;  ;;; Observe that here, we can provide composition of arbitrary Rosette bv operators through currying, etc
  ;;;  (list (gator:op (curry extract 2 1) (list 1)) (gator:bv -1 4))
  ;;;  (list)
  ;;;  0
  ;;;  0
  ;;;  (list)
  ;;;  ;;; TODO(@ninehusky): potentially risky that bv is truncated here (i.e. bitwidth changes)
  ;;;  ;;; but is probably okay because we support sign extending, etc
  ;;;  (bv #b11 2))
  ;;; (test-interpret #:name "interpret single prim"
  ;;;                 ;;; pseudocode:
  ;;;                 ;;; def my_prim(y):
  ;;;                 ;;;   return y + 1
  ;;;                 ;;; def main(x):
  ;;;                 ;;;   return my_prim(x)
  ;;;                 ;;; main(2)
  ;;;                 (list (gator:prim (list (cons 'y 4)) 1)
  ;;;                       (gator:op bvadd (list 2 3))
  ;;;                       (gator:bv 1 4)
  ;;;                       (gator:var 'y)
  ;;;                       (gator:var 'x))
  ;;;                 (lambda (var t)
  ;;;                   (when (not (equal? var 'x))
  ;;;                     (error 'test-interpret "so stupid"))
  ;;;                   (bv 2 4))
  ;;;                 0
  ;;;                 0
  ;;;                 (list)
  ;;;                 (bv 3 4))
  ;;; TODO(@ninehusky): okay later i'm gonna do use prims to abstract away muls
  ;;; rough idea: composition of muls like (assert (equal? (bvadd (bvmul 1 2) (bvmul 2 1)) (bv 4 4))
  )
