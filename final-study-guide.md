# Final Study Guide, posted April 30, 2020

The midterm will be on zoom and gradescope Tuesday 
May 12th from 3:30-5:30pm.  The zoom link will be sent out
via piazza the day before the final.

The final is online and therefore is open note.  You will be asked
to agree to the following on the final:
* While taking this final exam, the only person I will communicate 
  with about the material on the final is the instructor via private chat in 
  zoom.  I will NOT text, call, or in any other way communicate with anyone 
  other than the instructor.  If I finish the final exam before 5:30pm, I will 
  NOT communicate with anyone else in the class until after 5:30pm.
* I will only use zoom, gradescope, and overleaf on the internet while taking 
  the final exam.  I will NOT access piazza while taking the final exam.
* This test is open note and I can use my copy of the Ramsey textbook, the  
  interpreters provided for the class, any notes from class I have downloaded 
  locally, and any posts I have downloaded from piazza including the example 
  answers to previous homeworks.
* I will submit the answers to questions frequently while taking the final exam.
* If I have any logistical issues with Gradescope during the final exam, I will 
  contact the instructor via zoom immediately.  If I have any issues with zoom, 
  I will send email to the instructor at mstrout@cs.arizona.edu immediately.


To study for this final exam, practice solving problems.
Make sure you understand how to solve all the problems from 
the homeworks and practice similar problems.

The final exam is comprehensive.  Thus see the detailed outline of concepts
in the [midterm-study-guid.md] as well as the below outline of the 
concepts with an indication of the kind of problems you could practice 
to determine if you understand the concept.

Below the concepts subsections is a **comprehensive** section with example
question formats.  In other words, expect THESE question formats for all of
the material that might be on the final exam.  NOTE, there will be NO drawing
questions due to the final exam being online and the logistical issues
that entails.

While studying for the final exam, feel free to post ANY example questions 
and answers on piazza.  DO include explanations for your answers and DO 
consider providing feedback to other students on their example questions
and answers.

<hr>

## Concepts from first half of class

* Programming Constructs and Concepts
  * recursion vs. iteration (functional vs. imperative programming constructs)
  * recursive data
  * lambdas
  * higher-order functions that encapsulate recursive patterns
  * continuations
  * let constructs
  * currying
  * representing programming constructs with ASTs

* Precisely understanding what programs will do
  * operational semantics
  * judgement derivations
  * given a cost model how can the complexity for a recursive
    function be proved?

* Using and Proving Algebraic Laws

<hr>

## Concepts from second half of class

* Type Systems
  * Static vs. Dynamic typing
  * Undecideability forces a tradeoff: dynamic or approximate or non-terminating
  * Example: array bounds checking

* Mechanics of Type Systems
  * Monomorphic and polymorphic types
  * Types, Type constructors, quantified types
  * Kinds (k) classify types
  * Type environments
  * Typing rules
  * Type checking

* Programming in ML
  * Algebraic datatypes: data constructors, polymorphic, mutually recursive
  * Pattern matching
  * Basic list processing

* Hindley-Milner Type Inference
  * Inferred vs. Declared types
  * Canonical example of static analysis
  * Use fresh type variables to represent unknown types
  * Generate constraints that collect clues as to what types could be
  * Solve constraints
  * Compromises to preserve decidability
  
* Object-Oriented Programming
  * Advantages and Disadvantages
  * Smalltalk mantra: Everything is an Object
  * Classes and objects
  * Computation via sending messages
  * Double-dispatch
  * Subtyping ("duck typing") for client code reuse
  * **Subtyping is not Inheritance**
  * `self` and `super`
  * Blocks to code anonymous functions and continuations
  
* Lambda calculus
  * Three forms: e ::= x | \x.e | e1 e2
  * Church-Turing thesis: all computable functions expressable in 
    lambda calculus
  * bound and free variables
  * Beta reduction and alpha conversion
  * capture-avoiding substitution
  * recursion via fixed points
  * Y combinator calculates fixed points


<hr>

## Example Question Formats

Note that these are not FULL questions.  The "below" being
referred to does not exist.  These are question formats only.
Feel free to make up your own questions that follow these
formats and share them and their answers on piazza.
Feedback will be provided.

* Given the below (recursive or imperative) program,
  write the equivalent (imperative or recursive) program.

* Using the below definition of (some data structure name
  like LIST(A)), implement a function that takes that data structure
  as its only input and (does something). (Be prepared for this question
  to ask for a uscheme answer or potentially an ML answer).

* Given the below program (the program will be using any combination
  of the programming constructs covered so far in 520 in any of the
  languages), explain the output of the program and/or provide possible
  inputs and/or provide possible test cases.

* What if we changed something in the operational semantics for 
  one of the programming constructions? (a specific one would be named)
  How would that change the meaning of that construct?

* Implement the functions below using higher-order functions in the μScheme or 
  ML initial basis.  Solutions directly using recursion will receive zero 
  credit. If you don't remember exactly the order of arguments, or how these 
  functions are curried, just assume something reasonable and document your 
  assumptions.

* The semantics of (vars, let, closures, etc.).  Consider the following uScheme 
  program: 
  ...
  (a) Using the standard uScheme semantics, what is the value of ...?
  (b) Imagine we replace the standard SOMETHING rule with the following rule:
      Now what is the value of ...?
      Explain why the new rule does or does not affect the resulting value.

* What variables are free in the below lambda expression?  (either uScheme or 
  lambda calculus)

* Apply the following **substitutions** for the below lambda calculus 
  expressions.

* Use the beta reduction to reduce the following lambda calculus expression to
  its normal form.

* Using equational reasoning and the provided algebraic laws, prove the 
  following algebraic law is true or untrue.

* Compare and contrast any of the following and be able to name at least one
  example of each:
  * operational sematics versus type checking
  * static versus dynamic typing
  * a runtime error versus a compile time error
  * declaring types versus type inference
  * object-oriented programming versus programming with abstract datatypes
  * inheritance versus subtyping

* What are the three kinds of polymorphic typing discussed in the Ramsey book?
  Provide a small example of each.

* What are the advantages of polymorphic typing over monomorphic typing?
  Provide an example to illustrate at least one advantage.

* ML typing. What follows is a list of ML bindings. Some of the right-hand 
  sides are correctly typed terms; others are not.
  In each case, write down the type of the term or explain why it has no type. 
  If we have seen the function in class under a different name, give that name; 
  if not, write "not studied."

* Given an ML datatype specification, write a function that uses pattern
  matching to implement some capability.

* Briefly explain how inheritance enables code reuse and provide a small 
  example.

## Status of Expected Learning Outcomes from the Syllabus

The syllabus has the following list of learning outcomes.  Each is marked
as covered or not covered.

CSc 520 will be building two sets of skills:
* programming skills that exploit the best of the best programming-language 
  features
* mathematical reasoning about code, which helps you communicate, specify what 
  programs do, evaluate claims about languages like security claims.


The programming skills contribute to your professional practice,
and the math contributes to several outcomes:
* Math helps you communicate clearly about languages, language design, and 
  language features.
* Math is an ideal way to specify what programs do: it’s
  clearer and more precise than informal English, and it’s
  cleaner and more streamlined than a reference implementation.
* Experience with programming-language math will help you
  evaluate future claims about languages (for example, claims
  about security).

Here are some of the detailed skills you will develop:
* Read and write precise specifications of how languages work (covered)
* Understand how it is possible to prove universal truths that
  apply to any program written in a given language (covered)
* Write and reason about recursive functions (covered)
* Capture common patterns of recursion in higher-order functions (covered)
* Recognize and exploit common higher-order list-processing functions (covered)
* Program with first-class functions as data (covered)
* Prove correctness of code-improving transformations (**not** covered)
* Express rich control structures using functions as continuations (covered)
* Design and implement polymorphic functions, methods, and data structures (covered)
* Understand the merits of polymorphism in programming (covered)
* Use types to guide the construction of code (covered)
* Understand in detail what are the merits of type checking
  and how type checking works, including polymorphic type checking (covered)
* Understand in detail what are the merits of type inference
  and how type inference works, including polymorphic type inference (covered)
* Describe computations using the lambda calculus (covered)
* Hide information using abstract data types, modules, and interfaces (**not** covered)
* Hide information using objects and protocols (covered)
* Reuse code using inheritance (covered)
