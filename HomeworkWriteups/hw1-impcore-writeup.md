# Induction and Recursion Using an Imperative Core

CSc 520 Spring 2020 Assignment

* [Getting Started](#start)

* [Reading Comprehension](#read)

* [Programming in Impcore](#impcore)

* [What to submit and how to submit it](#submit)

* [How your work will be evaluated](#eval)


**Due Friday, January 24, 2020 at 11:59PM**

This first assignment is divided into two parts:
 * Comprehension questions that help you focus your reading
 * Programming exercises that reinforce your skills with induction and recursion

ALERT: This assignment is three or four times easier than a typical CSc 520 
assignment. Its role is to get you acclimated and to help you start thinking 
systematically about how recursion works. Later assignments get much harder and 
more time-consuming, so don’t use this one to gauge the difficulty of the 
course.

<a name="start"/>

# Getting Started

FIXME: see how I did 210

* download docker app
* download the docker container for this class and run some tests
* create your repository by accepting repository invite?
* within your running docker container
    * clone your HW1 repository
    * edit the starter files in that repository
    * git commit and push FREQUENTLY

<a name="read"/>

# Reading-Comprehension Questions (10%)

Please read pages 6–15, but not page 14, in the book by Ramsey. Then place the 
answers to the following questions in the text file called cqs.impcore.txt in 
your HW1-impcore repository:

1. What is the value of the following Impcore expression?

  (if (> 3 5) 17 99)


2. Which of the following best describes the syntactic structure of Impcore?

  a. An expression can contain a definition
  b. A definition can contain an expression
  c. Both of the above
  d. None of the above


3. Does this Impcore test pass? Please answer “yes” or “no.”

  (check-expect (+ 1 2 3) 6)

Assuming x is bound to a global variable, does this Impcore test pass? Again, 
please answer “yes” or “no.”

  (check-expect (set x 1) 1)


Next read Section 1.2, which starts on page 16, about abstract syntax.

4. After reading about abstract syntax, look at this picture of an 
   abstract-syntax tree for a "calculator expression":
  
  <img alt="Picture of an abstract-syntax tree" src="hw1-ast.JPG" width="300">


Answer these questions:

a. What concrete syntax could you write in C for this expression (don't forget 
   operator precedence)?

b. What concrete syntax could you write in Impcore for this expression?



5. Read the expectations about contracts in the 
   [course coding guidelines](FIXME).

Suppose I write a contract for a power function that says, "this function 
multiplies x by itself n times." According to our expectations, is this a good 
contract or a bad contract? Please answer "good" or "bad."  If it is bad, write 
a good version.



<a name="impcore"/>
# Programming in Impcore (90%)

The problems below are simple programming exercises that serve multiple 
purposes:
 * to get you thinking explicitly about induction and recursion,
 
 * to get you acclimated to the LISP-style concrete syntax used throughout 
   the course,
 
 * to get you started with the course software, 
 
 * and to help you practice the forms of testing and documentation that are 
   expected in the course.
   
You can start these exercises immediately after the first lecture. If you 
find it entertaining, you may write very efficient solutions—but do not 
feel compelled to do so.

**Do not share your solutions with anyone.** We encourage you to discuss ideas, 
but **no one other than the instructor may see your code**.

<a name="submit"/>
# What to submit and how to submit it


<a name="eval"/>
# How your work will be evaluated

## How your code will be evaluated
A big part of this assignment is for you to be sure you understand how we expect your code to be structured and organized. There is some material about this on the coding style page on the course web site. When we get your work, we will evaluate it in two ways:

About 50% of your grade for the assignment will be based on our judgement of the structure and organization of your code. To judge structure and organization, we will use the following dimensions:

Documentation assesses whether your code is documented appropriately.

We expect you to document each function such that someone else could use your code and reason about its result without having to see the code itself. In particular, every function must be documented with a contract, and the contract must mention each parameter by name.

For this assignment, we also expect you to document your analysis of the inductive struture used by each function. Your analysis should explicitly identify which cases are base cases and which are inductive steps.

And remember that every named parameter should be mentioned in a function’s contract.

Unit testing assesses whether your code is appropriately tested by check-expect and/or check-error.

We expect that you will write enough unit tests to test every part of your code. And we expect a unit test for every base case and induction step in your analysis of the inductive structure of numbers.

Form assesses whether your code uses indentation, line breaks, and comments in a way that makes it easy for us to read.

We expect you to use consistent indentation, to obey the offside rule described in the coding-style guidelines, and to limit the use of inline comments in the body of each function.

Naming assesses your choice of names. To people who aspire to be great programmers, names matter deeply.

We give you a hand here by providing a template in which the names of top-level functions and their arguments are already chosen for you. For helper functions, you will choose your own names. Look at the coding rubric and choose wisely.

Structure assesses the underlying structure of your solution, not just how its elements are documented, formatted, and named.

We expect that if asked to use recursion, your solution will use recursion. Additionally, we expect that your recursive structure will be minimal, avoiding superfluous cases—especially redundant base cases—and unnecessary comparisons.

About 30% of your grade for the assignment will be based on our judgement of the correctness of your code. We often look at code to see if it is correct, but our primary tool for assessing correctness is by testing. On a typical assignment, the correctness of your code would carry more weight, but relative to the other homeworks in 105, the problems on this assignment are very easy, so they carry less weight.

The detailed criteria we will use to assess your code are found at http://www.cs.tufts.edu/comp/105/coding-rubric.html. Though things may be worded differently, most of these criteria are also applied in COMP 11, 15, and 40—they make explicit what we mean by “good programming practice.” But as you might imagine, there is a lot of information there—probably more than you can assimilate in one reading. The highlights are

Documentation
Each function is documented with a contract that explains what the function returns, in terms of the parameters, which are mentioned by name. From documentation, it is easy to determine how each parameter affects the result.
The contract makes it possible to use the function without looking at the code in the body.
Documentation appears consistent with the code being described.
Each parameter is mentioned in the documentation at least once.
In every case analysis, all cases are necessary.
Unit Testing
Unit tests cover the branches of execution for the function.
Unit tests test input which is valid per the problem definition.
Form
Code fits in 80 columns.
Code respects the offside rule.
Code contains no tab characters.
Indentation is consistent everywhere.
If a construct spans multiple lines, its closing parenthesis appears at the end of a line, possibly grouped with one or more other closing parentheses—never on a line by itself.
No code is commented out.
Solutions load and run without calling print
Naming
Each function is named either with a noun describing the result it returns, or with a verb describing the action it does to its argument. (Or the function is a predicate and is named as suggested below.)
A function that is used as a predicate (for if or while) has a name that is formed by writing a property followed by a question mark. Examples might include even? or prime?. (Applies only if the language permits question marks in names.)
In a function definition, the name of each parameter is a noun saying what, in the world of ideas, the parameter represents.
Or the name of a parameter is the name of an entity in the problem statement, or a name from the underlying mathematics.
Or the name of a parameter is short and conventional. For example, a magnitude or count might be n or m. An index might be i, j, or k. A pointer might be p; a string might be s. A variable might be x; an expression might be e.
Structure
Solutions are recursive, as requested in the assignment.
There’s only as much code as is needed to do the job.
In the body of a recursive function, the code that handles the base case(s) appears before any recursive calls.
The code of each function is so clear that, with the help of the function’s contract, course staff can easily tell whether the code is correct or incorrect.
Expressions cannot be made any simpler by application of algebraic laws.
