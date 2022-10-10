#lang rosette/safe
;;; Base Lakeroad language.

(provide list-ref
         first
         extract
         drop
         take
         append
         map
         concat
         lut
         carry
         zero-extend
         dup-extend
         bv
         list
         integer)

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
(struct list (v) #:transparent)
(struct integer (v) #:transparent)
