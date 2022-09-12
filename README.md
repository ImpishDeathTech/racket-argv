# racket-argv
#### A cleaner, more compact way of dealing with current-command-line-arguments in Racket/PLT Scheme

The name itself says it all - we don't have `(argv 1)`
in scheme, we have 
```scm
(vector-ref (current-command-line-arguments) 0)
```

So I decided to define an easier way of interacting with it, a way most programmers are used to: argv!

Install it like any other racket package and `(require argv)`, there's nothing special going on here ;3

If called as just `(argv)` the function will return the entire vector. 
```scm
(require argv)

(for/arg (value)
  (printf "arg = ~v\n" value))

(printf "argv = ~a\n" (argv))
```

Otherwise, unlike other argvs, this argv iterates from zero, like `current-command-line arguments`
