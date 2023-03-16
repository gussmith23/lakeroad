#lang racket
;; Signal struct 
(provide signal
         signal?
         bv->signal
         signal-value
         signal-state
         signal-state-value
         merge-state)
(require rosette
         racket/hash)

;;; TODO(@gussmith): We rely heavily on hash tables for this implementation. Hash tables are not
;;; lifted in Rosette, and thus we have to be very careful with them. In general, I think these are
;;; the rules to obey when using hash tables in Rosette:
;;; - Only use immutable hash tables.
;;; - Keys should never be symbolic. They should always be concrete.

(struct signal (value state) #:transparent)

;;; Creates a signal from a bitvector. Optionally, the state of the signal
;;; can be specified. If not, the state is an empty hash.
(define (bv->signal bv [with-state-from (signal '() (hash))])
  (signal bv (signal-state with-state-from)))

;;; Gets state from a signal.
(define (signal-state-value signal k)
  (hash-ref (signal-state signal) k))

(module+ test
  (require rackunit
           rosette)
  (check-not-exn (λ () (signal (bv 0 1) (hash 'state0 (bv 5 8) 'state1 (bv 8 8)))))
  (check-equal? (bv->signal (bv 0 1)) (bv->signal (bv 0 1)))
  (check-equal?
   (signal-state-value (signal (bv 0 1) (hash 'state0 (bv 5 8) 'state1 (bv 8 8))) 'state0)
   (bv 5 8))
  (check-equal?
   (signal-state-value (signal (bv 0 1) (hash 'state0 (bv 5 8) 'state1 (bv 8 8))) 'state1)
   (bv 8 8))
  (check-true
   (normal? (with-vc (check-exn #rx"given: state1"
                                (λ () (signal-state-value 'state1 (signal (bv 0 1) (hash)))))))))

;;; Merges the state of a list of signals. Errors if two signals conflict with state.
;;; There
(define (merge-state signals)
  (keyword-apply
   hash-union
   '(#:combine/key)
   (list (λ (k a b)
           (if (not (equal? a b))
               (error (format "Key ~a is mapped to two different values in the states!" k))
               a)))
   (map (λ (signal) (signal-state signal)) signals)))
