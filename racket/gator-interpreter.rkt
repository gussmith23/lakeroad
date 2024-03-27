#lang rosette

(require rosette
         rosette/lib/destruct
         (prefix-in gator: "gator-language.rkt"))

(provide gator-interpret)

(define (gator-interpret prog env id t cache)
  ;;; Maps symbols to their corresponding bvop
  (define bvops (list (cons 'And bvand) (cons 'Add bvadd) (cons 'Concat concat)))
  (when (< t 0)
    (error 'gator-interpret "i broke your stupid crap moron"))
  (destruct
   (list-ref prog id)
   [(gator:int val) val] ; this might not be good -- now, this might not return a bv, so
   ; it doesn't exactly reflect the coq stuff we did.
   [(gator:string val) val]
   [(gator:bvop bvop) (dict-ref bvops bvop)]
   [(gator:bv val-id bw-id)
    (bv (gator-interpret prog env val-id t cache) (gator-interpret prog env bw-id t cache))]
   [(gator:var name-id bw-id) ; we don't do anything with bw
    (env (gator-interpret prog env name-id t cache) t)]
   [(gator:reg init-id) "reg: You shouldn't be evaluating me directly"]
   ;;; a bitvector type will just evaluate to its bitwidth
   [(gator:type type child-ids)
    (match type
      ['Bitvector (car child-ids)])]
   [(gator:extract high-id low-id)
    (lambda (bv)
      (extract (gator-interpret prog env high-id t cache)
               (gator-interpret prog env low-id t cache)
               bv))]
   [(gator:concat bv1-id bv2-id)
    (lambda (bv1 bv2)
      (concat (gator-interpret prog env bv1-id t cache) (gator-interpret prog env bv2-id t cache)))]
   [(gator:op-reg reg-id type-id op-ids)
    (match-let* ([(list clock-id data-expr-id) op-ids]
                 [(gator:reg init-id) (list-ref prog reg-id)]
                 [init-val (gator-interpret prog env init-id t cache)]
                 [bitwidth (gator-interpret prog env type-id t cache)])
      (lambda (t)
        (if (= t 0) (bv init-val bitwidth) (gator-interpret prog env data-expr-id (- t 1) cache))))]
   [(gator:op fn-id op-ids)
    (match (list-ref prog fn-id)
      [(gator:bvop ??)
       (apply (gator-interpret prog env fn-id t cache)
              (map (lambda (id) (gator-interpret prog env id t cache)) op-ids))]
      [(gator:reg init-id) (error 'gator-interpret "ops should be referring only to op-regs")]
      [(gator:bv val-id bw-id)
       (when (not (empty? op-ids))
         (error 'gator-interpret "trying to call bv with op ids"))
       (gator-interpret prog env fn-id t cache)]
      [(gator:extract high-id low-id)
       (let ([fn (gator-interpret prog env fn-id t cache)])
         (fn (gator-interpret prog env (car op-ids) t cache)))])]))

(module+ test
  (require rackunit)
  (define-syntax-rule (test-interpret #:name name expr env id t cache expected)
    (test-case name
      (let ([actual (gator-interpret expr env id t cache)])
        (check-true (equal? (gator-interpret expr env id t cache) expected)))))

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
  (test-case "interpret reg at t=0"
    (let ([prog (list (gator:op-reg 1 2 (list 4 5))
                      (gator:reg 3)
                      (gator:type 'Bitvector (list 3))
                      (gator:int 0)
                      (gator:var 7 6)
                      (gator:bv 6 6)
                      (gator:int 3)
                      (gator:string "clock"))]
          [env '()]
          [id 0]
          [t 0]
          [cache (list)])
      (check-true (bveq ((gator-interpret prog env id t cache) 0) (bv 0 3)))))
  (test-case "interpret reg at t=1"
    (let ([prog (list (gator:op-reg 1 2 (list 4 5))
                      (gator:reg 3)
                      (gator:type 'Bitvector (list 3))
                      (gator:int 0)
                      (gator:var 7 6)
                      (gator:bv 6 6)
                      (gator:int 3)
                      (gator:string "clock"))]
          [env '()]
          [id 0]
          [t 1]
          [cache (list)])
      (check-true (bveq ((gator-interpret prog env id t cache) 1) (bv 3 3)))))
  (test-case "interpret extract"
    (let ([prog (list (gator:op 1 (list 2))
                      (gator:extract 3 4)
                      (gator:bv 5 6)
                      (gator:int 2)
                      (gator:int 1)
                      (gator:int -1)
                      (gator:int 4))]
          [env '()]
          [id 0]
          [t 0]
          [cache (list)])
      (check-true (bveq (gator-interpret prog env id t cache) (bv 3 2)))))
  (test-case "interpret concat"
    (let ([prog (list (gator:op 1 (list 2 3))
                      (gator:bvop 'Concat)
                      (gator:bv 4 5)
                      (gator:bv 6 7)
                      (gator:int 0)
                      (gator:int 1)
                      (gator:int -1)
                      (gator:int 3))]
          [env '()]
          [id 0]
          [t 0]
          [cache (list)])
      (check-true (bveq (gator-interpret prog env id t cache) (bv #x7 4))))))
