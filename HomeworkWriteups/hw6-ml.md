# HW6 Core ML

CSc 520 Spring 2020 Assignment

* [Overview](#overview)

* [Getting Started](#start)

* [Dire Warnings](#warnings)

* [Reading Comprehension (10 percent)](#read)

* [Programming and Language Design (90 percent)](#prog)

* [What and how to submit](#submit)

* [Avoid common mistakes](#mistakes)


**Due Friday, March 27, 2020 at 11:59PM**

This assignment is all individual work. 
There is **no pair programming**.


# Overview
<a name="overview"/>

The purpose of this assignment is to help you get acclimated to programming in Standard ML, which you will use in the next few weeks to implement type systems and lambda calculus. The assignment has three parts:

To begin, you will answer some questions about reading.
On your own, you will write many small exercises.

# Getting Started
<a name="start"/>

## Setup

Accept the github assignment at FIXME
and do a git clone of your repository.  Make sure to `git commit -a` and
`git push` frequently!

FIXME: rewrite for using Moscow ML
To create the executable μScheme interpreter, do the following in a clone
of your assignment repository.
    ```
    cd uscheme-trace
    make
    cp uscheme-trace ../uscheme-tr
    ./uscheme-tr -q < solution.scm   // to see if that worked
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
  described in our guide [Learning Standard  ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing).
  
The most convenient guide to the basis is the Moscow ML help system; type
 ```
  - help "";
 ```
at the mosml interactive prompt. The help file is badged incorrectly, but as far as I know, it is up to date.


## Unit testing  FIXME: from 2019
Regrettably, standard ML does not have check-expect and friends built in. Unit tests can be simulated by using higher-order functions, but it’s a pain in the ass. Here are some examples of tests written with our Unit module:
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
If you include these tests in your warmup.sml file,1 you can run them on the Unix shell command line, using mosmlc (with a “c”):
```
$ mosmlc -o a.out -I /comp/105/lib warmup.sml && ./a.out
In test '2 is false', expected value false but got true
One of two internal Unit tests passed.
$ 
```
You’ll use Unit.checkExpectWith to write your own unit tests. You’ll also use Unit.checkAssert and Unit.checkExnWith. The details are in Learning Standard ML.

Each call to Unit.checkExpectWith needs to receive a string-conversion function. These functions are written using the string-conversion builders in the Unit module. Here are some examples of code you can use:
```
val checkExpectInt     = Unit.checkExpectWith Unit.intString
val checkExpectIntList = Unit.checkExpectWith (Unit.listString Unit.intString)
val checkExpectStringList = Unit.checkExpectWith (Unit.listString Unit.stringString)
val checkExpectISList =
  Unit.checkExpectWith (Unit.listString
                        (Unit.pairString Unit.intString Unit.stringString))
val checkExpectIntListList = 
  Unit.checkExpectWith (Unit.listString (Unit.listString Unit.intString))
R
```

## Things you need to review before starting

We provide a guide to (Learning Standard ML)[https://www.cs.tufts.edu/comp/105-2019s/readings/ml.pdf].  Learning Standard ML will guide you to other reading.

Skim these materials before starting, so you know what is there. Learning Standard ML will guide you to other reading.


FIXME: should I copy in What we expect from your submission?



# Reading Comprehension (10 percent)
<a name="read"/>

FIXME: format, from 2017

These problems will help guide you through the reading. We recommend 
that you complete them before starting the other problems below. 
There is a cqs.ml.txt in the starter github repository.

These questions are meant to guide you through the readings that will help you 
complete the assignment. Keep your answers brief and simple.

Read section 5.1 of Harper about tuple types and tuple patterns. Also look at the list examples in sections 9.1 and 9.2 of Harper.

Now consider the pattern (x::y::zs, w). For each of the following expressions, tell whether the pattern matches the value denoted. If the pattern matches, say what values are bound to the four variables x, y, zs, and w. If it does not match, explain why not.

([1, 2, 3], ("COMP", 105))
(("COMP", 105), [1, 2, 3])
([("COMP", 105)], (1, 2, 3))
(["COMP", "105"], true)
([true, false], 2.718281828)
Answers here:

You are now starting to be ready to use pattern matching.

Look at the clausal function definition of outranks on page 83 of Harper. Using the clausal definition enables us to avoid nested case expressions such as we might find in Standard ML or μML, and it enables us to avoid nested if expressions such as we might find in μScheme. This particular example also collapses multiple cases by using the “wildcard pattern” _.

A wildcard by itself can match anything, but a wildcard in a clausal definition can match only things that are not matched by preceding clauses. Answer these questions about the wildcards in outranks:

In the second clause, what three suits can the _ match?

→

In the fifth clause, what suits can the _ match?

→

In the eighth and final clause, what suits can the _ match?

→

You are now ready to match patterns that combine tuples with algebraic data types.

In Ramsey’s chapter 5, the eval code for applying a function appears in code chunk 365c. In evaluating APPLY (f, args), if expression f does not evaluate to either a primitive function or a closure, the code raises the RuntimeError exception.

Show a piece of μScheme code that would, when evaluated, cause chunk 365c to raise the RuntimeError exception.

→

When exception RuntimeError is raised, what happens from the user’s point of view?

You are now ready for problems G, L, and M.

“Free” variables are those that are not bound to a value in the current scope. You can find a longer discussion and precise definition in section 5.11 of Ramsey’s book, which starts on page 375. Read the section and identify the free variables of the following expressions:

Free variables of (lambda (x) (lambda (y) (equal? x y)))

→

Free variables of (lambda (y) (equal? x y))

→

You are now ready to improve the μScheme interpreter in problem 2.



# Programming Problems (90 percent)
<a name="prog"/>

## How to organize your code

All of your solutions will go into a single file: `warmup.sml`.

At the start of each problem, please label it with a short comment, like
```
(***** Problem A *****)
```
To receive credit, your warmup.sml file must compile and execute in the Moscow ML system. For example, we must be able to compile your code without warnings or errors. The following three commands should test all of your code:
```
% /usr/sup/bin/mosmlc -c warmup.sml
```
FIXME: fix the above command.

Please remember to **put your name and the time you spent in the 
`warmup.sml` file**.


## The problems

FIXME: format from 2017, check if I have access to 2019 answers

Working on your own, please solve the following problems:

Defining functions using clauses and patterns
Related Reading for problems A to D: In Learning Standard ML read about Expressions (sections I, II, and III), Data (I, II, and II), Inexhaustive pattern matches, Types (I), Definitions (III, IV), and Expressions (VIII).

A. Write the function null, which when applied to a list tells whether the list is empty. Avoid if, and make sure the function takes constant time. Make sure your function has the same type as the null in the Standard Basis.

–>

C. Write a function firstVowel that takes a list of lower-case letters and returns true if the first character is a vowel (aeiou) and false if the first character is not a vowel or if the list is empty. Use the wildcard symbol _ whenever possible, and avoid if.
Lists
Related Reading for problems E to J: In Learning Standard ML, apart from
the section noted above, read about Types (III), and Exceptions. For this section, you will need to understand lists and pattern matching on lists well (see Data III). You may also wish to read the section on Curried Functions.

E. Functions foldl and foldr are predefined with type

('a * 'b -> 'b) -> 'b -> 'a list -> 'b
They are like the μScheme versions except the ML versions are Curried.

Implement rev (the function known in μScheme as reverse) using foldl or foldr.

Implement minlist, which returns the smallest element of a non-empty list of integers. Use foldl or foldr.

If given an empty list of integers, your solution can fail (e.g., by raise Match).

Do not use recursion in either part of this problem.

F. Implement foldr using recursion. Do not create unnecessary cons cells. Do not use if.

G. Write a function zip: 'a list * 'b list -> ('a * 'b) list that takes a pair of lists (of equal length) and returns the equivalent list of pairs. If the lengths don’t match, raise the exception Mismatch, which you will have to define.

You are welcome to translate a solution from μScheme, but you must either use a clausal definition or write code containing at most one case expression. Do not use if.
H. Define a function

val pairfoldr : ('a * 'b * 'c -> 'c) -> 'c -> 'a list * 'b list -> 'c
that applies a three-argument function to a pair of lists of equal length, using the same order as foldr.

Write a version of zip which uses pairfoldr for its implementation. Call this function zip2.
I. Define a function

val unzip : ('a * 'b) list -> 'a list * 'b list
that turns a list of pairs into a pair of lists. Do not use if.

This one is tricky; here’s a sample result:

- unzip [(1, true), (3, false)];
> val it = ([1, 3], [true, false]) : int list * bool list
You are welcome to translate any of the solutions from μScheme, but you may not use if.

Higher-order programming
Related Reading for problem K: The reading for the Lists problems should guide you in this section as well.

K. Function compound is something like a fold, but it operates on a restricted class of functions: the first argument to compound is a function of type 'a * 'a -> 'a, which means it takes two arguments of the same type and returns a result also of that type. Examples of such functions include functions like op + and op *, but not op :: (cons). Every function that can be used with compound can be used with foldr, but not vice versa.

Function compound has this type:

val compound : ('a * 'a -> 'a) -> int -> 'a -> 'a
and compound f n x is

x if n=0,
f (x, x) if n = 1
f (x, f(x, x)) if n = 2
in general, f(x, f(x, f(x, ..., f(x, x)))), where f is applied exactly n times.
Function compound f need not behave well when applied to a negative integer.

Write algebraic laws for compound. Use as few base cases as possible.

Implement compound.

Use your compound function to define a Curried function for integer exponentiation

val exp : int -> int -> int
so that, for example, exp 3 2 evaluates to 9.

If you want to test compound with any of the predefined infix operators, you will need to convert the infix name to “nonfix” in an expression like

compound (op +) 10 1
Don’t get confused by infix vs nonfix operators. Remember this:

Fixity is a property of an identifier, not of a value.
If <$> is an infix identifier, then x <$> y is syntactic sugar for <$> applied to a pair containing x and y, which can also be written as op <$> (x, y).


### Algebraic data types
FIXME, format

Related Reading for problem N: In Learning Standard ML, read the section on datatypes—Data IV. Make sure you understand how to pattern match on constructed values.

N. Search trees.
ML can easily represent binary trees containing arbitrary values in the nodes:

datatype 'a tree = NODE of 'a tree * 'a * 'a tree 
                 | LEAF
To make a search tree, we need to compare values at nodes. The standard idiom for comparison is to define a function that returns a value of type order. As discussed in Ullman, page 325, order is predefined by

datatype order = LESS | EQUAL | GREATER     (* do not include me in your code *)
Because order is predefined, if you include it in your program, you will hide the predefined version (which is in the initial basis) and other things may break mysteriously. So don’t include it.

We can use the order type to define a higher-order insertion function by, e.g.,

fun insert cmp =
    let fun ins (x, LEAF) = NODE (LEAF, x, LEAF)
          | ins (x, NODE (left, y, right)) = 
              (case cmp (x, y)
                of LESS    => NODE (ins (x, left), y, right)
                 | GREATER => NODE (left, y, ins (x, right))
                 | EQUAL   => NODE (left, x, right))
    in  ins
    end
This higher-order insertion function accepts a comparison function as argument, then returns an insertion function. (The parentheses around case aren’t actually necessary here, but I’ve included them because if you leave them out when they are needed, you will be very confused by the resulting error messages.)

We can use this idea to implement polymorphic sets in which we store the comparison function in the set itself. For example,

datatype 'a set = SET of ('a * 'a -> order) * 'a tree
fun nullset cmp = SET (cmp, LEAF)
Write a function

val addelt : 'a * 'a set -> 'a set
that adds an element to a set.

Write a function

val treeFoldr : ('a * 'b -> 'b) -> 'b -> 'a tree -> 'b
that folds a function over every element of a tree, rightmost element first. Calling treeFoldr (op ::) [] t should return the elements of t in order. Write a similar function

val setFold : ('a * 'b -> 'b) -> 'b -> 'a set -> 'b
The function setFold should visit every element of the set exactly once, in an unspecified order.

# Avoid other common mistakes
<a name="mistakes"/>

FIXME: format and consider putting dire warnings back in.

It’s a common mistake to use any of the functions length, hd, and tl. Instant No Credit.

If you redefine a type that is already in the initial basis, code will fail in baffling ways. (If you find yourself baffled, exit the interpreter and restart it.) If you redefine a function at the top-level loop, this is fine, unless that function captures one of your own functions in its closure.

Example:

fun f x = ... stuff that is broken ...
fun g (y, z) = ... stuff that uses 'f' ...
fun f x = ... new, correct version of 'f' ...
You now have a situation where g is broken, and the resulting error is very hard to detect. Stay out of this situation; instead, load fresh definitions from a file using the use function.

Never put a semicolon after a definition. I don’t care if Jeff Ullman does it, but don’t you do it—it’s wrong! You should have a semicolon only if you are deliberately using imperative features.

It’s a common mistake to become very confused by not knowing where you need to use op. Ullman covers op in Section 5.4.4, page 165.

It’s a common mistake to include redundant parentheses in your code. To avoid this mistake, use the checklist in the section Expressions VIII (Parentheses) in Learning Standard ML.



# What and how to submit
<a name="submit"/>

There is no README file for this assignment.



Please submit two files:

 * A text file `cqs.ml.txt` containing your answers to the 
   reading-comprehension questions (you can start with the provided file)


 * A file `warmup.ml` containing the solutions to Exercises A-K and N.
   You must precede each solution by a comment that looks something like this:
```
(***** Problem A *****)
```

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.

# How your work will be evaluated

The criteria are mostly the same as for the scheme and hofs assignments, but because the language is different, we’ll be looking for indentation and layout as described in the [Style Guide for Standard ML Programmers](https://www.cs.tufts.edu/comp/105-2019s/handouts/mlstyle.pdf).