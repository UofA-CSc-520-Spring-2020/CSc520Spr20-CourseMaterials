# Midterm Study Guide, March 6, 2020

The midterm will be in class on March 18th.

You can bring an 8.5x11 piece of paper with any notes you want 
on BOTH sides of the paper.  I WILL be providing
you any operational semantics rules and algebraic laws 
you may need to use.

To study for this midterm, practice solving problems.
Make sure you understand how to solve all the problems from 
the homeworks and practice similar problems.  Below is
an outline of the concepts with an indication of the kind 
of problems you could practice to determine if you understand
the concept.

Below the three concepts sections is a section with example
question formats.

Feel free to post ANY example questions and answers on piazza.
DO include explanations for your answers and DO consider 
providing feedback to other students on their example questions
and answers.

<hr>

## Programming Constructs

* recursion vs. iteration (functional vs. imperative programming constructs)

* recursive data
  * organization (drawing the cons diagrams)
  * using definition of data like LIST(A) to guide recursive implementation

* lambdas
  * lambda expressions as values (what is the result of programs with lambdas?)
  * free variables in lambda expressions (uScheme and lambda calculus)
  * substitution in lambda calculus (see substitution examples from slides)

* higher-order functions that encapsulate recursive patterns
  * be able to use any of the hofs from exercises:
    foldr and foldl, all?, exists? map, filter
  * what recursive patterns are being encapsulated?
    how would we implement these hofs recursively?
  * how can we implement any of the other hofs with foldr?

* continuations
  * the witness example, what would the outputs be?
  * the SAT example, what would the outputs be?

* let, let*, letrec and the differences between the 3

* write the AST for an expression

## Precisely understanding what programs will do

* operational semantics

* judgement derivations

* given a cost model how can the complexity for a recursive
  function be proved?


## Using and Proving Algebraic Laws

* Using Algebraic Laws
  * to guide testing
  * to guide implementation
  * to prove other algebraic laws (equational reasoning)

* Proving Algebraic Laws
  * using structural induction to prove algebraic laws
  * using other algebraic laws (equational reasoning)

<hr>

## Example Question Formats

Note that these are not FULL questions.  The "below" being
referred to does not exist.  These are question formats only.
Feel free to make up your own questions that follow these
formats and share them and their answers on piazza.
Feedback will be provided.

* Given the below (recursive or imperative) program,
  write the equivalent (imperative or recursive) program.

* For the below S-Exp, draw the cons diagram.

* Using the below definition of (some data structure name
  like LIST(A)), implement a function that takes that data structure
  as its only input and (does something).

* Given the below program (the program will be using any combination
  of the programming constructs covered so far in 520), explain the
  output of the program and/or provide possible inputs and/or provide
  possible test cases.

* What if we changed something in the operational semantics for 
  one of the programming constructions (a specific one would be named)?
  How would that change the meaning of that construct?

* Write and/or debug the derivation tree for the following expression.

* Implement the functions below using functions in the μScheme initial basis. 
  Solutions directly using recursion will receive zero credit. If you don't 
  remember exactly the order of arguments, or how these functions are curried, 
  just assume something reasonable and document your assumptions.

* The semantics of (vars, let, closures, etc.).  Consider the following uScheme program: 
  ...
  (a) Using the standard uScheme semantics, what is the value of ...?
  (b) Imagine we replace the standard SOMETHING rule with the following rule:
      Now what is the value of ...?
      Explain why the new rule does or does not affect the resulting value.

* What variables are free in the below lambda expression?  (either uScheme or lambda calculus)

* Apply the following substitutions for the lambda calculus expressions.

* In each of the scenarios below, give the name of a uScheme function you can use.
  Write no other code and no English.  Just the name of the function.

* For each of the below segments of code, indicate the result of each being evaluated 
  using Impcore and uScheme.  If the result is different, what specific part of the 
  semantics is causing the difference?

* Using equational reasoning and the provided algebraic laws, prove the following
  algebraic law is true or untrue.

* Using the provided (uScheme or Impcore) operational semantics and structural induction,
  prove the following algebraic law is true or untrue.

* Use the accumulating parameters approach to write a solution to the following problem.
  What is the cost of the solution in terms of (cons calls, function calls, ...)?
  Prove the cost of the function.

