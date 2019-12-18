# Induction and Recursion Using an Imperative Core

CSc 520 Spring 2020 Assignment

[Getting Started](#start)

[Reading Comprehension](#read)

Due Friday, January 24, 2020 at 11:59PM

This first assignment is divided into two parts:
 * Comprehension questions that help you focus your reading
 * Programming exercises that reinforce your skills with induction and recursion

ALERT: This assignment is three or four times easier than a typical CSc 520 assignment. Its role is to get you acclimated and to help you start thinking systematically about how recursion works. Later assignments get much harder and more time-consuming, so don’t use this one to gauge the difficulty of the course.

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

Please read pages 6–15, but not page 14, in the book by Ramsey. Then place the answers to the following questions in the text file called cqs.impcore.txt in your HW1-impcore repository:

1. What is the value of the following Impcore expression?

  (if (> 3 5) 17 99)


2. Which of the following best describes the syntactic structure of Impcore?

  a. An expression can contain a definition
  b. A definition can contain an expression
  c. Both of the above
  d. None of the above


3. Does this Impcore test pass? Please answer “yes” or “no.”

  (check-expect (+ 1 2 3) 6)

Assuming x is bound to a global variable, does this Impcore test pass? Again, please answer “yes” or “no.”

  (check-expect (set x 1) 1)


Next read Section 1.2, which starts on page 16, about abstract syntax.

4. After reading about abstract syntax, look at this picture of an abstract-syntax tree for a "calculator expression":
  
  <img alt="Picture of an abstract-syntax tree" src="hw1-ast.JPG" width="300">


Answer these questions:

a. What concrete syntax could you write in C for this expression (don't forget operator precedence)?

b. What concrete syntax could you write in Impcore for this expression?




# Programming in Impcore (90%)
# What to submit and how to submit it
# How your work will be evaluated
