# Midterm Study Guide, March 6, 2020

The midterm will be in class on March 18th.

You can bring an 8.5x11 piece of paper with any notes you want 
on BOTH sides of the paper.  I WILL be providing
you any operational semantics rules you may need to use.

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

* lambdas expressions as values

* higher-order functions that encapsulate recursive patterns
  * be able to use any of the hofs from exercises:
    foldr and foldl, all?, exists? map, filter
  * what recursive patterns are being encapsulated?
    how would we implement these hofs recursively?
  * how can we implement any of the other hofs with foldr?

* continuations

* let, let*, letrec

<hr>
## Precisely understanding what programs will do

* operational semantics

* judgement derivations


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

* Given the below 
