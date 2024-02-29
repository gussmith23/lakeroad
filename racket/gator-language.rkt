#lang rosette

;;; Gator language definition.
;;; Ideally, this is as close to the LR semantics submitted in the ASPLOS paper
;;; as possible.

(provide (struct-out bv)
         (struct-out var)
         (struct-out op)
         (struct-out reg)
         (struct-out prim))

(struct bv (value bitwidth) #:transparent)
(struct var (name) #:transparent)
(struct op (operator operand-ids) #:transparent)
(struct reg (reg-id init-bv) #:transparent)
(struct prim (env-prime prog-id) #:transparent)
