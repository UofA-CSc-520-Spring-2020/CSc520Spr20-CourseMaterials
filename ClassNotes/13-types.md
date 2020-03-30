# Class notes on Types

March 30, 2020

## Announcements

 * HW7 is due Friday



## Last Time

 * Datatypes
 * Types, Patterns, Exceptions
 * ML Traps & Pitfalls


# Type Systems

What they do:
* Guide coding
* Document code (checked by compiler!)
* Rule out certain errors

How they work
* Compile-time **prediction** of set of possible values at run time

World's most widely deployed **static analysis**

Where type systems are found:
* C#, Swift, Go
* Java, Scala, Rust (polymorphism)
* Others?

Trajectory:

* Formalize familiar, monomorphic type systems (like C)
* Learn polymorphic type systems
* Eventually, infer polymorphic types

Monomorphic types systems are the past.
Inference and polymorphism are the present and future.
(Visible trend just like `lambda`.)


Today

 * Type systems with two types

 * Typing rules for a simple language

 * Type checker for a simple language

 * Adding environments


# Type Systems determine what kind of value do we have

Types classify expressions.  Calls "expressions" "terms".

```
 n + 1  : int

 "hello" ^ "world"  : string

 (fn n => n * (n - 1))  : int -> int

 if p then 1 else 0  : int,  provided that p : bool
```

Questions type systems can answer:

* What kind of value does it evaluate to (if it terminates)?

* What is the contract of the function?

* Is each function called with the right number of arguments? 
  (And similar errors)

 * Who has the rights to look at it/change it?

 * Is the number miles or millimeters?

Questions type systems generally cannot answer:

 * Will my program contain a division by zero?

 * Will my program contain an array bounds error?

 * Will my program take the car of `'()`?

 * Will my program terminate?

## Decidability and Type Checking

Suppose L is a "Turing-Complete" Language.

TP is the set of programs in L that terminate.

Wish: a type system to statically classify terminating programs:

Expression e in L has type T (e : T) iff e terminates.

But: Undecideable!

We can prove no such type system exists.

Choices:

 * Allow type checker to run forever.

 * Don't use type system to track termination.

## Static vs. Dynamic Type Checking

Most languages use a combination of static and dynamic checks

Static: "for all inputs"

 * input independent

 * efficient at run-time

 * approximate : rules out some programs that won't trigger errors example: 
   `(if false then 2 else "hi") ^ "there"`

Dynamic: "for some inputs"

 * depends on input

 * run-time overhead

 * precise

# Type System and Checker for a Simple Language

Wait, why are we learning about type systems?

 * Effectively using type systems and testing in coordination will improve the
   overall quality of your code.  Understanding how type systems work enables
   effective debugging of type error messages.

 * The ideas behind type systems apply any time you need to validate user input, 
   for example.

 * Your introduction to static analysis, which is used for code improvement and 
   security.

## Define an AST for expressions with:

 * Simple integer arithmetic operations
 * Numeric comparisons
 * Conditional
 * Numeric literal

## Language of expressions/terms
```
    datatype exp = ARITH of arithop * exp * exp
                 | CMP   of relop   * exp * exp
                 | LIT   of int
                 | IF    of exp     * exp * exp
    and      arithop = PLUS | MINUS | TIMES | ...
    and      relop   = EQ | NE | LT | LE | GT | GE

    datatype ty = INTTY | BOOLTY
```

## Examples to rule out

Can't add an integer and a boolean:
```
3 + (3 < 99)

(ARITH(PLUS, LIT 3, CMP (LT, LIT 3, LIT 99)))
```

Can't compare an integer and a boolean

```
  (3 < (4 = 24))

  CMP (LT, LIT 3, CMP(EQ (LIT 4, LIT 24)))
```

## Inference rules to define a type system

* Form of judgment *Context* `|-` *term* `:` *type*

  Written `|- e : tau`

  **Contexts vary** between type systems

  (Right now, the empty context)

* Inference rules determine how to write type checker `typeof : exp -> ty`

  Given *e*, find *tau* such that `|- e : tau`

* What inference rules do you recommend for this language?

## Rule for arithmetic operators

Informal example:
```
|- 3 : int    |- 5 : int
------------------------------------------------------------
|- 3 + 5 : int
```

Rules out:
```
|- 'a' : char    |- 5 : int
------------------------------------------------------------
|- 'a' + 5 : ???
```

General form:
```
|- e1 : int    |- e2 : int
------------------------------------------------------------
|- ARITH ( _ , e1, e2) : int
```

## Rule for comparisons

Informal example:
```
|- 7 : int    |- 10 : int
------------------------------------------------------------
|- 7 < 10 : bool
```

General form:
```
|- e1 : int    |- e2 : int
------------------------------------------------------------
|- CMP ( _ , e1, e2) : bool
```

## Rule for literals

Informal example:
```
|- 14 : int
```

General form:
```
-----------------------------------
|- LIT (n) : int
```

## Rule for conditionals:

Informal example:
```
|- true : bool    
|- 3    : int
|- 42   : int      
------------------------------------------------------------
|- IF (true, 3, 42) : int
```

General form:
```
|- e : bool    
|- e1 : tau1   
|- e2 : tau2      tau1 equiv tau2
------------------------------------------------------------
|- IF ( e, e1, e2) : tau1
```

Experience shows it is better to test two types for equivalence than to write 
rule with same type appearing twice.

Typing rules let us read off what a type checker needs to do.
* input to checker: `e`
* output from checker: `tau`

## What is a type?

* Working definition: *a set of values*

* Precise definition: **classifier for terms!!**

  * The relationship to values becomes a **proof obligation**.

  * Note: a computation can have a type even if it doesn't terminate!
    (Or doesn’t produce a value)

## Type checker in ML

```
val typeof : exp -> ty
exception IllTyped
fun typeof (ARITH (_, e1, e2)) = 
      case (typeof e1, typeof e2) 
        of (INTTY, INTTY) => INTTY
         | _              => raise IllTyped
  | typeof (CMP (_, e1, e2)) = 
      case (typeof e1, typeof e2) 
        of (INTTY, INTTY) => BOOLTY
         | _              => raise IllTyped
  | typeof (LIT _) = INTTY
  | typeof (IF (e,e1,e2)) = 
      case (typeof e, typeof e1, typeof e2) 
        of (BOOLTY, tau1, tau2) => 
           if eqType(tau1, tau2) 
           then tau1 else raise IllTyped
         | _                    => raise IllTyped
      
```
An implementor’s trick: If you see *identical* types in a rule,

* Give each type a distinct subscript

* Introduce equality constraints

* Remember to be careful using primitive equality to check types—you are better 
  off with eqType.

# Typing Rules: Contexts and Term Variables

Add variables and `let` binding to our language, what happens?

Question: How do we need to extend our AST?

## Extended language of expressions

```
    datatype exp = ARITH of arithop * exp * exp
                 | CMP   of relop   * exp * exp
                 | LIT   of int
                 | IF    of exp     * exp * exp
                 | VAR   of name
                 | LET   of name    * exp * exp
    and      arithop = PLUS | MINUS | TIMES | ...
    and      relop   = EQ | NE | LT | LE | GT | GE

    datatype ty = INTTY | BOOLTY
```

Question: What could go wrong with a variable?

* Used inconsistently:

```
;; x can't be both an integer and a list

x + x @ x

;; y can’t be both an integer and a string

let y = 10 in y ^ “hello” end
```

* Need to track variable use to ensure consistency.
  What context do we need?

Key idea: **Type environment** (Gamma) tracks the types of variables.

## Rule for var

Question: what typing rules do we need for variables and let?

```
x in domain Gamma        tau = Gamma(x) 
------------------------------------------------------------
Gamma |- VAR x : tau
```

## Rule for let

```
Gamma         |- e  : tau
Gamma{x->tau} |- e' : tau'   
------------------------------------------------------------
Gamma |- LET x = e in e' : tau'
```

## Type Checker

Type checker needs Gamma – gives *type* of each "term variable".

```
val typeof : ty env -> exp -> ty
fun typeof Gamma (ARITH ... ) =  <as before>
  | typeof Gamma (VAR x)      =
      case Gamma (x) 
        of Some tau => tau
         | None     => raise IllTyped
  | typeof Gamma (LET x, e1, e2) = 
           let tau1 = typeof Gamma e1
           in  typeof (extend Gamma x tau1) e2
           end 
```

Review

* I gave you syntax for simple language

* You came up with typing rules

* I showed you how to implement the type checker.

* Then on your homework,

   * You will design new syntax and typing rules for lists

   * You will read about and answer questions about extending an existing 
     type checker

   * You will implement parts of a type checker from scratch

This is a big chunk of what language designers do.




