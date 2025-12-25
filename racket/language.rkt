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
         (struct-out sign-extend)
         (struct-out dup-extend)
         (struct-out bv)
         (struct-out list)
         (struct-out integer)
         (struct-out bitvector)
         (struct-out var)
         (struct-out hw-module-instance)
         (struct-out hash-ref)
         (struct-out make-immutable-hash)
         (struct-out cons)
         (struct-out hash-remap-keys)
         (struct-out ltop-bitwise)
         (struct-out ltop-shift)
         (struct-out ltop-identity)
         (struct-out ltop-constant)
         (struct-out ltop-bitwise-reverse)
         (struct-out ptol-bitwise)
         (struct-out ptol-bitwise-reverse)
         (struct-out ptol-choose-one)
         (struct-out logical-to-physical-mapping)
         (struct-out physical-to-logical-mapping)
         (struct-out ltop-uf)
         (struct-out ptol-uf)
         (struct-out ptol-identity)
         (struct-out ltop-bitwise-with-mask))

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
(struct sign-extend (v bv) #:transparent)
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

;;; Lakeroad construct for a hardware module instance.
;;;
;;; - module-name: the name of the module.
;;; - inst-name: the name of the instance. This is used to index into the state map and get the state
;;;   of the module instance; thus, if two module instances have the same name, they will be
;;;   indistinguishable in the state map.
;;; - ports: list of module-instance-ports.
;;; - filepath: Used to identify the module at interpretation time. We can use some other identifier.
(struct hw-module-instance (module-name inst-name ports params filepath) #:transparent)

(struct hash-ref (h k) #:transparent)
;;; Remap the keys in h (a Lakeroad expression which produces a hashmap) using the association list
;;; ks, which maps old keys to new keys.
(struct hash-remap-keys (h ks) #:transparent)

(struct make-immutable-hash (list-expr) #:transparent)
(struct cons (v0-expr v1-expr) #:transparent)

(struct logical-to-physical-mapping (f inputs) #:transparent)
(struct physical-to-logical-mapping (f outputs) #:transparent)
(struct ltop-identity () #:transparent)
(struct ltop-bitwise () #:transparent)
(struct ltop-bitwise-reverse () #:transparent)
(struct ltop-bitwise-with-mask (masks) #:transparent)
(struct ltop-uf (uf bw bits-per-group) #:transparent)
(struct ltop-shift (n) #:transparent)
(struct ltop-constant (c) #:transparent)
(struct ptol-bitwise () #:transparent)
(struct ptol-bitwise-reverse () #:transparent)
(struct ptol-uf (uf bw bits-per-group) #:transparent)
(struct ptol-choose-one (idx) #:transparent)
(struct ptol-identity () #:transparent)
