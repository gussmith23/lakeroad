#lang racket

(require json
         (prefix-in gator: "gator-language.rkt"))

(provide elements
         gen-gator-prog
         read-json-file)

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
  (define nodes (dict-ref egraph-json 'nodes))

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

  ;;; id->type is a map from id to type. only used for mapping Reg to its type,
  ;;; although other information is in this map.
  (define id->type
    (for/hash ([(node-id node) (in-hash (dict-ref egraph-json 'nodes))]
               #:when (and (equal? (dict-ref node 'eclass) "Unit-0")
                           (equal? (dict-ref node 'op) "HasType")))
      (when (not (equal? (length (dict-ref node 'children)) 2))
        (error "HasType should have exactly 2 children"))

      (match-let ([(list id type) (dict-ref node 'children)])
        (values (hash-ref id-map (hash-ref node->eclass (string->symbol id)))
                (hash-ref id-map (hash-ref node->eclass (string->symbol type)))))))

  (displayln (format "id->type: ~a" id->type))

  (define (gen-gator-expr eclass)
    (define id (hash-ref id-map eclass))
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
        ["Op0" (gator:op (car child-ids) (cdr child-ids))]
        ["Op1" (gator:op (car child-ids) (cdr child-ids))]
        ["Op2"
         (let ([is-child-reg?
                (equal? (dict-ref (dict-ref nodes (string->symbol (car children)) #f) 'op #f) "Reg")])
           (if is-child-reg?
               (begin
                 (match-let ([(list reg-id clock-id data-id)
                              (map (lambda (id)
                                     (dict-ref id-map (dict-ref node->eclass (string->symbol id))))
                                   children)])
                   (gator:op-reg reg-id (dict-ref id->type data-id) (list clock-id data-id))))
               (gator:op (car child-ids) (cdr child-ids))))]
        ["Op3" (gator:op (car child-ids) (cdr child-ids))]
        ["Reg" (apply gator:reg child-ids)]
        ["BV" (apply gator:bv child-ids)]
        [other (error (format "gen-op: unknown op ~a" other))]))
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
        ["Op"
         (if (empty? children)
             (gator:func (string->symbol (dict-ref node 'op)))
             (gen-op node children))]
        ["Type"
         (gator:type (dict-ref node 'op)
                     (map (lambda (child-eclass)
                            (hash-ref id-map (hash-ref node->eclass (string->symbol child-eclass))))
                          children))]))
    (cons id expr))
  (define unsorted-exprs (map gen-gator-expr (hash-keys id-map)))
  (map cdr (sort unsorted-exprs (lambda (a b) (< (car a) (car b))))))

;;; sort elements by their first element
(define elements (gen-gator-prog (read-json-file "DSP48E2.json")))
(for ([element elements] [i (in-naturals)])
  (displayln (format "~a" element)))
