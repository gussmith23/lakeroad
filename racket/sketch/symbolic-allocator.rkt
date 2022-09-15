#lang errortrace racket

; To understand the use of this file let's summarize the problem that it solves
; During Sketch Generation the Sketch Generator replaces `primitive-interface`s
; with architecture-specific primitives: e.g., a generic LUT4 applied to inputs
; w, x, y, z:
;
;     (primitive-interface 'LUT 4 INPUTS (list 0 1 2 3))`
;
; would be replaced by an architecture-specific LUT4:
;
;     (primitive
;       "Lattice-ECP5"
;       'LUT
;       (signature '(A B C D) '(Z) (INIT))
;       (list '(A . 0) '(B . 1) '(C . 2) '(D . 3))
;       (list '(INIT . ???)))  ;;; <--- What should "???" be?
;
; How do we decide what goes in ???. This is non-trivial. The first question is:
;

(provide (rename-out [make-symbolic-allocator symbolic-allocator])
         symbolic-allocator?
         symbolic-allocator-f
         symbolic-allocator-hashed
         sra-f)

(require "../utils.rkt"
         rosette
         rosette/lib/angelic)

; Create an n-choose* over a given type
(define (make-n-choose n tp)
  (apply choose* (make-list n (??* tp))))

; A `symbolic-allocator` is repsonsible for allocating symbolic variables during
; sketch generation.
(struct symbolic-allocator (f [hashed #:mutable]))

; Make a symbolic allocator. This wraps the struct's constructor.
;
; Parameters:
; + #:allocation-size the number of symoblic variables we want to allocate each
;   time we call our allocator. This value is passed to #:allocator
; + #:allocator a function accepting a number of symbolics and the type of
;   symbolics to allocate. Default is `make-n-choose`
;
; NOTE: We rename-out this to `symbolic-allocator` to mask the struct's constructor
(define (make-symbolic-allocator #:allocation-size [allocation-size 1]
                                 #:allocator [allocator make-n-choose])
  (define f
    (lambda (sra bw #:hint [hint '()])
      (let* ([key (cons bw hint)]
             [hashed (symbolic-allocator-hashed sra)]
             [retrieved (assoc key hashed)])
        (match retrieved
          [(cons _ value) value]
          [#f
           (let* ([allocated (allocator allocation-size (bitvector bw))]
                  [new-hashed (cons (cons key allocated) hashed)])
             (set-symbolic-allocator-hashed! sra new-hashed)
             allocated)]))))
  (symbolic-allocator f '()))

; Lookup a value memoized in the symbolic allocator under bitwidth `bw` and
; optional hint `#:hint`.
(define (symbolic-allocator-lookup-bw sra bw #:hint [hint '()])
  (let ([key (cons bw hint)] [hashed (symbolic-allocator-hashed sra)])
    (match (assoc key hashed)
      [(cons _ stored) stored]
      [#f #f]
      [x (error (format "illegal state! found ~a and expected (cons a b) or #f" x))])))

; An easier way to invoke the f on an SRA
(define (sra-f sra bw #:hint [hint '()])
  (let ([f (symbolic-allocator-f sra)])
    (f sra bw #:hint hint)))

(module+ test
  (require rackunit)
  (test-begin (let* ([sra (make-symbolic-allocator)] [f (symbolic-allocator-f sra)])
                ; First we test that the SRA is empty
                (check-false (symbolic-allocator-lookup-bw sra 4))
                ; Next, make sure that our lookup doesn't modify the entry it
                ; looked up
                (check-false (symbolic-allocator-lookup-bw sra 4))
                ; Next, we allocate a 4-bit symbolic variable, then lookup the
                ; symbolic variable and check that they are the same
                (check-equal? (f sra 4) (symbolic-allocator-lookup-bw sra 4))
                ; Next, re-lookup this value and then try to re-allocate...this
                ; should return the same value that is already stored and the
                ; equality check should pass.
                (check-equal? (symbolic-allocator-lookup-bw sra 4) (f sra 4))
                ; Finally, make sure this isn't returning false
                (check-not-false (f sra 4))

                ; Next, let's try with a different bitwidth

                ; Next, we allocate a 4-bit symbolic variable, then lookup the
                ; symbolic variable and check that they are the same
                (check-equal? (f sra 8) (symbolic-allocator-lookup-bw sra 8))
                ; Next, re-lookup this value and then try to re-allocate...this
                ; should return the same value that is already stored and the
                ; equality check should pass.
                (check-equal? (symbolic-allocator-lookup-bw sra 8) (f sra 8))
                ; Let's also ensure that this isn't equal to our 4-bit allocation
                (check-not-equal? (f sra 4) (f sra 8))
                ; Make sure this isn't returning false
                (check-not-false (f sra 8))

                ; Now let's try w/ hints!
                (check-equal? (f sra 8 #:hint 'A) (symbolic-allocator-lookup-bw sra 8 #:hint 'A))
                (check-not-equal? (f sra 8 #:hint 'A) (f sra 8))
                (check-not-equal? (f sra 8 #:hint 'A) (f sra 8 #:hint 'B))
                (check-not-equal? (f sra 8 #:hint 'A) (f sra 4 #:hint 'A)))))
