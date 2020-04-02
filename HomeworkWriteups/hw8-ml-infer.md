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

FIXME
 The initial github repository will include the following
files:
 * `cqs.typesys.txt`
 * `Unit.sig`
 * `Unit.sml`
 * `build_prove_compare/`

To download an ML interpreter, install Moscow ML from https://mosml.org/.
Then you should have mosml on the command-line.

FIXME
You will need to use the Unit testing module provided by Dr. Ramsey.
To do so, compile it.
```
$ mosmlc -c Unit.sig
$ mosmlc -c Unit.sml
```

To run your code in `tree.sml`, you can create an executable as follows
```
$ mosmlc -o a.out -I . tree.sml
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
- use "tree.sml";
...
```

Instructions for using the typed Impcore.
```
cd build_prove_compare/bare/timpcore
make    // creates executable called timpcore
```

**NOTE**: There is a directory for tuscheme.  Unfortunately that
interpreter does not appear to work.  Thus you will just need to 
do your best trying to do the **TD** problem.  The grading will
be significantly less strict due to the lack of an interpreter.

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

FIXME
Read sections 7.3.2 and 7.4.1, which start on pages page 486 and page 487, respectively.
We have seen the symbols ρ, τ, and σ before, but not used exactly in this way.

Here is a list of semantic and type-related concepts you have seen written using single symbols:

an expression
a name
a location
a value
a type
a type scheme (new in this chapter)
a mapping from names to locations
a mapping from names to values
a mapping from names to types
a mapping from names to type schemes (new in this chapter)
There are lots of concepts and only so many symbols to go around. Please identify, from the preceding list, what each symbol stands for in the theory of nano-ML:

ρ

τ

σ

Γ

And finally,

Say briefly what, in nano-ML, is the difference between τ and σ:
You are preparing for exercise 19.

Read the first two pages of section 7.4.3, which explain “substitutions” and “instances.”

Yes or no: does the substitution (α → sym) ∘ (β → bool) ∘ (γ → int) replace type variable α with type sym?

Yes or no: does the substitution (α → sym) ∘ (β → bool) ∘ (γ → int) replace type variable β with type bool?

Yes or no: does the substitution (α → sym) ∘ (β → bool) ∘ (γ → int) leave the type γ list unchanged?

Which of the following are instances of the polymorphic type scheme ∀α . α list → int? For each one, please indicate whether it is an instance of the type scheme (True) or whether it is not an instance of the type scheme (False).

int list True or False

int list list True or False

int list list → int True or False

int * int list → list True or False

You have a foundation on which to build for exercises 18 and C.

Read the first page of section 7.5.2, which shows the form of a constraint. Then skip to the first page of section 7.5.3, which explains how to apply a substitution to a constraint.

We start with a substitution θ and a constraint C:

θ = (α₁ ↦ int)

C = α₁ ~ α₂ /\ α₂ ~ α₃ list /\ α₄ ~ α₃ list list.

Now define C′ = θ(C).

Write C′:

Does C′ have a solution? Answer yes or no.

Now define C″ as the result of applying substitution (α₂ ↦ int) to C.

Write C″:

Does C″ have a solution? Answer yes or no.

You are getting ready for exercises 18 and C.

Now read all of section 7.5.3, which explains how to solve constraints.

To demonstrate your understanding, reason about solving these four constraints:

C₁ = α ~ int

C₂ = α ~ bool

C₃ = C₁ /\ C₂

C₄ = α₁ ~ α₂ /\ α₂ list ~ α₁

Write a substitution θ₁ that solves constraint C₁:

Write a substitution θ₂ that solves constraint C₂:

Does the composition θ₂ ∘ θ₁ solve constraint C₃ = C₁ /\ C₂? Answer yes or no.

Can constraint C₃ be solved? Answer yes or no.

Can constraint C₄ be solved? Answer yes or no.

You are ready for excercises 18 and C.

Read the first two pages of section 7.5.2, which starts on page 502. Pay special attention to the Apply rule. Also read the footnote at the bottom of page 26 of Seven Lessons in Program Design.

Now consider type inference for the following expression e:

(f 3 #t)
For this question, assume the following:

Expression 3 has type int, with a trivial constraint.
Expression #t has type bool, with a trivial constraint.
Trivial constraints can be ignored.
Every type variable except 'a, 'b, and 'c is “fresh.”
Answer both parts:

Assume that f is bound in Γ to the type scheme ∀.'a × 'b → 'c. (The ∀ is supposed to be empty.) In judgment C, Γ ⊢ e : τ, what does the type checker output for τ?

And what does the type checker output for C?

Assume that f is bound in Γ to the type scheme ∀.'a. In judgment C, Γ ⊢ e : τ, what does the type checker output for τ?

And what does the type checker output for C?

You are ready for the easy parts of exercise 19.

Read the paragraphs that describe the nondeterministic typing rules for lambda and for “Milner’s Let”, which you will find on page 495. Especially, read the small paragraph following the lambda rule.

Now look at the val definition of too-poly in code chunk 495. The right-hand side of the val definition is a lambda expression with the name empty-list playing the role of x₁.

The rule for lambda says that we can pick any type τ₁ for empty-list. After we’ve chosen τ₁, what is the type scheme to which empty-list (playing x₁) is bound in the extended environment which is used to check e? (Hint: this type scheme comes from the lambda rule, as per the discussion in the small paragraph, and it is different from the type scheme of the empty-list that appears in the top-level val binding.)

Given that the rule for lambda says that we can pick any type τ₁ for empty-list, why can’t we pick a τ₁ that makes the lambda expression type-check? Put the word YES next to the best explanation:

Parameter empty-list has to have type (forall ('a) (list 'a)), but τ₁ is not a forall type.

Parameter empty-list has type τ₁ = (list 'a), which is not the same as (list bool).

Parameter empty-list can have any type τ₁ but no τ₁ can be equivalent to both (list int) and (list bool).

Parameter empty-list has type τ₁ = (list bool), which is not the same as (list int).

Parameter empty-list has type τ₁ = (list int), which is not the same as (list bool).

You are ready for exercise 3 and for one of the hard parts of exercise 19.

Now look at the definition of not-too-poly in code chunk 496. The right-hand side is an example of Milner’s let with empty-list playing the role of x, the literal '() playing the role of e′, and an application of pair playing the role of e. Suppose that Γ ⊢ '() : β list, where β is a type variable that does not appear anywhere in Γ. That is to say, the literal '() is given the type β list, which is playing the role of τ’.

If τ’ is β list, what are its free type variables?

What set plays the role of { α₁, ..., αₙ }, which is ftv(τ’)-ftv(Γ)?

What is the type scheme to which empty-list (playing x) is bound in the extended environment which is used to check e?

You are ready for all of exercise 19.


# Writing a Constraint Solver with a partner (60 percent)
<a name="prog"/>

18. Implementing and testing a constraint solver. Do exercise 18 on page 539 of Build, Prove, and Compare. This exercise is probably the most difficult part of the assignment. Before proceeding with type inference, make sure your solver produces the correct result on our test cases and on your test cases. You may also want to show your solver code to the course staff.

Testing: Your constraint solver can be tested only by internal Unit tests. To help with this testing, here are some useful functions:

val eqsubst : subst * subst -> bool   (* arguments are equivalent *)
val hasSolution     : con -> bool
val hasNoSolution   : con -> bool
val hasGoodSolution : con -> bool
val solutionEquivalentTo : con * subst -> bool
       (* solution to constraint is equivalent to subst *)
You will use these functions in Unit tests, as in the following examples:

val () = Unit.checkAssert "int ~ bool cannot be solved"
         (fn () => hasNoSolution (inttype ~ booltype))

val () = Unit.checkAssert "bool ~ bool can be solved"
         (fn () => hasSolution (booltype ~ booltype))

val () = Unit.checkAssert "bool ~ bool is solved by the identity substitution"
         (fn () => solutionEquivalentTo (booltype ~ booltype, idsubst))

val () = Unit.checkAssert "bool ~ 'a is solved by 'a |--> bool"
         (fn () => solutionEquivalentTo (booltype ~ TYVAR "'a", 
                                         "'a" |--> booltype))
You will want additional tests—at least one for each of the nine cases in the constraint solver. To get you started, here are two more constraints:

TYVAR "a" ~ TYVAR "b" /\ TYVAR "b" ~ TYCON "bool"
CONAPP (TYCON "list", [TYVAR "a"]) ~ TYCON "int"
The useful functions are implemented by this code, which you will need to copy:

fun eqsubst (theta1, theta2) =
  let val domain  = union (dom theta2, dom theta1)
      fun eqOn a = (varsubst theta1 a = varsubst theta2 a)
  in  List.all eqOn domain
  end

fun hasSolution     c = (solve c; true) handle TypeError _ => false
fun hasGoodSolution c = solves (solve c, c) handle TypeError _ => false
val hasNoSolution : con -> bool = not o hasSolution
fun solutionEquivalentTo (c, theta) = eqsubst (solve c, theta)
Related reading:

Section 7.4.1, which starts on page 487. It will familiarize you with the type system.

The second bullet in the opening of section 7.5, which introduces constraints.

The opening of section 7.5.2, which starts on page 502. This section explains constraints and shows them in the typing rules. If you understand the constraint-based IF rule, in both its simple form and its TypesOf form, you can stop there.

The explanation of constraint solving in section 7.5.3, which starts on page 511.

The table showing the correspondence between nano-ML’s type sytem and code on page 516.

The definition of con and the utility functions in section 7.6.4, which starts on page 520.

The definition of function solves on page 522, which you can use to verify solutions your solver claims to find.

C. Difficult constraints. In file constraints.sml, write three constraints that are difficult to solve. At least two should have no solution. Write your constraints in a list in a single val definition of constraints:

val constraints = 
  [ TYVAR "a" ~ TYVAR "b" /\ TYVAR "b" ~ TYCON "bool"
  , CONAPP (TYCON "list", [TYVAR "a"]) ~ TYCON "int"
  , TYCON "bool" ~ TYCON "int"
  ]
Supply your own test cases, different from these. You are welcome to reuse constraints from your solver’s unit tests.

To make sure it is well formed, typecheck your file by running the Unix command

105-check-constraints constraints.sml



# What and how to submit
<a name="submit"/>


Please submit five files:

 * `README.md` file with who you talked with about the assignment, who your 
   partner was if you had one,  and how many hours you spent on the assignment.

 * A text file `cqs.ml-infer.txt` containing your answers to the 
   reading-comprehension questions (you can start with the provided file)

 * A file `constraints.sml` containing the solutions to Exercise **C**.

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.

FIXME: LEFTOFF here
# How your work will be evaluated
<a name="eval"/>

We will evaluate the structure and organization of your Typed μScheme code using 
the same criteria as used in previous homework assignments. We will evaluate the 
structure and organization of your ML code using similar criteria for naming and 
documentation. For indentation and layout, we’ll look for conformance to the 
[Style Guide for Standard ML Programmers](https://www.cs.tufts.edu/comp/105-2019s/handouts/mlstyle.pdf), 
within the constraints imposed by the code from the book.

