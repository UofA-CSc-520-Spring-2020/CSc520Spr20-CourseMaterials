# HW10 Lambda Calculus

CSc 520 Spring 2020 Assignment

* [Overview](#overview)

* [Getting Started](#start)

* [Learning about the lambda calculus](#learning)

* [Introduction to the lambda interpreter](#lambda)

* [All questions and problems](#read)

* [What and how to submit](#submit)

* [Avoid common mistakes](#mistakes)

* [How your work will be evaluated](#eval)


**Due Wednesday, April 29th, 2020 at 11:59PM**

This homework is to be done individually.


# Overview
<a name="overview"/>

Lambda calculus is not just a universal model of computation—it is also a
language you can use to communicate with educated people around the world. In 
this assignment,

 * You read about lambda calculus and answer questions about it.

 * You use lambda calculus to write simple functions.

Substitution, reduction, and alpha-conversion are found all over 
programming-language semantics, not just in lambda calculus.


# Getting Started
<a name="start"/>

Accept the github assignment at https://classroom.github.com/a/RSRqVFmd
and do a git clone of your repository.  Make sure to `get commit -a` and
`git push` frequently!

The lambda interpreter is an executable wrapped in a docker container.
```
sudo docker pull mstrout/cs520spring2020
docker run -it --rm --name cs520name -h cs520host mstrout/cs520spring2020
./linterp-nr
```


# Learning about the lambda calculus
<a name="learning"/>

There is no book chapter on the lambda calculus. Instead, we refer you to these 
resources:

1. The edited version of Raúl Rojas’s [A Tutorial Introduction to the Lambda 
   Calculus](https://www.cs.tufts.edu/comp/105/readings/rojas.pdf) is short, 
   easy to read, and covers the same points that will be covered in lecture:

   * Syntax
   * Free and bound variables
   * Capture-avoiding substitution
   * Addition and multiplication with Church numerals
   * Church encoding of Booleans and conditions
   * The predecessor function on Church numerals
   * Recursion using the Y combinator

Rojas doesn't provide many details, but he covers everything you need to know in 
9 pages, with no distracting theorems or proofs.

When you want a short, easy overview to help you solidify your understanding, 
Rojas' tutorial is your best source.

2. Ramsey has written [a short guide to coding in Lambda 
  calculus](https://www.cs.tufts.edu/comp/105-2019s/handouts/lambda-coding.pdf). 
  It shows how to translate ML-like functions and data, which you already know 
  how to program with, into lambda calculus.

  When you are solving the individual programming problems, this guide is your 
  best source.

3. Prakash Panangaden's [Notes on the 
   Lambda-Calculus](https://www.cs.tufts.edu/comp/105/readings/prakash.pdf)
   cover the same material as Rojas, but with more precision and detail. Prakash 
   is particularly good on capture-avoiding substitution and change of bound 
   variables, which you will implement.

   Prakash also discusses more theoretical ideas, such as how you might prove 
   inequality (or inequivalence) of lambda-terms. And instead of just presenting 
   the Y combinator, Prakash goes deep into the ideas of fixed points and 
   solving recursion equations—which is how you achieve recursion in lambda 
   calculus.

   When you are getting ready to implement substitution, Prakash’s notes are 
   your best source.

4. Ramsey has also written a short [guide to reduction 
   strategies](https://www.cs.tufts.edu/comp/105/readings/reduction.pdf). It is 
   more useful than anything that could be found online in 2018. As a bonus, it 
   also explains eta-reduction, which is neglected by other sources.

   When you have finished implementing substitution and are ready to implement 
   reduction, this guide is your best source.

5. Wikipedia offers two somewhat useful pages (They were more useful in 2017 
   then they are now—as always, Wikipedia pages are subject to change without 
   notice.):

   * The [Lambda Calculus](https://en.wikipedia.org/wiki/Lambda_calculus) page 
     covers everything you'll find in Rojas and much more besides. (If you wish, 
     you can read what Wikipedia says about reduction strategies and evaluation 
     strategies. But do not expect to be enlightened.)

   * The [Church Encoding](https://en.wikipedia.org/wiki/Church_encoding) page 
     goes into more detail about how to represent ordinary data as terms in the 
     lambda calculus. The primary benefit relative to Rojas is that Wikipedia 
     describes more kinds of arithmetic and other functions on Church numerals.

   You need to know that **the list encoding used on Wikipedia is not the list 
   encoding used in CSc 520**. To complete the homework problems successfully, 
   you must use the list encoding described in the guide to coding in lambda 
   calculus.


# Introduction to the lambda interpreter

This section explains how to use the interpreter and the syntax 
it expects.

## Syntax

### The syntax of definitions

Like the interpreters in the book, the lambda interpreter processes a sequence 
of definitions. The concrete syntax is very different from the "bridge 
languages" in the book. Every definition must be terminated with a semicolon. 
Comments are line comments in C++ style, starting with the string `//` and 
ending at the next newline.

The interpreter supports four forms of definition: a binding, a term, the 
extended definition `use`, and an extended definition `check-equiv`.

### Bindings

A binding is something like a `val` form in μScheme. A binding has one of two 
forms: either
```
    noreduce name = term;
```
or
```
    name = term;
```
In both forms, every free variable in the term must be bound in the 
environment—if a right-hand side contains an unbound free variable, the result 
is a checked run-time error. The first step of computation is to substitute for 
each of the free variables: each occurrence of each free variable is replaced by 
that variable's definition.

In the first form, where `noreduce` appears, no further computation takes place. 
The substituted right-hand side is simply associated with the name on the left, 
and this binding is added to the environment.

The noreduce form is intended only for terms that cannot be normalized, such as
```
    noreduce bot = (\x.x x)(\x.x x);
    noreduce Y   = \f.(\x.f(x x))(\x.f(x x));
```
The `noreduce` form is also needed for definitions that use terms like `bot` 
and `Y`.

If `noreduce` is absent, the interpreter substitutes for free variables, 
then reduces the term on the right until there are no more beta-redexes or 
eta-redexes. (You will implement the two reduction strategies presented in class.) If reduction doesn't terminate, the interpreter might loop.

### Loading files with use

The `use` extended definition loads a file into the interpreter as if it had 
been typed in directly. It takes the form
```
    use filename;
```

### Comparing normal forms with check-equiv

The `check-equiv` form **immediately** reduces two terms to normal form and 
compares them for equivalence. It has the form
```
    check-equiv term = term;
```
And here are some examples:
```
    -> check-equiv x = x;
    The test passed
    -> check-equiv \x.x = \y.y;
    The test passed
    -> check-equiv \x.x = \y.x;
    The test failed: terms \x.x and \y.x do not have equivalent normal forms
    -> check-equiv (\x.x)(\y.y) = \z.z;
    The test passed
    -> check-equiv \f.f = \f.\x.f x;
    The test passed
```
Unlike the `check-expect` in the other interpreters, `check-equiv` is not "saved 
for later"—the given terms are normalized right away.

### Terms as definitions

As in the book, a term can be entered at the read-eval-print loop, just as if it 
were a definition. Every free variable in the term is checked to see if it is 
bound in the environment; if so, each free occurrence is replaced by its 
binding. Free variables that are not bound in the environment are permissible; 
they are left alone (Try, for example, `(\x.\y.x) A B;`).  The term is reduced 
to normal form (if possible) and the result is printed.
```
-> term;
```

### The syntax of terms
<a name="the-syntax-of-terms"/>

A lambda term can be either a variable, a lambda abstraction, an application, or 
a parenthesized lambda term. Precedence is as in ML.

A lambda abstraction abstracts over exactly one variable; it is written as 
follows:
```
    \name.term
```

Application of one term to another is written:
```
    term1 term2
```
The lambda interpreter is very liberal about names of variables. A name is any 
string of characters that contains neither whitespace, nor control characters, 
nor any of the following characters: `\` `(` `)` `.` `=` `/`. Also, the string 
`use` is reserved and is therefore not a name. But a name made up entirely of 
digits is OK; the lambda calculus has no numbers, and names like 520 have no 
special status.

As examples, all the following definitions are legal:
```
    <1>  = \f.\x.f x;
    1    = \f.\x.f x;
    True = \x.\y.x;
    one  = True 1;
```

### A short example transcript

```
-> true  = \x.\y.x;
-> false = \x.\y.y;
-> pair  = \x.\y.\f.f x y;
-> fst = \p.p (\x.\y.x);
-> snd = \p.p (\x.\y.y);
-> true;
\x.\y.x
-> fst (pair true false);
\x.\y.x
-> snd (pair true false);
\x.\y.y
-> if = \x.\y.\z.x y z;
if
-> (if true fst snd) (pair false true);
\x.\y.y
-> (if false fst snd) (pair true false);
\x.\y.y
```

For more example definitions, see the `predefined.lam` file in the starting 
github repository.



# All questions and problems
<a name="read"/>

## Reading Comprehension Questions

These problems will help guide you through the reading. We recommend that you 
complete them before starting the other problems below.  
There is a `cqs.lambda.txt` in the starter github repository.


1. Syntax of lambda terms. In this assignment, or in Rojas or Panangaden, read 
   about the concrete syntax of lambda-terms.

   Now define, in Standard ML, an algebraic data type term that represents the 
   abstract syntax of terms. Your data type should have one value constructor 
   for a variable, one for a lambda abstraction, and one for an application.


2. Recognizing redexes. Read about redexes in Wikipedia (use 
   https://sookocheff.com/post/fp/eta-conversion/ to help figure out one of the 
   greek letter names). (You will then follow up with 
   [Panangaden](https://www.cs.tufts.edu/comp/105/readings/prakash.pdf).)

  * (a) Wikipedia mentions two kinds of redex. What are their names?

  * (b) In Panangaden, Definition 1.7 defines a redex. Which of the two redexes  
    mentioned in Wikipedia is being defined here?

  * (c) For each of the two kinds of redex, use the concrete syntax for our 
    lambda interpreter (see above) to show what form every redex of that kind 
    takes.

  * (d) For each of the two kinds of redex, use your algebraic data type from 
    the preceding question to write a pattern that matches every redex of that 
    kind.


3. Practicing reduction. Read about reduction on Wikipedia. Then in Panangaden, 
   be sure you have an idea about each of these concepts:

   * Capture-avoiding substitution (Definition 1.3)

   * Reduction (Definition 1.5), including the example reduction (Example 1.3)

   * Redex, contractum, and normal form (Definitions 1.7 and 1.8)

   Showing each reduction step, reduce the following term to normal form. At 
   each step, choose a redex and replace the redex with its contractum. Do not 
   expand or replace the names ZERO and NONZERO.
```
(\n.(n(\z.NONZERO))ZERO)(\f.\x.f x)
→
...
```
   The term contains more than one redex, but no matter which redex you choose 
   at each step, you should reach the normal form after exactly four reductions.


4. Reduction: the general case. For each kind of redex, repeat the general form 
   of the redex from Question 2(c) above, then show what syntactic form the 
   redex reduces to (in just a single reduction step).



6. When to reduce. Read Ramsey's [handout on reduction strategies](https://www.cs.tufts.edu/comp/105-2019s/readings/reduction.pdf). 
   Using [the concrete syntax accepted by the interpreter 
   (and defined above)](#the-syntax-of-terms), write a lambda term that contains 
   exactly two redexes, such that normal-order reduction strategy reduces one 
   redex, and applicative-order reduction strategy reduces the other redex.


7. Understanding Church numerals. You may recognize the practice reduction above 
   as a computation that tells if a Church numeral is zero. Read about Church 
   numerals, either on pages 9 and 10 of Panangaden or in Section 2 of Rojas 
   ("Arithmetic"). Then, say whether each of the following lambda-calculus terms 
   is a Church numeral. If so, write the corresponding decimal representation. 
   If not, write "not a Church numeral".
```
\f.x
\f.\x.x
\f.\x.f
\f.\x.f x
\x.\x.f (f (f (f (f x))))
```

## Programming in the lambda calculus

These problems give you a little practice programming in the lambda calculus. 
**Most functions must terminate in linear time**, and you must do these 
exercises by yourself. You can use the `linter-nr` interpreter.

Lambda-calculus programs work at the same intellectual level as 
assembly-language programs. Therefore, **every new helper function must be well 
named and must be accompanied by a contract**. Detailed guidance can be found 
below.

Helper functions listed in the assignment are exempt from the contract 
requirement, as are the helper functions in `predefined.lam`.

Complete all four problems below, and place your solutions in file `church.lam`.

Not counting code copied from the lecture notes, my solutions to all the 
problems total less than fifteen lines of code. And all problems rely on 
the same related reading.

Related reading for lambda-calculus programming problems 1 to 3:

* Ramsey guide for [Coding in Lambda 
  Calculus](https://www.cs.tufts.edu/comp/105-2019s/handouts/lambda-coding.pdf) 
  should explain everything you need to know to write functional programs in 
  lambda calculus. If not, or if the explanations there are a little too terse, 
  consult the additional readings below.

* Basic techniques can be found in [Wikipedia on Church 
  Encoding](https://en.wikipedia.org/wiki/Church_encoding) and in Section 2 of 
  Panangaden, which is titled "Computing with Lambda Calculus" (from page 8 to 
  the middle of page 10). These basics are sufficient for you to tackle problems 
  1 and 2.

* Another alternative is Section 2 of Rojas’s tutorial, entitled "arithmetic." 
  Rojas doesn't mention Church numerals by name, but that's what he's working 
  with. You may find the examples useful and the presentation more accessible 
  than what you see from Panangaden.

* On Problems 3 and 4 only, if you have the urge to write a recursive 
  function, you may use a fixed-point combinator. My guide ends with a few 
  pages on recursion. You may also wish to consult the first paragraph under 
  "Fixed-Point Combinators" on page 10 of Panangaden. This explanation is by 
  far the best and simplest explanation available—but it is very terse. For 
  additional help, consult the examples on page 11.

  I recommend against the Wikipedia "main article" on fixed-point combinators: 
  the article is all math all the time, and it won't give you any insight into 
  how to use a fixed-point combinator.

<hr>

1. Church Numerals—parity. Without using recursion or a fixed-point combinator, 
   define a function even? which, when applied to a Church numeral, returns the 
   Church encoding of true or false, depending on whether the numeral represents 
   an even number or an odd number.

   Your function must terminate in time linear in the size of the Church 
   numeral.

   Ultimately, you will write your function in lambda notation acceptable to the 
   lambda interpreter, but you may find it useful to try to write your initial 
   version in Typed μScheme (or ML or μML or μScheme) to make it easier to 
   debug.

   Remember these basic terms for encoding Church numerals and Booleans:


```
<0>  = \f.\x.x;
succ = \n.\f.\x.f (n f x);
+    = \n.\m.n succ m;
*    = \n.\m.n (+ m) <0>;

true  = \x.\y.x;
false = \x.\y.y;
```

   You can load these definitions by typing use predefined.lam; in your 
   interpreter.

<hr>

2. Church Numerals—division by two. Without using recursion or a fixed-point 
   combinator, define a function `div2` that divides a Church numeral by two  
   (rounding down). That is, `div2` applied to the numeral for `2n` returns `n`, 
   and `div2` applied to the numeral for `2n + 1` also returns `n`.

   We don't know if this one can be done in linear time, but it is sufficient if 
   your function terminates in time quadratic in the size of the Church numeral.

   Hint: Think about function split-list from one of the Scheme homeworks done 
   at Tufts (https://www.cs.tufts.edu/comp/105-2019s/homework/scheme.html), 
   about the implementation of the predecessor function on natural numbers, and 
   about the "window" example that will be posted on piazza.
   
   You will need this function for Problem 3.

<hr>

3. Church Numerals—conversion to binary. Implement the function binary from the 
   Impcore homework. The argument and result must be Church numerals. For 
   example,

```
-> binary <0>;
\f.\x.x
-> binary <1>;
\f.f
-> binary <2>;
\f.\x.f (f (f (f (f (f (f (f (f (f x))))))))) // f applied 10 times
-> binary <3>;
\f.\x.f (f (f (f (f (f (f (f (f (f (f x)))))))))) // f applied 11 times
```

   For this problem, you may use the Y combinator. If you do, remember to use 
   noreduce when defining binary, e.g.,
   
```
  noreduce binary = ... ;
```

   This problem, although not so difficult, may be time-consuming. If you get 
   bogged down, go forward to the list-selection problem (nth),
   which can benefit from similar skills in recursion, fixed points, and Church 
   numerals. Then come back to this problem.

   Your function must terminate in time quadratic in the size of the Church 
   numeral.

<hr>

4. Church Numerals—list selection. Write a function `nth` such that given a 
   Church numeral `n` and a church-encoded list `xs` of length at least `n+1`, 
   `nth n xs` returns the `n`th element of `xs`:
   
```
-> <0>;
\f.\x.x
-> <2>;
\f.\x.f (f x)
-> nth <0> (cons Alpha (cons Bravo (cons Charlie nil)));
Alpha
-> nth <2> (cons Alpha (cons Bravo (cons Charlie nil)));
Charlie
```

   To get full credit for this problem, **you must solve it without recursion**. 
   But if you want to define `nth` as a recursive function, use the Y 
   combinator, and use `noreduce` to define `nth`.

   Provided `xs` is long enough, function `nth` must terminate in time linear in 
   the length of the list. Don't even try to deal with the case where `xs` is 
   too short.

   Hint: One option is to go on the web or go to Rojas and learn how to tell if 
   a Church numeral is zero and if not, and how to take its predecessor. There 
   are other, better options.



# What and how to submit: 
<a name="submit"/>

Please submit three files:

 * A `README.md` file containing
   * The names of the people with whom you collaborated (i.e. talked with
     about the assignment, no pair programming for this one, don't share code)

   * A list identifying which problems that you solved

   * The number of hours you worked on the assignment

 * A text file `cqs.lambda.txt` containing your answers to the 
   reading-comprehension questions (you can start with the provided file)

 * A file `church.lam` containing your solutions to the Church-numeral problems.

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.


# Avoid common mistakes
<a name="mistakes"/>

Common mistakes with Church numerals
Here are some common mistakes to avoid when programming with Church numerals:

* **Don't forget names and contracts for helper functions**.

* Don't forget a semicolon after each definition.

* Don't forget the question mark in the name of `even?`.

* When using a fixed-point combinator to define a function, don't forget to use 
  noreduce in the definition form.

* **Don't use the list representation or primitives from Wikipedia**. We will 
  test your code using the representation and primitives from [Coding in Lambda 
  Calculus](https://www.cs.tufts.edu/comp/105-2019s/handouts/lambda-coding.pdf), 
  which you will also find in the file `predefined.lam`.

* Don't include any use directives in `church.lam`.

* Don't copy predefined terms from predefined.lam. We will load the predefined   
  terms before running your code.

To make sure your code is well formed, load it using
```
cat predefined.lam church.lam | linterp-nr
```

If you want to build a test suite, put your tests in file `test.lam` and run
```
cat predefined.lam church.lam test.lam | linterp-nr
```



# How your work will be evaluated
<a name="eval"/>

Your lambda code will be judged on correctness, form, naming, and documentation, 
but not so much on structure. In particular, because the lambda calculus is such 
a low-level language, we will especially emphasize **names and contracts for 
helper functions**.

* This is low-level programming, and if you don't get your code exactly right, 
  the only way we can recognize and reward your learning is by reading the code. 
  It's your job to make it clear to us that even if your code isn't perfect, you 
  understand what you're doing.

* Try to write your contracts in terms of higher-level data structures and 
  operations. For example, even though the following function does some fancy 
  manipulation on terms, it doesn’t need much in the way of a contract:
```
   double = \n.\f.\x. n (\y.f (f y)) x;  // double a Church numeral
```
  Documenting lambda calculus is like documenting assembly code: it's often 
  sufficient to say what's happening at a higher level of abstraction.

* Although it is seldom ideal, it can be OK to use higher-level code to document 
  your lambda code. In particular, if you want to use Scheme or ML to explain 
  what your lambda code is doing, this can work only because Scheme and ML 
  operate at much higher levels of abstraction. Don't fall into the trap of 
  writing the same code twice—if you are going to use code in a contract, it 
  must operate at a significantly higher level of abstraction than the code it 
  is trying to document.


## Naming


#### Exemplary

 * Each λ-calculus function is named either with a noun describing the result it 
   returns, or with a verb describing the action it does to its argument, or (if 
   a predicate) as a property with a question mark.

#### Satisfactory

 * Functions' names contain appropriate nouns and verbs, but the names are more 
   complex than needed to convey the function’s meaning.

 * Functions' names contain some suitable nouns and verbs, but they don’t convey 
   enough information about what the function returns or does.

#### Must Improve

 * Function’s names include verbs that are too generic, like "calculate", 
   "process", "get", "find", or "check"

 * Auxiliary functions are given names that don't state their contracts, but 
   that instead indicate a vague relationship with another function. Often such 
   names are formed by combining the name of the other function with a suffix 
   such as `aux`, `helper`, `1`, or even `_`.

 * Course staff cannot identify the connection between a function's name and 
   what it returns or what it does.

### Contracts and Documentation


#### Exemplary

 * The contract of each function is clear from the function's name, the names of its parameters, and perhaps a one-line comment describing the result.

 * Or, when names alone are not enough, each function's contract is documented 
   with a type (in a comment)

 * Or, when names and a type are not enough, each function's contract is 
   documented by writing the function’s operation in a high-level language with 
   high-level data structures.

 * Or, when a function cannot be explained at a high level, each function is 
   documented with a meticulous contract that explains what λ-calculus term the 
   function returns, in terms of the parameters, which are mentioned by name.

 * A recursive function is accompanied by an argument about termination.

#### Satisfactory

 * A function's contract omits some parameters.

 * A function's documentation mentions every parameter, but does not specify a 
   contract.

 * A recursive function is accompanied by an argument about termination, but 
   course staff have trouble following the argument.

#### Must Improve

 * A function is not named after the thing it returns, and the function's 
   documentation does not say what it returns.

 * A function's documentation includes a narrative description of what happens 
   in the body of the function, instead of a contract that mentions only the 
   parameters and result.

 * A function's documentation neither specifies a contract nor mentions every 
   parameter.

 * A function is documented at a low level (λ-calculus terms) when higher-level 
   documentation (pairs, lists, Booleans, natural numbers) is possible.

 * There are multiple functions that are not part of the specification of the 
   problem, and from looking just at the names of the functions and the names of 
   their parameters, it's hard for us to figure out what the functions do.

 * A recursive function is accompanied by an argument about termination, but 
   course staff believe the argument is wrong.

 * A recursive function does not use structural recursion, and course staff 
   cannot find an explanation of why it terminates.


