#!/usr/bin/racket
#lang racket

(require racket/cmdline
         rosette)

(define architecture
  (make-parameter ""
                  (lambda (v)
                    (match v
                      [(or "xilinx-ultrascale-plus") v]
                      [other (error (format "Unsupported architecture ~a." other))]))))
(define instructions (make-parameter '() (lambda (instr) instr)))

(command-line
 #:program "lakeroad"
 #:once-each ["--architecture" arch "Hardware architecture to target." (architecture arch)]
 #:once-any
 #:multi
 [("--instruction")
  instr
  "Instruction to synthesize, written in Rosette bitvector semantics. Use (var <name> <bw>) to indicate a variable."
  (instructions (append (instructions) (list instr)))])

;;; Parse instruction.
;;;
;;; This function will introduce new symbolic constants. Make sure you have good (vc) hygeine when
;;; calling this function (e.g. by wrapping its invocation with (with-vc)).
;;;
;;; expr The instruction to parse, e.g. '(bvadd (var a 8) (var b 8)).
(define (parse-instruction expr)

  (define (helper expr)
    (match expr
      [`(bvand ,a ,b) (bvand (helper a) (helper b))]
      [`(var ,id ,bw) (constant id (bitvector bw))]))

  (helper expr))

;;; Synthesize a Lakeroad implementation of the given instruction.
;;;
;;; Returns a Lakeroad expression.
(define (synthesize instruction architecture)
  (void))

(for ([instruction (instructions)])
  (displayln (parse-instruction (read (open-input-string instruction)))))
