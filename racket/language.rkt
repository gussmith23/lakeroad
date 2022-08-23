#lang rosette/safe
;;; Base Lakeroad language.

(provide logical-to-physical-mapping
         physical-to-logical-mapping
         list-ref
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
         dup-extend)

;;; Functions from Racket/Rosette.
(struct logical-to-physical-mapping (f inputs) #:transparent)
(struct physical-to-logical-mapping (f outputs) #:transparent)
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
