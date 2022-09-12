#lang racket/base

(require racket/vector)

(provide (all-defined-out))


(define (argv-length)
  (vector-length (current-command-line-arguments)))

(define (argv-empty?)
  (vector-empty? (current-command-line-arguments)))

(define (argv [index -1])
  (let ([vec (current-command-line-arguments)])
    (cond [(= index -1) (current-command-line-arguments)]
          
          [(exact-nonnegative-integer? index)
           (if (and (not (argv-empty?))
                    (< index (argv-length)))
               (vector-ref vec index)
               (raise-range-error 'argv "vector" "" index vec 0 (- (argv-length) 1)))]

          [else (raise-argument-error 'argv "exact-nonnengative-integer?" index)])))
