#lang racket/base

(require "core.rkt")

(provide for/arg*
         for/arg)

(define-syntax-rule (for/arg* ([index-var index-start]) body ...)
  (cond [(not (exact-nonnegative-integer? index-start))
         (raise-argument-error 'for/arg* "exact-nonnegative-integer?" index-start)]
        
        [(> index-start (argv-length))
         (raise-range-error 'for/arg* "vector" "starting " index-start (argv) 0 (- (argv-length) 1))]

        [else
         (let ([index-var index-start])
           (let loop ()
             (set! value-var (argv index-var))
             (when (< index-var (argv-length))
               body ...
               (set! index-var (add1 index-var))
               (loop))))]))

(define-syntax-rule (for/arg [index-var] body ...)
  (for/arg* ([index-var 0])
    body ...))
