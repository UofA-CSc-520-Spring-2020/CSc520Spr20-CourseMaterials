# HW8 Type Inference

CSc 520 Spring 2020 Assignment

* [Overview](#overview)

* [Getting Started](#start)

* [Dire Warnings](#warnings)

* [Reading Comprehension (40 percent)](#read)

* [Language Design and Programming (60 percent)](#prog)

* [What and how to submit](#submit)

* [Evaluation for Programming](#eval)


**Due Wednesday, April 15, 2020 at 11:59PM**

The comprehensive questions are to be done individually.
The constraint solver **can be written with a partner**. 


# Overview
<a name="overview"/>


Many programmers want the flexibility of an untyped scripting language and the 
reliability of a statically typed language, combined. This combination is 
provided by type inference. You are most likely to encounter it in Webby 
languages like Hack, TypeScript, and Elm, but it is also heavily used in 
systemsy languages like Haskell and OCaml, as well as researchy languages like 
Agda, Idris, and Coq/Gallina. All these languages, and many more to come, are 
based on the Hindley-Milner type system.  You will implement a constraint solver
that could be used in a Hindley-Milner type system in this homework.


# Getting Started
<a name="start"/>

## Setup

Accept the github assignment at https://classroom.github.com/a/rtsiH09w
and do a git clone of your repository.  Make sure to `git commit -a` and
`git push` frequently!


The initial github repository will include the following
files:
 * `cqs.ml-infer.txt`
 * `Unit.sig`
 * `Unit.sml`
 * `build_prove_compare/`

To download an ML interpreter, install Moscow ML from https://mosml.org/.
Then you should have mosml on the command-line.

You may want to use the Unit testing module provided by Dr. Ramsey.
It is how your constraint solver will be tested.
To do so, compile it.
```
$ mosmlc -c Unit.sig
$ mosmlc -c Unit.sml
```

To run your code in `solver.sml`, you can create an executable as follows
```
$ mosmlc -o a.out -I . solver.sml
$ ./a.out
The only internal Unit test passed.
```

or use the interpreter.
```
$ mosml
Moscow ML version 2.10
Enter 'quit();' to quit.
- load "Unit";
> val it = () : unit
- use "solver.sml";
...
```


# Dire warnings
<a name="warnings"/>

The usual prohibitions against `open`, `null`, `hd`, `tl`, `length`, and so on 
continue to apply.

You must not use the ML functions `#1` and `#2`. (They are manifestations of bad 
design, trying to masquerade as functions.)

What are you supposed to do? Pattern match:
```
val (left, right) = ... expression that evaluates to a pair ...
```


# Reading Comprehension (40 percent)
<a name="read"/>

These problems will help guide you through the reading. We recommend 
that you complete them before starting the other problems below. 
There is a `cqs.ml-infer.txt` in the starter github repository.

1. Read sections 7.3.2 and 7.4.1.
   We have seen the symbols ρ, τ, and σ before, but not used exactly in this 
   way.

   Here is a list of semantic and type-related concepts you have seen written 
   using single symbols:
  * an expression
  * a name
  * a location
  * a value
  * a type
  * a type scheme (new in this chapter)
  * a mapping from names to locations
  * a mapping from names to values
  * a mapping from names to types
  * a mapping from names to type schemes (new in this chapter)
   
   There are lots of concepts and only so many symbols to go around. Please 
   identify, from the preceding list, what each symbol stands for in the theory 
   of nano-ML:

   * (a)  ρ

   * (b) τ

   * (c) σ

   * (d) Γ

    And finally,

   * (e) Say briefly what, in nano-ML, is the difference between τ and σ:


2. Read the first two pages of Section 7.4.3, which explain "substitutions" and 
   "instances."

  * Yes or no: does the substitution `(α → sym) ∘ (β → bool) ∘ (γ → int)` 
    replace type variable `α` with type `sym`?

  * Yes or no: does the substitution `(α → sym) ∘ (β → bool) ∘ (γ → int)` 
    replace type variable `β` with type `bool`?

  * Yes or no: does the substitution `(α → sym) ∘ (β → bool) ∘ (γ → int)` leave 
    the type `γ list` unchanged?

  * Which of the following are instances of the polymorphic type scheme 
    `∀α . α list → int`? For each one, please indicate whether it is an instance 
    of the type scheme (True) or whether it is not an instance of the type 
    scheme (False).

   * `int list`  True or False

   * `int list list` True or False

   * `int list list → int` True or False

   * `int * int list → list` True or False

3. Read the first page of Section 7.5.2, which shows the form of a constraint. 
   Then skip to the first page of Section 7.5.3, which explains how to apply a 
   substitution to a constraint.

   We start with a substitution θ and a constraint C:
```
   θ = (α₁ ↦ int)

   C = α₁ ~ α₂ /\ α₂ ~ α₃ list /\ α₄ ~ α₃ list list.
```
   Now define C′ = θ(C).

   * (a) Write C′:

   * (b) Does C′ have a solution? Answer yes or no.

   Now define C″ as the result of applying substitution `(α₂ ↦ int)` to C.

   * (c) Write C″:

   * Does C″ have a solution? Answer yes or no.


4. Now read all of Section 7.5.3, which explains how to solve constraints.

   To demonstrate your understanding, reason about solving these four 
   constraints:
```
C₁ = α ~ int

C₂ = α ~ bool

C₃ = C₁ /\ C₂

C₄ = α₁ ~ α₂ /\ α₂ list ~ α₁
```
  * (a) Write a substitution `θ₁` that solves constraint `C₁`:

  * (b) Write a substitution `θ₂` that solves constraint `C₂`:

  * (c) Does the composition `θ₂ ∘ θ₁` solve constraint `C₃ = C₁ /\ C₂`? 
    Answer yes or no.

  * (d) Can constraint `C₃` be solved? Answer yes or no.

  * (e) Can constraint `C₄` be solved? Answer yes or no.


5. Read the first two pages of Section 7.5.2. Pay special attention to the Apply 
   rule. Also read the footnote at the bottom of page 26 of [Seven Lessons in 
   Program Design](https://www.cs.tufts.edu/comp/105-2019s/design/lessons.pdf).

   Now consider type inference for the following expression e:
```
(f 3 #t)
```

   For this question, assume the following:

   * Expression `3` has type `int`, with a trivial constraint.
   * Expression `#t` has type `bool`, with a trivial constraint.
   * Trivial constraints can be ignored.
   * Every type variable except `'a`, `'b`, and `'c` is "fresh."

   Answer both questions for both (a) and (b):

   * (a) Assume that `f` is bound in Γ to the type scheme `∀.'a × 'b → 'c`. (The 
     `∀` is supposed to be empty.) In judgment C, Γ ⊢ e : τ, what does the type 
     checker output for τ?

     And what does the type checker output for C?

   * Assume that `f` is bound in Γ to the type scheme `∀.'a`. In judgment 
     C, Γ ⊢ e : τ, what does the type checker output for τ?

     And what does the type checker output for C?


6. Read the paragraphs that describe the nondeterministic typing rules for  
   lambda and for "Milner’s Let", which you will find on page 462. Especially, 
   read the small paragraph following the lambda rule on page 461.

   Now look at the val definition of too-poly in code chunk 462a. The right-hand 
   side of the val definition is a lambda expression with the name empty-list 
   playing the role of x₁.

   * (a) The rule for `lambda` says that we can pick any type `τ₁` for 
     `empty-list`.  After we've chosen `τ₁`, what is the type scheme to which 
     `empty-list` (playing `x₁`) is bound in the extended environment which is 
     used to check e?
     (Hint: 
     this type scheme comes from the `lambda` rule, as per the discussion in the 
     small paragraph, and it is different from the type scheme of the 
     `empty-list` that appears in the top-level `val` binding.)

   * (b) Given that the rule for `lambda` says that we can pick any type `τ₁` 
     for `empty-list`, why can't we pick a `τ₁` that makes the `lambda` 
     expression type-check? Put the word YES next to the best explanation:

     * Parameter `empty-list` has to have type `(forall ('a) (list 'a))`, but 
       `τ₁` is not a `forall` type.

     * Parameter `empty-list` has type `τ₁` = `(list 'a)`, which is not the same 
       as `(list bool)`.

     * Parameter `empty-list` can have any type `τ₁` but no `τ₁` can be 
       equivalent to both `(list int)` and `(list bool)`.

     * Parameter `empty-list` has type `τ₁` = `(list bool)`, which is not the 
       same as `(list int)`.

     * Parameter `empty-list` has type `τ₁` = `(list int)`, which is not the 
       same as `(list bool)`.



# Writing a Constraint Solver with a partner (60 percent)
<a name="prog"/>

19. Implementing and testing a constraint solver. Do Exercise 19 on page 498 of 
   Build, Prove, and Compare.
    
   You will want to share test cases for your `solve` function on piazza.
   To help with this testing, here are some useful functions:
```
val eqsubst : subst * subst -> bool   (* arguments are equivalent *)
val hasSolution     : con -> bool
val hasNoSolution   : con -> bool
val hasGoodSolution : con -> bool
val solutionEquivalentTo : con * subst -> bool
       (* solution to constraint is equivalent to subst *)
```

   You will use these functions in Unit tests, as in the following examples:
```
val () = Unit.checkAssert "int ~ bool cannot be solved"
         (fn () => hasNoSolution (inttype ~ booltype))

val () = Unit.checkAssert "bool ~ bool can be solved"
         (fn () => hasSolution (booltype ~ booltype))

val () = Unit.checkAssert "bool ~ bool is solved by the identity substitution"
         (fn () => solutionEquivalentTo (booltype ~ booltype, idsubst))

val () = Unit.checkAssert "bool ~ 'a is solved by 'a |--> bool"
         (fn () => solutionEquivalentTo (booltype ~ TYVAR "'a", 
                                         "'a" |--> booltype))
```

You will want additional tests—at least one for each of the nine cases in the 
constraint solver. To get you started, here are two more constraints:
```
TYVAR "a" ~ TYVAR "b" /\ TYVAR "b" ~ TYCON "bool"
CONAPP (TYCON "list", [TYVAR "a"]) ~ TYCON "int"
```

The useful functions are implemented by this code, which you will need to copy:
```
fun eqsubst (theta1, theta2) =
  let val domain  = union (dom theta2, dom theta1)
      fun eqOn a = (varsubst theta1 a = varsubst theta2 a)
  in  List.all eqOn domain
  end

fun hasSolution     c = (solve c; true) handle TypeError _ => false
fun hasGoodSolution c = solves (solve c, c) handle TypeError _ => false
val hasNoSolution : con -> bool = not o hasSolution
fun solutionEquivalentTo (c, theta) = eqsubst (solve c, theta)
```

Related reading:

* Section 7.4.1. It will familiarize you with the type system.

* The second bullet in the opening of Section 7.5, which introduces constraints.

* The opening of Section 7.5.2. This section explains constraints and shows 
   them in the typing rules. If you understand the constraint-based IF rule, 
   in both its simple form and its TypesOf form, you can stop there.

* The explanation of constraint solving in Section 7.5.3.

* Table 7.3 showing the correspondence between nano-ML's type sytem and code on 
  page 482.

* The definition of `con` and the utility functions in Section 7.6.3.

* The definition of function `solves` on page 487, which you can use to verify 
  solutions your solver claims to find.

<hr>

**C**. Difficult constraints. In file `constraints.sml`, write three constraints 
 that are difficult to solve. At least two should have no solution. Write your 
 constraints in a list in a single val definition of constraints:
   
 ```
val constraints = 
  [ TYVAR "a" ~ TYVAR "b" /\ TYVAR "b" ~ TYCON "bool"
  , CONAPP (TYCON "list", [TYVAR "a"]) ~ TYCON "int"
  , TYCON "bool" ~ TYCON "int"
  ]
 ```

Supply your own test cases, different from these. You are welcome to reuse 
constraints from your solver's unit tests.



# What and how to submit
<a name="submit"/>

Please submit four files:

 * `README.md` file with who you talked with about the assignment, who your 
   partner was if you had one,  and how many hours you spent on the assignment.

 * A text file `cqs.ml-infer.txt` containing your answers to the 
   reading-comprehension questions (you can start with the provided file)

 * A file `solver.sml` containing the solution to Exercise 19.

 * A file `constraints.sml` containing the solutions to Exercise **C**.

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.


# Hints and guidelines

## The nine-step process
For the constraint solver, the standard nine-step process applies. In 
particular,

* There are 9 forms of simple type-equality constraint (formed with the `~` 
  value constructor). For most forms, You will want two examples: one that is 
  solvable and one that is not. (Some forms have only unsolvable examples.) You 
  will want a unit test for each.

* There are also two other forms of constraint: conjunction constraints and the 
  trivial constraint. You will want many examples of conjunction constraints, 
  but to develop these examples, you will rely less on forms of data and more 
  about ideas on substitution that will be discussed on piazza.

## The constraint solver

A simple type-equality constraint has nine possible cases. We recommend unit 
testing each one. Not all cases are solvable, but for each case that may be 
solvable, we recommend two tests: one on a solvable constraint and one on an 
unsolvable constraint.

We also recommend unit testing the conjunction case. Examples from the book are 
a good place to start.

Once you have passed unit tests, we recommend an additional sanity check: The 
following code redefines solve into a version that checks itself for sanity (ie, 
idempotence).
```
fun isIdempotent pairs =
    let fun distinct a' (a, tau) = a <> a' 
                                   andalso not (member a' (freetyvars tau))
        fun good (prev', (a, tau)::next) =
              List.all (distinct a) prev' andalso List.all (distinct a) next
              andalso good ((a, tau)::prev', next)
          | good (_, []) = true
    in  good ([], pairs)
    end

val solve =
    fn c => let val theta = solve c
            in  if isIdempotent theta then theta
                else raise BugInTypeInference "non-idempotent substitution"
            end
```

## Debugging

If you need to look at internal data structures, I suggest using `eprint` and 
`eprintln` to print values. These functions expect strings, which you can 
produce using these functions:
```
val expString   : exp -> string
val defString   : def -> string
val typeString  : ty -> string
val constraintString : con -> string
val substString : subst -> string
```

The first four functions are included in the nml interpreter's source code. 
You'll need to define the fifth as follows:
```
fun substString pairs =
      separate ("idsubst", " o ")
      (map (fn (a, t) => a ^ " |--> " ^ typeString t) pairs)
```


# How your work will be evaluated
<a name="eval"/>

We will evaluate the structure and organization of your ML code using similar 
criteria for naming and documentation as from previous assignments. For 
indentation and layout, we'll look for conformance to the 
[Style Guide for Standard ML Programmers](https://www.cs.tufts.edu/comp/105-2019s/handouts/mlstyle.pdf), 
within the constraints imposed by the code from the book.

