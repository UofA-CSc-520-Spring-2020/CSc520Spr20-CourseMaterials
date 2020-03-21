# HW6 Core ML

CSc 520 Spring 2020 Assignment

* [Overview](#overview)

* [Getting Started](#start)

* [What we expect from your submission](#expect)

* [Reading Comprehension (30 percent)](#read)

* [Programming in ML Warmup (70 percent)](#prog)

* [What and how to submit](#submit)

* [Avoid common mistakes](#mistakes)


**Due Friday, March 27, 2020 at 11:59PM**

This assignment is all individual work. 
There is **no pair programming**.


# Overview
<a name="overview"/>

The purpose of this assignment is to help you get acclimated to programming in Standard ML, which you will use in the next 
few weeks to implement parts of type systems. The assignment has two parts:

 * To begin, you will answer some questions about reading.

 * Then you will write many small exercises.

# Getting Started
<a name="start"/>

## Setup

Accept the github assignment at https://classroom.github.com/a/oJjhAIv7
and do a git clone of your repository.  Make sure to `git commit -a` and
`git push` frequently!  The initial github repository will include the following
files:
 * cqs.ml.txt
 * Unit.sig
 * Unit.sml
 * warmup.sml

To download an ML interpreter, install Moscow ML from [https://mosml.org/].
Then you should have mosml on the command-line.  The Mac package works fine.
There are piazza points available for anyone who explains if there are any 
issues with installing the Windows or Linux versions.

You will need to use the Unit testing module provided by Dr. Ramsey.
To do so, compile it.
```
$ mosmlc -c Unit.sig
$ mosmlc -c Unit.sml
```

To run your code in warmup.sml, you can create an executable as follows
```
$ mosmlc -o a.out -I . warmup.sml
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
- use "warmup.sml";
[opening file "warmup.sml"]
The only internal Unit test passed.
> val 'a mynull = fn : 'a list -> bool
[closing file "warmup.sml"]
> val it = () : unit
```

## The initial basis

As in the hofs assignment, we expect you to use the initial basis, which is 
properly known as the 
[Standard ML Basis Library](http://www.sml-family.org/Basis/). 
By the standards of popular languages, the basis is quite small, but it is still 
much more than you can learn in a week. Fortunately, you only have to learn a 
few key parts:

* Type constructors list, 
  [`option`](http://sml-family.org/Basis/option.html#SIG:OPTION.option:TY), 
  `bool`, `int`, `string`, and 
  [order](http://sml-family.org/Basis/general.html#SIG:GENERAL.order:TY)

* Modules [`List`](http://sml-family.org/Basis/list.html#List:STR:SPEC) and 
  [`Option`](http://sml-family.org/Basis/option.html#Option:STR:SPEC),
  including `List.filter`, `List.exists`, `List.find`, and others

* Other module functions `Int.toString`, `Int.compare`, and `String.compare`

* Top-level functions `o`, `print` (for debugging), `map`, `app`, `foldr`, 
  `foldl`

* Ramsey's `Unit` module, which is not part of the Basis Library but is 
  described in Dr. Ramsey's guide [Learning Standard  ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing).
  
The most convenient guide to the basis is the Moscow ML help system; type
```
  - help "";
```
at the mosml interactive prompt.



## Unit testing
<a name="unit"/>


Regrettably, standard ML does not have check-expect and friends built in. Unit 
tests can be simulated by using higher-order functions, but it's a pain.
Here are some examples of tests written with our Unit module:
```
val () =
    Unit.checkExpectWith Int.toString "2 means the third"
    (fn () => List.nth ([1, 2, 3], 2)) 
    3

val () =      (* this test fails *)
    Unit.checkExpectWith Bool.toString "2 is false"
    (fn () => List.nth ([true, false, true], 2)) 
    false

val () = Unit.reportWhenFailures ()
```
If you include these tests (and only these tests) in your warmup.sml file,
you can run them on the Unix shell command line, using mosmlc (with a "c"):
```
$ mosmlc -o a.out -I . warmup.sml
$ ./a.out
In test '2 is false', expected value false but got true
One of two internal Unit tests passed.
$ 
```
You’ll use `Unit.checkExpectWith` to write your own unit tests. You'll also use 
`Unit.checkAssert` and `Unit.checkExnWith`. The details are in
[Learning Standard ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing).

Each call to `Unit.checkExpectWith` needs to receive a string-conversion 
function. These functions are written using the string-conversion builders in 
the `Unit` module. Here are some examples of code you can use:
```
val checkExpectInt     = Unit.checkExpectWith Unit.intString
val checkExpectIntList = Unit.checkExpectWith (Unit.listString Unit.intString)
val checkExpectStringList = Unit.checkExpectWith (Unit.listString Unit.stringString)
val checkExpectISList =
  Unit.checkExpectWith (Unit.listString
                        (Unit.pairString Unit.intString Unit.stringString))
val checkExpectIntListList = 
  Unit.checkExpectWith (Unit.listString (Unit.listString Unit.intString))
```

## Things you need to review before starting

Dr. Ramsey provides a guide to
(Learning Standard ML)[https://www.cs.tufts.edu/comp/105-2019s/readings/ml.pdf].  
*Learning Standard ML* will guide you to other reading.

The fourth [Lessons in Program Design](https://www.cs.tufts.edu/comp/105-2019s/design/lessons.pdf)
explains how to apply our nine-step design process with types and pattern 
matching. This lesson includes the key code excerpts needed to design and 
program with standard type constructors `list`, `option bool`, `int`, `string`, 
and `order`, as well as the tree constructor that will be on next week's 
homework. Immediately following the lesson, you will find a one-page 
summary of ML syntax.

# What we expect from your submission
<a name="expect"/>

We expect you will submit code that compiles, has the types given in the 
assignment, is acceptably styled, is tested, avoids redundant case analysis, and 
avoids forbidden functions and constructs. Code that does not compile, that has 
the wrong types, or that uses forbidden functions or constructs will earn **No 
Credit**. Code that is untested or has redundant case analysis may earn 
disappointing grades for structure and organization.

## We expect the right types
As always, your code is assessed in part through automated testing. To be 
testable, each function must not only have the correct *name*; it must also 
have the correct type. Your type definitions must also match the 
type definitions given in the assignment.

## We expect wise, well-formatted unit tests

By this time, we expect that you understand the value of unit tests. Grading 
will focus on your code; your unit tests won't 
be graded. But we still expect the following:

* You will use unit tests wisely. If a function is simple, do take a minute to 
  validate it with a unit test. If a function is not so simple, develop unit 
  tests in the same way you have done for the past three assignments: one unit 
  test per case in the code.

* If you need debugging help during office hours, we expect that your code will 
  be accompanied by failing unit tests. (If you cannot get your code to 
  typecheck, we will help you do this without unit tests. But if you need help 
  getting code to produce right answers, we will demand to see your unit tests.)


## We expect case analysis only when necessary

Case analysis is the enemy. All the more so when it is not necessary. Redundant 
case analysis is a problem in all levels of programming, but as you are learning 
ML, it is especially easy to fall into. Redundant case analysis typically 
manifests in one of two ways:

1. Two cases are present in a fun, or case, but one is completely subsumed by 
   the other. The most common example is one case to handle the empty list and 
   another case that handles all lists. The empty-list case is often redundant.

   Example:
    ```
    fun append ([], ys) = ys
      | append (xs, ys) = foldr op :: ys xs
    ```
   In this code, the first case is subsumed by the second. It can be eliminated 
   without changing the meaning of the code, and eliminating it typically 
   improves performance.

2. A case analysis is performed where no case analysis is needed.
```
fun sum []        = 0
  | sum (n :: ns) = foldl op + n ns
```
These two cases should be replaced by a single case:
```
fun sum ns = foldl op + 0 ns
```
We expect you to examine your code carefully and to remove all redundant case 
analyses.

## We don't expect written algebraic laws

We expect you to continue using a systematic design process, but because 
ML code is so close to algebraic laws, we don't expect you to write 
algebraic laws separately. If you come to office hours, however, we do 
expect you to be able to talk about algebraic laws and to write them 
down.

## We expect an acceptable style

Nobody can learn good style in a week. But you can learn to imitate somebody 
else's style, and we expect you to be judicious about what style you imitate. You have access to books Ramsey and Harper, and to a technical report by Tofte. 
These sources are not equally good:

  Ramsey’s code, starting in Chapter 5, is a better guide to what ML should look 
  like. Harper’s code is also very good, and Tofte’s code is reasonable.

On this assignment, we expect you to devote a little effort to good style. Focus 
on getting your code working first. Then submit it. Then pick up our [Style 
Guide for Standard ML Programmers](https://www.cs.tufts.edu/comp/105-2019s/handouts/mlstyle.pdf), 
which contains many examples of good and bad style. Edit your code lightly to 
conform to the style guide, and submit it again.

In the long run, we expect you to master and follow the guidelines in the 
[style guide](https://www.cs.tufts.edu/comp/105-2019s/handouts/mlstyle.pdf).

## We expect you to remove redundant parentheses
As a novice, you’ll be uncertain about where to put parentheses—and you may wind up putting them everywhere. We are fine with parentheses used to disambiguate infix operators, but other redundant parentheses are not OK.

## We expect you to avoid forbidden functions and constructs

While not everybody can learn good style quickly, everybody can learn to 
avoid the worst faults. In ML, you must avoid these functions and idioms:

* Unlike μScheme, Standard ML provides a `length` function in the initial basis. 
  It is banned. The entire assignment must be solved without using length.

  **Solutions that use `length` will earn No Credit.**

* Use function definition by pattern matching. Do not use the functions `null`, 
  `mynull`, `hd`, and `tl`; use patterns instead.

  **Solutions that use `hd` or `tl` will earn No Credit.**

* Except for functions given below, *do not define auxiliary functions at top 
  level*. Use `local` or `let`. You will find it useful to use `local` to define 
  functions for use in unit tests.

  **Solutions that define auxiliary functions at top level will earn 
    No Credit.**

* Do not use `open`; if needed, use short abbreviations for common structures. 
  For example, if you want frequent access to the `ListPair` structure, you can 
  write
```
structure LP = ListPair
```
  and from there on you can refer to, e.g., `LP.map`.

  **Solutions that use open may earn No Credit for your entire assignment.**

* Unless the problem explicitly says it is OK, do not use any imperative 
  features.

  Unless explicitly exempted, **solutions that use imperative features will earn 
  No Credit.**


# Reading Comprehension (30 percent)
<a name="read"/>

These problems will help guide you through the reading. We recommend 
that you complete them before starting the other problems below. 
There is a `cqs.ml.txt` in the starter github repository.

These questions are meant to guide you through the readings that will help you 
complete the assignment. Keep your answers brief and simple.

1. Read section 5.1 of [Harper](http://www.cs.cmu.edu/~rwh/isml/book.pdf) about 
   tuple types and tuple patterns. Also look at the list examples in Sections 
   9.1 and 9.2 of Harper.

   Now consider the pattern `(x::y::zs, w)`. For each of the following 
   expressions, tell whether the pattern matches the value denoted. If the 
   pattern matches, say what values are bound to the four variables `x`, `y`, 
   `zs`, and `w`. If it does not match, explain why not.

   * a. `([1, 2, 3], ("COMP", 105))`
   * b. `(("COMP", 105), [1, 2, 3])`
   * c. `([("COMP", 105)], (1, 2, 3))`
   * d. `(["COMP", "105"], true)`
   * e. `([true, false], 2.718281828)`

   Answers here:
   * a.
   * b.
   * c. 
   * d.
   * e.


   You are now starting to be ready to use pattern matching.

2. Look at the clausal function definition of outranks on page 83 of Harper. 
   Using the clausal definition enables us to avoid nested case expressions such 
   as we might find in Standard ML or μML, and it enables us to avoid nested if 
   expressions such as we might find in μScheme. This particular example also 
   collapses multiple cases by using the "wildcard pattern" `_`.

   A wildcard by itself can match anything, but a wildcard in a clausal 
   definition can match only things that are not matched by preceding clauses. 
   Answer these questions about the wildcards in `outranks`:

   * In the second clause, what three suits can the `_` match?

     →

   * In the fifth clause, what suits can the `_` match?

     →

   * In the eighth and final clause, what suits can the `_` match?

     →

     You are now ready to match patterns that combine tuples with algebraic 
     data types.


3. Read the descriptions of patterns and example values (steps 3 and 2) in 
   the fourth[Lesson in Program Design](https://www.cs.tufts.edu/comp/105-2019s/design/lessons.pdf). Look at 
   Table 4.1, including the *Types of parts* column. Using the ideas you find 
   there, prepare to answer questions about this expression:
    ```
    case f (x, y, z) 
      of []      => raise Empty
       | w :: ws => if p w then SOME w else NONE
    ```
   You are told that the subexpression `f (x, y, z)` has type `'a list`. Using 
   that information, give the type of each of these code fragments, which are 
   built from parts of patterns:

   * a. The type of the pattern `w :: ws`

     →

   * b. The type of the variable `ws`

     →

   * The type of the expression `SOME w`

     →

   You are ready to use pattern matching on common ML types.

4. Read the section on unit testing in the [guide to learning ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.pdf).
   Read about infix function names in step 3 of the "design steps" section of 
   the handout [Program Design with ML Types and Pattern Matching](https://www.cs.tufts.edu/comp/105-2019s/handouts/mlproofs.pdf). 
   And read the section on [unit testing](#unit) in this homework.

   Now, using the interpreter to be sure your answer is well typed, translate 
   the following *failing* unit test into ML:
   ```
   (check-expect (foldl + 0 '(1 2 3)) 7)
   ```
   Your translation:

   →

   You are ready to write unit tests.

5. In Chapter 5.3 of *Programming Languages: Build, Prove, and Compare* by 
   Ramsey, the eval code for applying a function appears in code chunk 350a. In 
   evaluating `APPLY (f, args)`, if expression `f` does not evaluate to either a 
   primitive function or a closure, the code raises the RuntimeError exception.

   Show a piece of μScheme code that would, when evaluated, would cause 
   chunk 350d to raise the `RuntimeError` exception. **We are asking for 
   μScheme code that the interpreter runs, not for ML code.**

    →


6. "Free" variables are those that are not bound to a value in the current 
   scope. You can find a longer discussion and precise definition in section 
   5.5 of Build, Prove, and Compare. Read the section and identify the free 
   variables of the expressions below. Remember that a name occurring in 
   function position can be a free variable.

   * a. Free variables of `(lambda (x) (lambda (y) (equal? x y)))`

     →

   * b. Free variables of `(lambda (y) (equal? x y))`

     →

   * c. Free variables of
  ```
(lambda (s1 s2)
  (if (or (atom? s1) (atom? s2))
    (= s1 s2)
    (and (equal? (car s1) (car s2))
         (equal? (cdr s1) (cdr s2)))))
  ```
     →


# Programming Problems (70 percent)
<a name="prog"/>

All of your solutions will go into a single file: `warmup.sml`.

At the start of each problem, please label it with a short comment, like
```
(***** Problem A *****)
```
To receive credit, your warmup.sml file must compile and execute in the Moscow 
ML system. For example, we must be able to compile your code without warnings or 
errors. The following command should test all of your code:
```
% mosmlc -I . -c warmup.sml
```

Please remember to **put your name and the time you spent in the 
`warmup.sml` file**.


## Defining functions using clauses and patterns

Related Reading for Problems A and B: In [Learning Standard  ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing) read 
about Expressions (Sections I, II, and III), Data (I, II, and II), Inexhaustive 
pattern matches, Types (I), Definitions (III, IV), and Expressions (VIII).

<hr>

**A.** Define a function `mynull : 'a list -> bool`, which when applied to a 
list tells whether the list is empty. Avoid using `if`, and make sure the 
function takes constant time. Do not use any functions from the Standard Basis. 
Make sure your function has the same type as the `null` in the Standard Basis.

<hr>

**B.** Define a function `firstVowel : char list -> bool` that takes a list of 
lower-case letters and returns `true` if the first character is a vowel (aeiou) 
and `false` if the first character is not a vowel or if the list is empty. Use 
the wildcard symbol `_` whenever possible, and avoid using `if`.

## Lists

Related Reading for problems C to F: In [Learning Standard  ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing), in 
addition to the section noted above, read about Types (III), and Exceptions. You 
will need to understand lists and pattern matching on lists (see Data III). You 
may also wish to read the section on Curried Functions.

<hr>

**C.** Functions `foldl` and `foldr` are predefined with type
```
('a * 'b -> 'b) -> 'b -> 'a list -> 'b
```
They are like the μScheme versions except the ML versions are Curried.

1. Define `reverse : 'a list -> 'a list` using `foldl` or `foldr`.
   (In ML, the reverse function is in the initial basis as rev.)

   When you are testing `reverse`, you may get a warning message about "value 
   polymorphism." This message is explained in [Learning Standard  ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing) 
   (Type pitfall II).

2. Implement `minlist : int list -> int`, which returns the smallest element of 
   a *nonempty* list of integers. Use `foldl` or `foldr`.

   If given an empty list of integers, your solution must fail (e.g., by `raise 
   Match`).

   Your solution should work regardless of the representation of integers: it 
   should not matter how many bits are used to represent a value of type `int`. 

   You may find a use for function `Int.min`, which is part of the initial basis 
   of Standard ML.

Do not use recursion in either part of this problem.

<hr>

**D.** Define a function `zip: 'a list * 'b list -> ('a * 'b) list` that takes a 
pair of lists (of equal length) and returns the equivalent list of pairs. If the 
lengths don't match, raise the exception `Mismatch`, which you must define. Do 
not use any functions from the Standard Basis Library.

You are welcome to translate a solution from μScheme, but you must either use a 
clausal definition or write code containing at most one case expression. Do not 
use `if`.

<hr>

**E.** Define a function
```
val pairfoldrEq : ('a * 'b * 'c -> 'c) -> 'c -> 'a list * 'b list -> 'c
```
that applies a three-argument function to a pair of lists of equal length, using 
the same order as `foldr`. Do not use any functions from the Standard Basis 
Library. If `pairfoldrEq`s contract is violated (by calling it on lists of 
unequal lengths), it must raise an exception.

Define a function `ziptoo : 'a list * 'b list -> ('a * 'b) list` that does 
exactly the same things as `zip` but uses `pairfoldrEq` for its implementation.

<hr>

**F.** Define a function
```
val concat : 'a list list -> 'a list
```
that takes a list of lists of `'a` and produces a single list of `'a` containing 
all the elements in the correct order. For example,
```
- concat [[1], [2, 3, 4], [], [5, 6]];
> val it = [1, 2, 3, 4, 5, 6] : int list
```
Do not use `i`f. You may use functions from the Standard Basis Library, except 
for `List.concat`—code that uses `List.concat` will earn No Credit.

To get full credit for this problem, your function should use no unnecessary 
cons cells. Keep in mind the cost of appending two lists.


### Algebraic data types

** PREVIEW: This problem will be on HW7.  Here it is just listed as a 
preview for the coding that will be on HW7.  You do NOT have to submit
the solution to this problem for HW6.**

Related Reading for problem N: In [Learning Standard  ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing),
read the section on datatypes—Data IV. Make sure you understand how to pattern 
match on constructed values.

**N.** Search trees. (**NOT part of HW6.  Preview for HW7**)

ML can easily represent binary trees containing arbitrary values in the nodes:
```
datatype 'a tree = NODE of 'a tree * 'a * 'a tree 
                 | LEAF
```
To make a search tree, we need to compare values at nodes. The standard idiom 
for comparison is to define a function that returns a value of type order. 
`order` is predefined by
```
datatype order = LESS | EQUAL | GREATER     (* do not include me in your code *)
```
Because order is predefined, if you include it in your program, you will hide 
the predefined version (which is in the initial basis) and other things may 
break mysteriously. So don't include it.

We can use the order type to define a higher-order insertion function by, e.g.,
```
fun insert cmp =
    let fun ins (x, LEAF) = NODE (LEAF, x, LEAF)
          | ins (x, NODE (left, y, right)) = 
              (case cmp (x, y)
                of LESS    => NODE (ins (x, left), y, right)
                 | GREATER => NODE (left, y, ins (x, right))
                 | EQUAL   => NODE (left, x, right))
    in  ins
    end
```
This higher-order insertion function accepts a comparison function as argument, 
then returns an insertion function. (The parentheses around `case` aren't 
actually necessary here, but I've included them because if you leave them out 
when they are needed, you will be very confused by the resulting error 
messages.)

We can use this idea to implement polymorphic sets in which we store the 
comparison function in the set itself. For example,
```
 datatype 'a set = SET of ('a * 'a -> order) * 'a tree
 fun nullset cmp = SET (cmp, LEAF)
```

* Write a function
```
val addelt : 'a * 'a set -> 'a set
```
  that adds an element to a set.

* Write a function
```
val treeFoldr : ('a * 'b -> 'b) -> 'b -> 'a tree -> 'b
```
that folds a function over every element of a tree, rightmost element first. 
Calling `treeFoldr (op ::) [] t` should return the elements of `t` in order. 
Write a similar function
```
val setFold : ('a * 'b -> 'b) -> 'b -> 'a set -> 'b
```
The function `setFold` should visit every element of the set exactly once, in an 
unspecified order.

# Avoid other common mistakes (**back to HW6**)
<a name="mistakes"/>

It's a common mistake to use any of the functions `length`, `hd`, and `tl`. 
Instant No Credit.
<hr>
If you redefine a type that is already in the initial basis, code will fail in 
baffling ways. (If you find yourself baffled, exit the interpreter and restart 
it.) If you redefine a function at the top-level loop, this is fine, unless that 
function captures one of your own functions in its closure.

Example:
```
fun f x = ... stuff that is broken ...
fun g (y, z) = ... stuff that uses 'f' ...
fun f x = ... new, correct version of 'f' ...
```
You now have a situation where **g is broken, and the resulting error is very 
hard to detect**. Stay out of this situation; instead, **load fresh definitions 
from a file** using the `use` function.
<hr>
Never put a semicolon after a definition. You should have a semicolon only if 
you are deliberately using imperative features.
<hr>
It's a common mistake to include redundant parentheses in your code. To avoid 
this mistake, use the checklist in the Section Expressions VIII (Parentheses) in 
[Learning Standard  ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing).
<hr>
It's not a common mistake, but it can be devastating: when you're writing a type 
variable, be sure to use an ASCII quote mark, as in 'a, not with a Unicode right 
quote mark, as in ’a. Some text editors, web browsers, or Bluetooth keyboards 
may use or display Unicode without being asked. Thanks, Apple!


# What and how to submit
<a name="submit"/>

There is no README file for this assignment.

Please submit two files:

 * A text file `cqs.ml.txt` containing your answers to the 
   reading-comprehension questions (you can start with the provided file)


 * A file `warmup.sml` containing the solutions to Exercises A-F.
   You must precede each solution by a comment that looks something like this:
```
(***** Problem A *****)
```

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.

# How your work will be evaluated

The criteria are mostly the same as for the scheme and hofs assignments, but 
because the language is different, we’ll be looking for indentation and layout 
as described in the [Style Guide for Standard ML Programmers](https://www.cs.tufts.edu/comp/105-2019s/handouts/mlstyle.pdf).
