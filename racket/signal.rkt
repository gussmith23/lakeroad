;;; This file provides the signal struct and its associated functions.
#lang racket

(provide signal
         signal?
         bv->signal
         signal-value
         signal-state
         signal-state-value
         merge-state
         merge-states
         assoc-has-key?
         assoc-ref
         make-assoc-list)

(require rosette)

;;; TODO(@gussmith): We rely heavily on hash tables for this implementation. Hash tables are not
;;; lifted in Rosette, and thus we have to be very careful with them. In general, I think these are
;;; the rules to obey when using hash tables in Rosette:
;;; - Only use immutable hash tables.
;;; - Keys should never be symbolic. They should always be concrete.

;;; Signals represent bitvectors with associated state.
;;;
;;; State is an association list from keywords to a tuple of (bitvector, number). The number
;;; represents a 0-indexed version number.  The entries in the state map are the various pieces of
;;; state that existed when the signal value was generated. For example, the output of a pipelined
;;; multiplier module might be an bitvector v. The signal representing the multiplier's output might
;;; then look like (signal v { internal-register-0: (bv #x0a 8), internal-register-1: (bv #x0b 8) }),
;;; (version omitted) where the internal registers represent some state internal to the multiplier
;;; module.
;;;
;;; The version value is used to merge states correctly. See merge-state.
(struct signal (value state) #:transparent)

;;; Creates a signal from a bitvector, optionally taking the state from an existing signal.
(define (bv->signal bv [with-state-from (signal '() (list))])
  (signal bv (signal-state with-state-from)))

;;; Gets state from a signal.
(define (signal-state-value signal k)
  (cdr (or (assoc k (signal-state signal)) (error "key not found: ~a" k))))

(module+ test
  (require rackunit
           rosette)
  (check-not-exn (λ () (signal (bv 0 1) (make-assoc-list 'state0 (bv 5 8) 'state1 (bv 8 8)))))
  (check-equal? (bv->signal (bv 0 1)) (bv->signal (bv 0 1)))
  (check-equal?
   (signal-state-value (signal (bv 0 1) (make-assoc-list 'state0 (bv 5 8) 'state1 (bv 8 8))) 'state0)
   (bv 5 8))
  (check-equal?
   (signal-state-value (signal (bv 0 1) (make-assoc-list 'state0 (bv 5 8) 'state1 (bv 8 8))) 'state1)
   (bv 8 8))
  (check-true
   (normal? (with-vc (check-exn
                      #rx"given: state1"
                      (λ () (signal-state-value 'state1 (signal (bv 0 1) (make-assoc-list)))))))))

;;; This function merges state lists into a single state list. It differs from merge-state in that it
;;; takes the states themselves, not a list of signals.
(define (merge-states . states)
  ;;; Given a key with its value and age, update the hash h.
  ;;;
  ;;; If the key is already in the hash, then the value and age are updated if the age is greater than
  ;;; the current age in the hash map.
  (define (merge key-and-value h)
    (match-let* ([(cons key (cons potential-value potential-version)) key-and-value]
                 [(cons current-value current-version) (hash-ref h key (cons #f -1))]
                 [new-pair (if (> potential-version current-version)
                               (cons potential-value potential-version)
                               (cons current-value current-version))])
      (hash-set h key new-pair)))

  ;;; Flatten the state lists into one big list.
  (define all-state-pairs (apply append states))

  ;;; Make sure all keys are concrete -- otherwise, we don't know what will happen!
  (for ([pair all-state-pairs])
    (match-let ([(cons key _) pair])
      (unless (concrete? key)
        (error "key ~a is not concrete" key))))

  ;;; Concatenate all the existing signal association lists together, then merge each key one by one
  ;;; by folding `merge` over the list. Finally, convert the hash back to an association list.
  ;;;
  ;;; Note the need for for/all here
  (for/all ([h (foldl merge (hash) all-state-pairs)]) (hash->list h)))

;;; Merge the state from each signal in a list of signals. Simply appends the association lists. Does
;;; not handle any conflicting keys.
(define (merge-state signals)
  (apply merge-states (map signal-state signals)))

(module+ test

  (test-case "merge"
    (let* ([s1 (signal 'unused
                       (list (cons 'state0 (cons (bv 5 8) 1)) (cons 'state1 (cons (bv 8 8) 0))))]
           [s2 (signal 'unused
                       (list (cons 'state0 (cons (bv 6 8) 3)) (cons 'state2 (cons (bv 9 8) 1))))]
           [s3 (signal 'unused
                       (list (cons 'state0 (cons (bv 7 8) 2)) (cons 'state3 (cons (bv 10 8) 2))))]
           [merged (merge-state (list s1 s2 s3))])
      (check-equal? (length merged) 4)
      (check-equal? (assoc-ref merged 'state0) (cons (bv 6 8) 3))
      (check-equal? (assoc-ref merged 'state1) (cons (bv 8 8) 0))
      (check-equal? (assoc-ref merged 'state2) (cons (bv 9 8) 1))
      (check-equal? (assoc-ref merged 'state3) (cons (bv 10 8) 2)))))

(define (assoc-has-key? l k)
  (not (equal? #f (assoc k l))))
(define (assoc-ref l k)
  (cdr (or (assoc k l) (cons 'unread #f))))

(define-syntax-rule (make-assoc-list vs ...)
  (let* ([l (list vs ...)] [l-len (length l)])
    (when (not (equal? 0 (modulo l-len 2)))
      (error "need even number of keys+vals"))
    (map cons
         (for/list ([i (/ l-len 2)])
           (list-ref l (* 2 i)))
         (for/list ([i (/ l-len 2)])
           (list-ref l (+ 1 (* 2 i)))))))

(module+ test
  (require rackunit
           rosette)
  (check-not-exn (λ () (signal (bv 0 1) (make-assoc-list 'state0 (bv 5 8) 'state1 (bv 8 8)))))
  (check-equal? (bv->signal (bv 0 1)) (bv->signal (bv 0 1)))
  (check-equal?
   (signal-state-value (signal (bv 0 1) (make-assoc-list 'state0 (bv 5 8) 'state1 (bv 8 8))) 'state0)
   (bv 5 8))
  (check-equal?
   (signal-state-value (signal (bv 0 1) (make-assoc-list 'state0 (bv 5 8) 'state1 (bv 8 8))) 'state1)
   (bv 8 8))
  (check-true
   (normal? (with-vc (check-exn
                      #rx"given: state1"
                      (λ () (signal-state-value 'state1 (signal (bv 0 1) (make-assoc-list)))))))))
