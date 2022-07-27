#lang racket/base
;;; Base Lakeroad language.

(provide racket-list-ref )

;;; Racket's list-ref function.
(struct racket-list-ref (lst pos))