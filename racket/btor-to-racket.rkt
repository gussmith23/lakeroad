#lang rosette/safe

(require racket/cmdline
         racket/match
         racket/port
         racket/pretty
         racket/list
         "btor.rkt")

(define input-port (make-parameter (current-input-port)))
(define output-port (make-parameter (current-output-port)))
(define output-signal-symbols (make-parameter '()))

(command-line #:program "btor-to-racket"
              #:once-each ["--input-file"
                           filename
                           "Input btor file to convert to Racket."
                           (input-port (open-input-file filename))]
              #:once-each ["--output-file"
                           filename
                           "Output file into which to write the generated Racket code."
                           (output-port (open-output-file filename #:exists 'error))]
              #:multi ["--output-signal"
                       signal-name
                       "Name of the output signal of the btor program to generate code for."
                       (output-signal-symbols (cons (string->symbol signal-name)
                                                    (output-signal-symbols)))])

(match-define (list output-signals requires) (btor->racket (port->string (input-port))))

(pretty-display "#lang racket/base" (output-port))
(for ([output-signal-symbol (output-signal-symbols)])
  (pretty-display (format "(provide ~a)" output-signal-symbol) (output-port)))
(for ([require requires])
  (pretty-display require (output-port)))
(for ([output-signal-symbol (output-signal-symbols)])
  (pretty-write `(define/contract ,output-signal-symbol
                                  ,(second (hash-ref output-signals output-signal-symbol))
                                  ,(first (hash-ref output-signals output-signal-symbol)))
                (output-port)))

(module test racket/base
  ;;; Empty tests for now. If this file is run as a test, it will hang indefinitely waiting on stdin.
  )
