#!/usr/bin/env racket
#lang racket/base
;;; Script to convert .btor files to Racket/Rosette code.

(require racket/cmdline
         racket/match
         racket/port
         racket/pretty
         racket/list
         "../racket/btor.rkt")

(define input-port (make-parameter (current-input-port)))
(define output-port (make-parameter (current-output-port)))

(define function-name
  (command-line
   #:program "btor-to-racket"
   #:once-each ["--input-file"
                filename
                "Input btor file to convert to Racket."
                (input-port (open-input-file filename))]
   #:once-each ["--output-file"
                filename
                "Output file into which to write the generated Racket code."
                (output-port (open-output-file filename #:exists 'error))]
   ;;; Expected argument is the function name. Wish I could make this a flag, but apparently this
   ;;; doesn't support required flags.
   #:args (function-name)
   function-name))

(match-define (list f requires) (btor->racket (port->string (input-port))))

(pretty-display "#lang racket/base" (output-port))
(pretty-display (format "(provide ~a)" (string->symbol function-name)) (output-port))
(for ([require requires])
  (pretty-display require (output-port)))
;;; TODO(@gussmith): Fix contract generation. Seems to generate incorrect contracts right now.
;;; (pretty-write `(define/contract ,output-signal-symbol
;;;                                 ,(second (hash-ref output-signals output-signal-symbol))
;;;                                 ,(first (hash-ref output-signals output-signal-symbol)))
(pretty-write `(define ,(string->symbol function-name)
                 ,f)
              (output-port))
