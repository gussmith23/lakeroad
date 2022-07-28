#lang racket/base
;;; Base Lakeroad language.

(provide list-ref extract bv integer list legacy)

;;; Functions from Racket/Rosette.
(struct list-ref (lst pos) #:transparent)
(struct extract (h l v) #:transparent)

;;; Base values.
;;;
;;; Rosette bitvector.
(struct bv (v) #:transparent)
(struct integer (v) #:transparent)
(struct list (l) #:transparent)

;;; Represents a legacy Lakeroad expression, expressed as lists of symbols/values.
(struct legacy (expr) #:transparent)