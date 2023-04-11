#lang rosette/safe
;;; Base Lakeroad language.

(provide (struct-out list-ref)
         (struct-out first)
         (struct-out symbol)
         (struct-out extract)
         (struct-out drop)
         (struct-out take)
         (struct-out append)
         (struct-out map)
         (struct-out concat)
         (struct-out lut)
         (struct-out carry)
         (struct-out zero-extend)
         (struct-out dup-extend)
         (struct-out bv)
         (struct-out list)
         (struct-out integer)
         (struct-out bitvector)
         (struct-out var))

;;; Functions from Racket/Rosette.
(struct list-ref (lst pos) #:transparent)
(struct first (lst) #:transparent)
(struct extract (h l v) #:transparent)
(struct drop (l n) #:transparent)
(struct take (l n) #:transparent)
(struct append (lsts) #:transparent)
(struct map (f lsts) #:transparent)
(struct concat (vs) #:transparent)
(struct lut (ins width architecture lutmem inputs) #:transparent)
(struct carry (width architecture cin di s) #:transparent)
(struct zero-extend (v bv) #:transparent)
(struct dup-extend (v bv) #:transparent)
(struct bv (v) #:transparent)
(struct bitvector (v) #:transparent)
(struct list (v) #:transparent)
(struct integer (v) #:transparent)
(struct symbol (v) #:transparent)
;;; Input into a Lakeroad expression.
;;;
;;; We actually didn't need `var`s for a very long time, as variable inputs could be passed in as
;;; Rosette symbolic constants wrapped in `bv`s.
(struct var (name bw) #:transparent)
