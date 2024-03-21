#lang racket

(require json)

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

  (displayln (format "id-map: ~a" id-map))
  ;;; todo: add prim-map back here
  (define (gen-gator-expr eclass)
    (define id (hash-ref id-map eclass))
    ;;; (displayln (format "id: ~a" id))
    (define node
      ;;; we're grabbing the first node thdat matches the eclass and skipping the rest
      (car (for/list ([(node-id node) (in-hash (dict-ref egraph-json 'nodes))]
                      #:when (equal? (dict-ref node 'eclass) (symbol->string eclass)))
             node)))
    ;;; (displayln (format "node: ~a" node))
    (define type (dict-ref (dict-ref class-data eclass) 'type))
    (define children (dict-ref node 'children))
    ;;; TODO: match statement here
    ;;; (displayln (format "eclass: ~a, children: ~a, type: ~a" eclass children type))
    ;;; if node.type is 'op' and children is empty, then let's skip it.
    ;;; TODO: ask gus about this, and why these nodes are in the egraph

    (define expr
      (match type
        ["i64" (format "(Int ~a)" (dict-ref node 'op))]
        ["String" (format "(String ~a)" (dict-ref node 'op))]
        ["Expr"
         (format "(~a ~a)"
                 (dict-ref node 'op)
                 (map (lambda (child)
                        (define child-id
                          (hash-ref id-map (hash-ref node->eclass (string->symbol child))))
                        child-id)
                      children))]
        ["Op"
         (if (empty? children)
             (format "(Bvop ~a)" (dict-ref node 'op))
             (format "(~a ~a)"
                     (dict-ref node 'op)
                     (map (lambda (child)
                            (define child-id
                              (hash-ref id-map (hash-ref node->eclass (string->symbol child))))
                            child-id)
                          children)))]))
    (cons id expr))
  (filter (lambda (expr) (not (void? expr))) (map gen-gator-expr (hash-keys id-map))))

;;; sort elements by their first element
(define unsorted-elements (gen-gator-prog (read-json-file "output.json")))
(define elements (sort unsorted-elements (lambda (a b) (< (car a) (car b)))))
(for ([element elements] [i (in-naturals)])
  (displayln (format "~a" element)))
