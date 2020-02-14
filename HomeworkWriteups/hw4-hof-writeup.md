# HW4 Higher-Order Functions

CSc 520 Spring 2020 Assignment

* [Overview](#overview)

* [Getting Started](#start)

* [Dire Warnings](#warnings)

* [Reading Comprehension (10 percent)](#read)

* [Programming and Proof Problems (90 percent)](#prog)

* [What and how to submit](#submit)

* [Avoid common mistakes](#mistakes)

* [How your work will be evaluated](#eval)


**Due Friday, February 28th, 2020 at 11:59PM**

This assignment is all individual work. 
There is **no pair programming**.
Additionally, we no longer provide a template for your programming 
solution. We trust that you are now proficient enough to create a 
solution in line with the style guide and the assignment.


# Overview
<a name="overview"/>

The purpose of this assignment is to give you sufficient experience 
using first-class and higher-order functions that you can incorporate 
them into your programming practice. You will use existing higher-order 
functions, define higher-order functions that consume functions, and 
define higher-order functions that return functions. The assignment 
builds on what you've already done, and it adds new ideas and techniques 
that are described in Sections 2.7, 2.8, and 2.9 of Ramsey's book.

# Getting Started
<a name="start"/>

Accept the github assignment at https://classroom.github.com/a/Q-r-0t2c
and do a git clone of your repository.  Make sure to `get commit -a` and
`git push` frequently!

To create the executable μScheme interpreter, do the following in a clone
of your assignment repository.
```
    cd build-prove-compare/bare/uscheme
    make
    cp uscheme ../../../
    cd ../../../
    ./uscheme -q < solution.scm   // to see if that worked
```


# Dire Warnings
<a name="warnings"/>

Since we are studying functional programming, the μScheme programs you submit 
must not use any imperative features. **Banish `set`, `while`, `println`, 
`print`, `printu`, and `begin` from your vocabulary! If you break this rule for 
any problem, you will get No Credit for that problem.** You may find it useful 
to use `begin` and `println` while debugging, but they must not appear in any 
code you submit. As a substitute for assignment, use `let` or `let*`.

**Except as noted below, do not define helper functions at top level**.
Instead, use let or letrec to define helper functions. When you do use 
let to define inner helper functions, avoid passing as parameters values 
that are already available in the environment.


Your solutions must be valid μScheme; in particular, they must pass the 
following test:
```
   ./uscheme -q < myfilename
```
without any error messages or unit-test failures. If your file produces error 
messages, we won't test your solution and you will earn No Credit for functional 
correctness. (You can still earn credit for structure and organization). If your 
file includes failing unit tests, you might possibly get some credit for 
functional correctness, but we cannot guarantee it.

Code you submit must not even mention &trace. We recommend that you use &trace 
only at the interactive prompt.

We will evaluate functional correctness by testing your code extensively. 
**Because this testing is automatic, each function must be named be exactly 
as described in each question. Misnamed functions earn No Credit.**


# Reading Comprehension (10 percent)
<a name="read"/>


Answer these questions before starting the rest of the assignment. 
There is a cqs.hof.txt in the starter github repository.

1. The first step in this assignment is to learn the standard higher-order
   functions on lists, which you will use a lot. Suppose you need a list, or 
   a Boolean, or a function—what can you call?

   Review Sections 2.7.2, 2.8.1, and 2.8.2. Now consider each of the 
   following functions:
```
  map  filter  exists?  all?  curry  uncurry  foldl  foldr
```
   Put each function into exactly one of the following four categories:

 * (B) Always returns a Boolean
 * (F) Always returns a function
 * (L) Always returns a list
 * (A) Can return anything (including a Boolean, a function, or a list)

   After each function, write (B), (F), (L), or (A):
```
 map  

 filter  

 exists?  

 all?  

 curry  

 uncurry  

 foldl  

 foldr
```

2. Here are the same functions again:
```
  map  filter  exists?  all?  curry  uncurry  foldl  foldr
```
For each function, say which of the following five categories best describes 
it. Pick the most specific category (e.g., (S) is more specific than (L) or (M), 
and all of these are more specific than (?)).

 * (S) Takes a list & a function; returns a list of exactly the same size
 * (L) Takes a list & a function; returns a list of at least the same size
 * (M) Takes a list & a function; returns a list of at most the same size
 * (?) Might return a list
 * (V) Never returns a list

After each function, write (S), (L), (M), (?), or (V):
```
 map  

 filter  

 exists?  

 all?  

 curry  

 uncurry  

 foldl  

 foldr
```

3. Here are the same functions again:
```
  map  filter  exists?  all?  curry  uncurry  foldl  foldr
```
   Put each function into exactly one of the following categories. Always pick 
   the most specific category (e.g. (F2) is more specific than (F)).

 * (F) Takes a single argument: a function
 * (F2) Takes a single argument: a function that itself takes two arguments
 * (+) Takes more than one argument

After each function, write (F), (F2), or (+):
```
 map  

 filter  

 exists?  

 all?  

 curry  

 uncurry  

 foldl  

 foldr
``` 
   You are now ready to tackle most parts of Exercise 14.

4. Review the difference between foldr and foldl in Section 2.8.1. You may also 
   find it helpful to look at their implementations in Section 2.8.3, which 
   starts on page 135; the implementations are at the end.

  * (a) Do you expect `(foldl + 0 '(1 2 3))` and `(foldr + 0 '(1 2 3))` to be 
    the same or different?

  * (b) Do you expect `(foldl cons '() '(1 2 3))` and 
    `(foldr cons '() '(1 2 3))` to be the same or different?

  * (c) Look at the initial basis, which is summarized on 161. Give one example
    of a function, other than `+` or `cons`, that can be passed as the first 
    argument to `foldl` or `foldr`, such that `foldl` always returns exactly the 
    same result as `foldr`.

  * (d) Give one example of a function, other than `+` or `cons`, that can be 
    passed as the first argument to `foldl` or `foldr`, such that `foldl` may 
    return a different result from `foldr`.

   You are now ready to tackle all parts of Exercises 14 and 15.

5. Read the third Lesson in [Program Design: Higher-Order 
   Functions](https://www.cs.tufts.edu/comp/105-2019s/design/lessons.pdf)
   (you will probably want to skim/read the first 2 lessons as well). The 3rd 
   lesson mentions a higher-order function flip, which can convert < into >, 
   among other tricks. Write as many algebraic laws as are needed to specify 
   flip:



6. Review function composition and currying, as described in Section 2.7.2. 
   Then judge the proposed properties below, which propose equality of 
   functions, according to these rules:

  * Assume that names `curry`, `o`, `<`, `*`, `cons`, `even?`, and `odd?` 
    have the definitions you would expect, but that m may have any value.

  * Each property proposes to equate two functions. If the functions are 
    equal—which is to say, when both sides are applied to an argument, they 
    always produce the same result—then mark the property Good. But if there is 
    any argument on which the left-hand side produces different results from the 
    right, mark the property Bad.

   Mark each property Good or Bad:
```
((curry <) m)     == (lambda (n) (< m n))

((curry <) m)     == (lambda (n) (< n m))

((curry cons) 10) == (lambda (xs) (cons 10 xs))

(o odd?  (lambda (n) (* 3 n))) == odd?

(o even? (lambda (n) (* 4 n))) == even?
```
You are now ready to tackle the first three parts of Exercise 19, 
as well as problem M below.



# Programming and Proof Problems (90 percent)
<a name="prog"/>

## Overview

For this assignment, you will do Exercises 14 (b-f,h,j), 15, and 19, from 
pages 196 to 199 of Build, Prove, and Compare, plus the exercises A, F, M, 
and O below.

A summary of the initial basis can be found on page 161. While you're working 
on this homework, keep it handy.

Each top-level function you define must be accompanied by a contract and unit 
tests. Each named internal function written with lambda should be accompanied by 
a contract, but internal functions cannot be unit-tested. (Anonymous lambda 
functions need not have contracts.) Algebraic laws are required only where noted 
below; each problem is accompanied by a Laws section, which says what is needed 
in the way of algebraic laws.

## Book problems

14. *Higher-order functions*. Do Exercise 14 on page 196 of Build, Prove, and 
    Compare, parts (b) to (f), part (h), and part (j). Note which functions 
    accept only nonempty lists, and code accordingly. **You must not use 
    recursion--solutions using recursion will receive No Credit.** 
    (This restriction applies only to code you write. For example, gcd, which is 
    defined in the initial basis, may use recursion.)

    Because you are not defining recursive functions, you need not write any 
    algebraic laws.

    For this problem only, you may define one helper function at top level.

    Related reading: For material on higher-order functions, see Sections 2.8.1 
    and 2.8.2 starting on Page 131. For material on curry, see Section 2.7.2.

    Laws: These functions must not be recursive, should not do any case 
    analysis, and do not return functions. Therefore, no algebraic laws are 
    needed.

15. *Higher-order functions.* Do Exercise 15 on page 197. **You must not use 
    recursion—solutions using recursion will receive No Credit.** As above, this 
    restriction applies only to code you write.

    Because you are not defining recursive functions, you need not write any 
    algebraic laws.


    Related reading: Examples of foldl and foldr are in Sections 2.8.1 and 
    2.8.2. You may also find it helpful to study the implementations of foldl 
    and foldr in Section 2.8.3; the implementations are at the end. Information 
    on lambda can be found in section 2.7.

    Laws: These functions must not be recursive, should not begin with case 
    analysis, and do not return functions. Therefore, no algebraic laws are 
    needed.

19. Functions as values. Do Exercise 19 on page 199 of Build, Prove, and 
   Compare. You cannot represent these sets using lists. If any part of your 
   code to construct or to interrogate a set uses `cons, car, cdr, or null?`,
   you are doing the problem wrong.

   Do all four parts:

   * Parts (a) and (b) require no special instructions.

   * In Part (c), your add-element function must take two parameters: the 
    element to be added as the first parameter and the set as the second 
    parameter. When you code Part (c), compare values for equality using the 
    `equal?` function.

     To help you design Part (c), put comments in your source code that complete 
     the right-hand sides of the following properties:
```
    (member? x (add-element x s)) == ...
    (member? x (add-element y s)) == ..., where (not (equal? y x))
    (member? x (union s1 s2))     == ...
    (member? x (inter s1 s2))     == ...
    (member? x (diff  s1 s2))     == ...
```
   The properties are not quite algorithmic, but they should help anyway.

   * In Part (d), when you code the third approach to polymorphism, write a 
   function set-ops-from that places your set functions in a record. To define 
   record functions, use the syntactic sugar described in the book in Section 
   2.15.6. In particular, be sure your code includes this record definition:
```
    (record set-ops (empty member? add-element union inter diff))
```
   Code your solution to Part (d) as a function set-ops-from, which will accept 
   one argument (an equality predicate) and will return a record created by 
   calling `make-set-ops`. Your function might look like this:
```
    (define set-ops-from (eq?)
      (let ([empty   ...]
            [member? ...]
            [add     ...]
            [union   ...]
            [inter   ...]
            [diff    ...])
        (make-set-ops empty member? add union inter diff)))
```
   Fill in each ... with your own implementations. Each implementation is like 
   one you wrote in Part (c), except instead of using the predefined `equal?`, 
   it uses the parameter `eq?`—that is what is meant by "the third approach to 
   polymorphism."

   No additional laws are needed for part (d).

   To help you get part (d) right, we recommend that you use these unit tests:
```
    (check-assert (procedure? set-ops-from))
    (check-assert (set-ops? (set-ops-from =)))
```
   And to write your own unit tests for the functions in part (d), you may use    
   these definitions:
```
    (val atom-set-ops (set-ops-from =))
    (val atom-emptyset      (set-ops-empty atom-set-ops))
    (val atom-member?      (set-ops-member? atom-set-ops))
    (val atom-add-element  (set-ops-add-element atom-set-ops)) 
    (val atom-union        (set-ops-union atom-set-ops))
    (val atom-inter        (set-ops-inter atom-set-ops))
    (val atom-diff         (set-ops-diff atom-set-ops))
```
   Hint: See the "arrays as functions" exercise on piazza.

Related reading: For functions as values, see the examples of lambda in the 
first part of Section 2.7, and also the array exercise piazza. For function 
composition and currying, see Section 2.7.2. For polymorphism, see Section 2.9.

Laws: Complete the right-hand sides of the properties listed above. These 
properties say what happens when `member?` is applied to any set created with 
any of the other functions. No other laws are needed.

## Relating imperative code to functional code

A. Good functional style. The Impcore-with-locals function
```
    (define f-imperative (y) [locals x]
      (begin 
        (set x e)
        (while (p? x y) 
           (set x (g x y)))
        (h x y)))
```
is in a typical imperative style, with assignment and looping. Write an 
equivalent μScheme function `f-functional` that doesn't use the imperative 
features begin (sequencing), while (goto), and set (assignment).

 * Assume that `p?`, `g`, and `h` are free variables which refer to externally 
   defined functions.

 * Assume that `e` is an arbitrary expression.

 * Use as many helper functions as you like, as long as they are defined using 
   `let` or `letrec` and not at top level.

 * You need not write any algebraic laws.

 * You need not write any unit tests. (And we recommend against trying to 
   unit-test this function.)

Hint #1: If you have trouble getting started, rewrite `while` to use `if` and 
`goto`. Now, what is like a `goto`?

Hint #2: `(set x e)` binds the value of `e` to the name `x`. What other ways 
do you know of binding the value of an expression to a name?

Don't be confused about the purpose of this exercise. The exercise is a thought 
experiment. We don’t want you to write and run code for some particular choice 
of `g`, `h`, `p?`, `e`, `x`, and `y`. Instead, we want you write a function that 
works the same as `f-imperative` given any choice of `g`, `h`,` p?`, `e`, `x`, 
and `y`. So for example, if `f-imperative` would loop forever on some inputs, 
your `f-functional` must also loop forever on exactly the same inputs.

The point of the exercise is not only to show that you can program without 
imperative features, but also to help you develop a technique for eliminating 
such features.

Related reading: No part of the book bears directly on this question. You're 
better off reviewing your experience with recursive functions and perhaps the 
solutions for the Scheme assignment.

Laws: This problem doesn't need laws.

## A function that returns a function

F. The third lesson in [Program Design: Higher-Order 
   Functions](https://www.cs.tufts.edu/comp/105-2019s/design/lessons.pdf) 
   ("Higher-order functions") mentions a higher-order function `flip`, which 
   can convert `<` into `>`, among other tricks. Using your algebraic law or 
   laws from the comprehension questions, define `flip`. Don't forget unit 
   tests.

   Related reading: Seven Lessons in Program Design, lesson 3.

   Laws: Use your law or laws from the comprehension questions.




# What and how to submit
<a name="submit"/>

Please submit four files:

 * A README.md file containing
   * The names of the people with whom you collaborated (i.e. talked with
     about the assignment, no pair programming for this one, don't share code)

   * A list identifying which problems that you solved

   * The number of hours you worked on the assignment

 * A text file cqs.scheme.txt containing your answers to the 
     reading-comprehension questions (you can start with the provided file)

 * A PDF file theory.pdf containing the solutions to Exercises 1, 31, and A. 
   If you already know LaTeX, by all means use it. Otherwise, write your 
   solution by hand and scan it. Do check with someone else who can confirm 
   that your work is legible—if we cannot read your work, we cannot grade it.

 * A file solution.scm containing the solutions to all the other exercises.

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.

# How your work will be evaluated
<a name="eval"/>

## Programming in μScheme
The criteria we will use to assess the structure and organization of your 
μScheme code, which are described in detail below, are mostly the same as the 
criteria in the general coding rubric, which we used to assess your Impcore 
code. But some additional criteria appear below.

### Code must be well structured

We're looking for functional programs that use Boolean and name bindings 
idiomatically. Case analysis must be kept to a minimum.


#### Exemplary

 * The assignment does not use set, while, print, or begin.

 * Wherever Booleans are called for, code uses Boolean values #t and #f.

 * The code has as little case analysis as possible (i.e., the course staff can 
   see no simple way to eliminate any case analysis)

 * When possible, inner functions use the parameters and let-bound names of 
   outer functions directly.

#### Satisfactory

 * The code contains case analysis that the course staff can see follows from 
   the structure of the data, but that could be simplified away by applying 
   equational reasoning.

 * An inner function is passed, as a parameter, the value of a parameter or 
   let-bound variable of an outer function, which it could have accessed 
   directly.

#### Must Improve

 * Some code uses set, while, print, or begin (No Credit).

 * Code uses integers, like 0 or 1, where Booleans are called for.

 * The code contains superfluous case analysis that is not mandated by the 
   structure of the data.

### Code must be well laid out, with attention to vertical space

In addition to following the layout rules in the general coding rubric (80 
columns, no offside violations), we expect you to use vertical space wisely.

#### Exemplary

 * Code is laid out in a way that makes good use of scarce vertical space. 
   Blank lines are used judiciously to break large blocks of code into groups, 
   each of which can be understood as a unit.

#### Satisfactory

 * Code has a few too many blank lines.

 * Code needs a few more blank lines to break big blocks into smaller chunks 
   that course staff can more easily understand.

#### Must Improve

 * Code wastes scarce vertical space with too many blank lines, block or line 
   comments, or syntactic markers carrying no information.

 * Code preserves vertical space too aggressively, using so few blank lines that 
   a reader suffers from a “wall of text” effect.

 * Code preserves vertical space too aggressively by crowding multiple 
   expressions onto a line using some kind of greedy algorithm, as opposed to a 
   layout that communicates the syntactic structure of the code.

 * In some parts of code, every single line of code is separated form its 
   neighbor by a blank line, throwing away half of the vertical space (serious 
   fault).

### Code must load without errors

Ideally you want to pass all of our correctness tests, but at minimum, your own 
code must load and pass its own unit tests.

#### Exemplary

 * Your μScheme code loads without errors.

 * Your code passes all the tests we can devise.

 * Or, your code passes all tests but one.

#### Satisfactory

 * Your code fails a few of our stringent tests.

#### Must Improve


### Costs of list tests must be appropriate

Be sure you can identify a nonempty list in constant time.

#### Exemplary

 * Empty lists are distinguished from non-empty lists in constant time.

#### Satisfactory

None here.

#### Must Improve

 * Distinguishing an empty list from a non-empty list might take longer than 
   constant time.

### Your proofs

The proofs for this homework are different from the derivations and 
metatheoretic proofs from the operational-semantics homework, and different 
criteria apply.

#### Exemplary

 * Course staff find proofs short, clear, and convincing.

 * Proofs have exactly as much case analysis as is needed (which could mean no  
   case analysis)

 * Proofs by induction explicitly say what data is inducted over and clearly 
   identify the induction hypothesis.

 * Each calculational proof is laid out as shown in the textbook, with each term 
   on one line, and every equals sign between two terms has a comment that 
   explains why the two terms are equal.

#### Satisfactory

Course staff find a proof clear and convincing, but a bit long.

 * Or, course staff have to work a bit too hard to understand a proof.

 * A proof has a case analysis which is complete but could be eliminated.

 * A proof by induction doesn’t say explicitly what data is inducted over, but 
   course staff can figure it out.

 * A proof by induction is not explicit about what the induction hypothesis is, 
   but course staff can figure it out.

 * Each calculational proof is laid out as shown in the textbook, with each term 
   on one line, and most of the the equals signs between terms have comments 
   that explain why the two terms are equal.

#### Must Improve

Course staff don't understand a proof or aren't convinced by it.

 * A proof has an incomplete case analysis: not all cases are covered.

 * In a proof by induction, course staff cannot figure out what data is 
   inducted over.

 * In a proof by induction, course staff cannot figure out what the induction 
   hypothesis is.

 * A calculational proof is laid out correctly, but few of the equalities are 
   explained.

 * A calculational proof is called for, but course staff cannot recognize its 
   structure as being the same structure shown in the book.
