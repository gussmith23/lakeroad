#lang racket/base
;;; Base Lakeroad language.

(provide list-ref
         extract)

;;; Functions from Racket/Rosette.
(struct list-ref (lst pos) #:transparent)
(struct extract (h l v) #:transparent)
