;;; This file provides the signal struct and its associated functions.
#lang racket

(provide signal
         signal?
         bv->signal
         signal-value
         signal-state
         signal-state-value
         merge-state
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
;;; State is an association list from keywords to bitvectors. The entries in the state map are the
;;; various pieces of state that existed when the signal value was generated. For example, the output
;;; of a pipelined multiplier module might be an bitvector v. The signal representing the multiplier's
;;; output might then look like (signal v { internal-register-0: (bv #x0a 8), internal-register-1: (bv
;;; #x0b 8) }), where the internal registers represent some state internal to the multiplier module.
;;;
;;; - next: the next value of the signal. See #284. This is just a hack for now, and needs to be
;;;   fleshed out.
;;; - value: in the context of this new hack (#284), value is now the "previous" value.
(struct signal (value next state) #:transparent)

;;; Creates a signal from a bitvector, optionally taking the state from an existing signal.
(define (bv->signal v [with-state-from (signal '() 'unused (list))])
  ;;; TODO(@gussmith23): What to use for `next` here?
  (signal v (bv 0 (length (bitvector->bits v))) (signal-state with-state-from)))

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

;;; Merge the state from each signal in a list of signals. Simply appends the association lists. Does
;;; not handle any conflicting keys.
(define (merge-state signals)
  (apply append (map signal-state signals)))

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
