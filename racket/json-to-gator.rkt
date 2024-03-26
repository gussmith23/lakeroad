#lang racket

(require json
         (prefix-in gator: "gator-language.rkt"))

(define (read-json-file filename)
  (with-input-from-file filename (lambda () (read-json))))

(define (gen-gator-prog egraph-json)
  (when (not (jsexpr? egraph-json))
    (error "gen-gator-prog: expected json" egraph-json))
  ;;; class-data is map from eclass -> {type: `type`}, includes all eclasses except "Unit-0"
  ;;; TODO: assert that Unit-0 was removed from class-data
  (define class-data
    (for/hash ([(label data) (in-hash (dict-ref egraph-json 'class_data))]
               #:when (not (equal? label (string->symbol "Unit-0"))))
      (values label data)))

  ;;; id-map: maps eclass to natural number
  (define id-map
    (let ([id-map (make-hash)])
      (for ([label (in-hash-keys class-data)] [i (in-naturals)])
        (hash-set! id-map label i))
      id-map))
  ;;; node->eclass is a map from node-id to eclass
  (define node->eclass
    (for/hash ([(node-id node) (in-hash (dict-ref egraph-json 'nodes))])
      (values node-id (string->symbol (dict-ref node 'eclass)))))
  (define (gen-gator-expr eclass)
    (define (gen-op node children)
      (define (gen-children children)
        (map (lambda (child)
               (define child-id (hash-ref id-map (hash-ref node->eclass (string->symbol child))))
               child-id)
             children))
      (define child-ids (gen-children children))
      (match (dict-ref node 'op)
        ["Var" (apply gator:var child-ids)]
        ["Extract" (apply gator:extract child-ids)]
        ["Concat" (apply gator:concat child-ids)]
        ["Op0" (gator:op (car child-ids) (cdr child-ids))]
        ["Op1" (gator:op (car child-ids) (cdr child-ids))]
        ["Op2" (gator:op (car child-ids) (cdr child-ids))]
        ["Reg" (apply gator:reg child-ids)]
        ["BV" (apply gator:bv child-ids)]
        [other (error (format "gen-op: unknown op ~a" other))]))
    (define id (hash-ref id-map eclass))
    (define node
      ;;; we're grabbing the first node thdat matches the eclass and skipping the rest
      (car (for/list ([(node-id node) (in-hash (dict-ref egraph-json 'nodes))]
                      #:when (equal? (dict-ref node 'eclass) (symbol->string eclass)))
             node)))
    (define type (dict-ref (dict-ref class-data eclass) 'type))
    (define children (dict-ref node 'children))
    (define expr
      (match type
        ["i64" (gator:int (dict-ref node 'op))]
        ["String" (gator:string (dict-ref node 'op))]
        ["Expr" (gen-op node children)]
        ["Op" (if (empty? children) (gator:bvop (dict-ref node 'op)) (gen-op node children))]
        ["Type"
         (gator:type (dict-ref node 'op)
                     (map (lambda (child-eclass)
                            (hash-ref id-map (hash-ref node->eclass (string->symbol child-eclass))))
                          children))]))
    (cons id expr))
  (define unsorted-exprs (map gen-gator-expr (hash-keys id-map)))
  (sort unsorted-exprs (lambda (a b) (< (car a) (car b)))))

;;; sort elements by their first element
(define elements (gen-gator-prog (read-json-file "counter-withtypes.json")))
(for ([element elements] [i (in-naturals)])
  (displayln (format "~a" element)))
