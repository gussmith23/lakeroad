#lang rosette

;;; Gator language definition.

(provide (struct-out int)
         (struct-out string)
         (struct-out func)
         (struct-out bv)
         (struct-out var)
         (struct-out reg)
         (struct-out op)
         (struct-out op-reg)
         (struct-out extract)
         (struct-out type))

(struct int (value) #:transparent)
(struct string (value) #:transparent)
(struct func (fn-name) #:transparent)
(struct bv (value-id bitwidth-id) #:transparent)
(struct var (name-id bitwidth-id) #:transparent)
(struct reg (init-id) #:transparent)
(struct op (fn-id operand-ids) #:transparent)
(struct op-reg (fn-id type-id operand-ids) #:transparent)
(struct extract (high-id low-id) #:transparent)
(struct type (type-id children-ids) #:transparent)
;;; TODO: prim
