# racket-argv
#### A cleaner, more compact way of dealing with current-command-line-arguments in Racket/PLT Scheme

The name itself says it all - we don't have `(argv number)`
in scheme, we have 
```lisp
(vector-ref (current-command-line-arguments) number)
```

So I decided to define an easier way of interacting with it, a way most programmers are used to: argv!
Install it like any other racket package, there's nothing special going on here ;3
