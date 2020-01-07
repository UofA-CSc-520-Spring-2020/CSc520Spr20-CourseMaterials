# Announcements

* Posting participation in Piazza starts this week.

* First HW due Wednesday, September 13.

# Overview

## Why so many languages?

Question: What languages have you programmed in?

There are thousands of programming languages, each unique.

Question: Why do you suppose there are so many?

The right language for the job makes it easier to write programs that really work
* An invaluable skill for software practitioners

* Your language can make you or break you.

* Example
  * Writing a compiler requires a language that facilitiates maniuplating tree data structures
  * Relevant features: algebraic data types, pattern matching, efficient recursion, higher-order functions

## What this course isn’t

* Simula in January
* Objective-C in February
* Visual Basic in March
* C in April

### Why not?

Because you’d spend most of your time learning shallow details like program syntax, 
tool chains, and library interfaces.

## What this course is:

Reusable Principles

### Why?

Once you know the principles, you’ll be able to teach yourself new languages quickly 
and improve your coding in many different languages.

## What are reusable principles?

What if the course were called “Cooking”?

* You’d need to know something about how cooking works (THEORY)

  * Want to make bread? How does yeast work?

  * Want to avoid getting sick? Under what conditions do bacteria thrive?

  * Want to develop flavor? What triggers the Maillard reaction?

* You’d need to know something about how to cook effectively (PRACTICE)

  * French cuisine: mirepoix (onions, carrots, celery cooked in butter)

  * Base sauces (the 5 "mother sauces" of Western cooking); Know what they are and when to use them.

The same division for programming languages:

* How programming languages work (THEORY)

  MATH: logic, semantics, type theory, induction

* How to make them effective (PRACTICE)

  What features enable compact, efficient, maintainable CODE?


## What Programming Languages are, technically

 * The combination of math and code

 * Principal tools: Induction and recursion

## What can you get out of CSc 520?

 * Discover new ways think about programming (in many languages)

   For example: master using recursive, higher-order functions

 * Double your productivity

   By choosing the right language/feature for the job

 * Become a sophisticated consumer, recognizing familiar features in new languages

 * Learn new languages quickly

 * Learn the basics for PL research


## Great languages begin with great features

 * Language shapes your thinking

 * There aren’t that many great features, and you will see them over and over

 * You’ll choose features, and therefore languages, to fit your needs

 * Some are more powerful than others

 * Examples: first-class functions, continuations, pattern matching, type inference

In CSc 520,

 * We explode your brain so you can think differently

 * You’ll know you’re doing it right if at first your head hurts terribly, 
   then you have a breakthrough moment and it all seems pleasant afterwards

## How will we study language features?

 * Write (lots of!) small programs exercising those features

   High power-to-weight ratio (lots of thought per line)

 * Learn formal tools to describe language features precisely

    * Operational Semantics (What do programs mean?)

    * Typing Rules (What can we prove about all programs without running them?)

 * Extend language implementations so you understand what is under the hood.

 * Prove properties about various language features

## Common Framework

 * Sequence of Scheme-based pedagogical languages with increasing power

   Simplest language: ImpCore (IMPerative CORE)

 * Implementation language:

   * Start in C

   * Shift to ML once we have learned that language

 * Foundation of operational semantics and typing rules

# Course logistics and administration

## Books
 You must get Norman’s book and the supplement (Both Volumes!!!)

## Homework

Homework will be frequent and challenging:
 * Many small programming problems
 * Some theory problems, more like a math problem set
 * The occasional larger project, like a type checker
 * Submit everything electronically via gradescope
 * **First homework is due a week from today;** designed to get you moving quickly.
 * The course is relentlessly cumulative.

Both individual and pair work:
 * All problems should be discussed with others
   (Essential to your success)
 * Discussions must be acknowleged
 * Most problems must be completed individually
 * **Do not allow anyone else to see your code.**
 * For some problems larger in scope, you can work in pairs
 * **Be very careful** to separate your pair work and your individual work. 
   (A mistake could be major violation of academic integrity, with severe penalties.)

Arc of the homework looks something like this:

| Assignment  | Difficulty |
| ----------- | ---------- |
| HW1-impcore | one star   |
| HW2-opsem   | two stars  |
| HW3-scheme  | three stars|
| HW4-hofs    | four stars |

And it’s more or less four-star homeworks from there on out.

Lesson: **Don’t make decisions** based on the first couple of homeworks!

**Everyone who takes this class has the ability to master the material; 
Succeeding just requires digging in.**

We provide lots of resources to help:

 * Classes

 * Readings

 * Piazza participation

 * Office hours

We encourage you to form study groups so you have thought partners.

Two two bad habits to avoid:

 * Working on your own.

 * Trying to cram the assignments at the last minute.

## The role of classes

 * We don’t cover everything in class/lecture

 * Lecture is for just the hard parts

 * We’ll talk very little about the code (just the interesting bits)

In a graduate course, you are responsible for your own learning

 * Course evaluations from previous years: a few students want everything 
   gone over in lecture. That’s not how things work in real life, and that’s 
   not how things work here. We point you in the right direction and identify 
   traps and pitfalls, and we find good problems for you to work on.

 * If you’re expecting to see everything in lecture, you have a couple of choices: 
   change your expectations, or take a different course.

## Piazza Participation

 * Class goes very fast; Piazza participation provide chance to dig into 
   key topics with classmates and the instructor.

 * Start this Thursday and Friday.
Location information available in SIS.
Designed to be interactive, so bring your thinking cap.
Count towards class participation.
Questions and answers on Piazza
Don’t just ask questions; answer them too.
Both activities count toward class participation.
Be super careful that any question containing your code must be private. (This is an issue of academic integrity.)
Other policies and procedures on the web
You are responsible!
Treasure Hunt for class participation points
What am I called?
Call me “Kathleen,” “Professor Fisher”, or “Profesor.”

ImpCore: The first language in our common framework
Exercise: all-fours?
Write a function that takes a natural number n and returns true (1) iff all the digits in n are 4’s.

Code

Impcore interpretor: > impcore
Command (use homework/fours.imp); will load file into interpretor
Syntax: parentheses with keyword or function name to start
An Impcore program is a sequence of definitions (and expresions)
Impcore variable definition

Example

(val n 99)
Compare

int n = 99;
Also, expressions at top level (definition of it)
