# HW7 Type systems

CSc 520 Spring 2020 Assignment

* [Overview](#overview)

* [Getting Started](#start)

* [Dire Warnings](#warnings)

* [Reading Comprehension (40 percent)](#read)

* [Language Design and Programming (60 percent)](#prog)

* [What and how to submit](#submit)

* [Evaluation for Programming](#eval)


**Due Wednesday, April 8, 2020 at 11:59PM**

This assignment is all individual work. 
There is **no pair programming**.


# Overview
<a name="overview"/>


Even if you spend your whole career in the scripting ghetto, at some point 
you'll be expected to use a language with a type system. (Even languages that 
have never had type systems, like PHP and JavaScript, are getting them now.) 
You're already aware of type systems in C and C++, and you’ll likely encounter 
them in other languages such as Java, C#, Swift, Go, Rust, and so on. This 
assignment will help you learn about type systems and polymorphism. You will 
start to understand what a type checker does. And you will write a couple of 
explicitly typed, polymorphic functions. When you complete the assignment, 
you'll be pretty clear about how polymorphism works in languages like Java and 
Scala, and you might understand why many Go programmers are angry that they 
don't have it.

# Getting Started
<a name="start"/>

## Setup

Accept the github assignment at https://classroom.github.com/a/KfThzoTR
and do a git clone of your repository.  Make sure to `git commit -a` and
`git push` frequently!

 The initial github repository will include the following
files:
 * `cqs.typesys.txt`
 * `Unit.sig`
 * `Unit.sml`
 * `build_prove_compare/`

To download an ML interpreter, install Moscow ML from https://mosml.org/.
Then you should have mosml on the command-line.

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

As in the ML homework, you must not use the functions `null`, `hd`, and `tl`. 
Use pattern matching.

You must not use the ML functions `#1` and `#2`. (They are manifestations of bad 
design, trying to masquerade as functions.)


# Reading Comprehension (40 percent)
<a name="read"/>

These problems will help guide you through the reading. We recommend 
that you complete them before starting the other problems below. 
There is a `cqs.typesys.txt` in the starter github repository.

1. Read Section 6.3.3, which describes how Typed Impcore is extended with 
   arrays. Examine code chunk 388, which shows the cases that have to be added 
   to the type checker.

   For each case, name the type-system rule that applies. Each answer should be 
   a rule name like Apply or GlobalAssign.

   * The rule for case `| ty (AAT (a, i)) = ...` is:

   * The rule for case `| ty (APUT (a, i, e)) = ...` is:

   * The rule for case `| ty (AMAKE (len, init)) = ...` is:

   * The rule for case `| ty (ASIZE a) = ...` is:

   Now pick one of the rules and explain, in informal English, what the rule is 
   supposed to do.


2. Read Section 6.6.3 on quantified types in Typed μScheme. In addition to the 
   prose, read the transcripts in the first couple pages of that section: each 
   value that has a quantified type is instantiated later in the transcript, 
   giving you more examples to relate back to the prose.

   * (a) Assume variable `syms` holds a list of symbols (it has type 
     (`list sym`)). What expression do you write to compute its length? Pick 
     exactly one of the options below.

     * (1) `(length syms)`
     * (2) `((o length sym) syms)`
     * (3) `((@ length sym) syms)`
     * (4) `((length sym) syms)`

   * (b) You are given a function `positive?` of type `(int -> bool)`. Using the 
   predefined function `o`, which has type 
   `(forall ('a 'b 'c) (('b -> 'c) ('a -> 'b) -> ('a -> 'c)))`, what code do you 
   write to compose `positive?` with `not`?

   * (c) In testing, we sometimes use a three-argument function `third` that 
     ignores its first two arguments and returns its third argument. Such a 
     function has type
```
(forall ('a 'b 'c) ('a 'b 'c -> 'c))
```

   There is only one sensible function that has this type. Using a `val` 
   definition, define function `third` in Typed μScheme. You will need to use 
   both `type-lambda` and `lambda`.

   You are ready for exercise TD.

3. Read about type equivalence starting in Section 6.6.6.

   You are given ML values `tau1` and `tau2`, which represent the respective 
   Typed μScheme types `(forall ('a) 'a)` and `(forall ('b) 'b)`. Semantically, 
   these types are equivalent. For each of the two ML expressions below, say 
   whether the expression produces `true` or produces `false`. Write each answer 
   immediately below the expression.

   * (a) `tau1 = tau2`

   * (b) `eqType (tau1, tau2)`


4. Read section 6.6.5 on typing rules for expressions in Typed μScheme. For each 
   of the expressions below, say if it is well typed, and if so, what its type 
   is. If the expression is not well typed, say what typing rule fails and why.
```
; (a)
(if #t 1 #f)

; (b)
(let ([x 1]
      [y 2])
   (+ x y))

; (c)
(lambda ([x : int]) x)

; (d)
(lambda ([x : 'a]) x)

; (e)
(type-lambda ['a] (lambda ([x : 'a]) x))
```

5. Read Lesson 5 ("Program design with typing rules") of [Seven Lessons in 
   Program Design](https://www.cs.tufts.edu/comp/105-2019s/design/lessons.pdf). 
   In particular, read the explanation of how the If rule is rewritten to add 
   type-equality judgments τ ≡ τ3 and τ1 ≡ bool. Now look at the list of typing 
   rules for expressions in Figure 6.10 on page 439 in "Programming Languages: 
   Build, Prove, and Compare." Identify one other rule that needs to be 
   rewritten in the same fashion as `If`, for the same reason.

   The rule you found is named →


# Language Design and Programming (60 percent)
<a name="prog"/>

## Theory

On your own, please do Exercise 8 on page 434 of Build, Prove, and Compare and 
Problem TD described below.  Put your answer to Exercise 8 in a file called 
`lists.pdf`.  Put your answer for Problem TD in `typed-funs.scm`.

8. Adding lists to Typed Impcore. Do Exercise 8 on page 434 of Build, Prove, and 
   Compare. The exercise requires you to design new syntax and to write type 
   rules for lists.

   Your typing rules must be deterministic. This means that in any given typing 
   environment, any given expression has at most one type, and the type must be 
   computable by a function that is given the abstract syntax and the typing 
   environment as inputs.

   Related reading:

   * Study the new abstract syntax for arrays in Section 6.3.2. Be sure you 
     understand that you are seeing new syntactic forms, not functions.

   * Each new form in code chunk 388 comes with a typing rule, which can be 
     found in Section 6.3.3. As long as you keep in mind the differences between 
     lists and arrays, this section will help you imagine the sorts of rules you 
     will need to write for lists.

   * For another example of new forms and corresponding rules, study the 
     sum-introduction forms `left` and `right` in Section 6.4.

   * Finally, for help classifying rules, see the sidebar on "Formation, 
     introduction, and elimination" on page 387.

   Hint: This exercise is more difficult than it first appears. I encourage you 
   to scrutinize the lecture notes for similar cases, and to remember that you 
   have to be able to type check every expression at compile time. 

   Here are some things to watch out for:

   * It's easy to conflate syntax, types, and values. In this respect, doing 
   theory is significantly harder than doing implementation, because there's no 
   friendly ML compiler to tell you that you have a type clash among `exp`, 
   `tyex`, and `value`.

   * It's especially easy to get confused about `cons`. You need to create a 
     **new syntax** for `cons`. This syntax needs to be different from the 
     `PAIR` constructor that is what `cons` evaluates to.

   * Here's a good mental test case: it should be possible to write a recursive 
     `reverse` function, and if `ns` is a list of integers, then 
     `(car (reverse ns))` is an expression that should have type `int`. Even if 
     list `ns` is empty.

   * The empty list presents a challenge. Typed Impcore is monomorphic, which 
     implies that any given piece of syntax has at most one type. But you want 
     to allow for empty lists of *different* types. The easy way out is to 
     design your syntax so that you have many different expressions, of 
     different types, that all evaluate to empty lists. The most common mistake 
     is to design a syntax that requires nondeterminism to compute the type of 
     any term involving the empty list. But the problem requires a deterministic 
     type system, because *deterministic* type systems are much easier to 
     implement.

     You might consider whether similar difficulties arise with other kinds of 
     data structures or whether lists are somehow unique.

     You might consider what happens in C when you try to do something clever 
     with a pointer of type `void *`, and to think of how C can address this 
     issue using expression syntax only (that is, without resorting to a 
     definition form.)

   * You might want to see what happens to an ML program when you try to 
     type-check operations on empty and nonempty lists. For this exercise to be 
     helpful, you have to understand the phase distinction between a type error 
     and a run-time error. For example, `hd 3` results in a type error, but 
     `hd []` is well-typed—and results in a run-time error.

<hr>

**TD.** *Polymorphic functions in Typed uScheme*. To hold your solution, create 
a file `typed-funs.scm`. Implement, in Typed μScheme, fully typed versions of 
these two functions:

* Function `drop`, which drops a given 
  number of elements from the front of a list

* Function `takewhile`, from Exercise 10 on page 195, which takes frontal 
  elements that satisfy a given predicate

The problem has four parts:

* (a) Write, in a `check-type`, the polymorphic type you expect `drop` to have.

* (b) Write a definition of `drop`.

* (c) Write, in a `check-type`, the polymorphic type you expect `takewhile` to 
  have.

* (d) Write a definition of `takewhile`.

Related reading: Read Section 6.6.3 on quantified types. Look especially at the 
definitions of `list2`, `list3`, `length`, and `revapp` starting around page 
400.


<hr>

## Programming using algebraic data types (programming in ML)

Related Reading for Problem N: In [Learning Standard  ML](https://www.cs.tufts.edu/comp/105-2019s/readings/ml.html#unit-testing),
read the section on datatypes—Data IV. Make sure you understand how to pattern 
match on constructed values.

**N.** Search trees.

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


## How to organize your code

All of your code for Problem **TD** will go into a single file: 
`typed-funs.scm`.


All of your code for Problem **N** will go into a single file: `tree.sml`.

To receive credit, your `tree.sml` file must compile and execute in the Moscow 
ML system. For example, we must be able to compile your code without warnings or 
errors. The following command should test all of your code:
```
% mosmlc -I . -c tree.sml
```

Please remember to **put your name and the time you spent in the 
`README.md` file**.



# What and how to submit
<a name="submit"/>


Please submit five files:

 * `README.md` file with who you talked with about the assignment and how many
   hours you spent on the assignment.

 * A text file `cqs.typesys.txt` containing your answers to the 
   reading-comprehension questions (you can start with the provided file)

 * A file `lists.pdf` with the answer to Problem 8.

 * A file `typed-funs.scm` containing the solutions to Exercise **TD**.

 * A file `tree.sml` containing the solutions to Exercise **N**.

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.

# How your work will be evaluated
<a name="eval"/>

We will evaluate the structure and organization of your Typed μScheme code using 
the same criteria as used in previous homework assignments. We will evaluate the 
structure and organization of your ML code using similar criteria for naming and 
documentation. For indentation and layout, we’ll look for conformance to the 
[Style Guide for Standard ML Programmers](https://www.cs.tufts.edu/comp/105-2019s/handouts/mlstyle.pdf), 
within the constraints imposed by the code from the book.

