# Announcements

* Posting participation in Piazza starts this week.

* First HW due next week, Friday January 24.  Start today!


# Introductions

## Introduce yourself

Write your name and then three lists of programming languages on 
a index card: languages you have programmed in for more than one 
semester, ones you have written at least one example in, and ones 
you are just aware exist.

## What am I called?
Call me "Michelle", "Dr. Strout", "Professor Strout", or "Profesor".

# Overview

## Why so many programming languages?

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

Because you’d spend most of your time learning shallow details like 
program syntax, tool chains, and library interfaces.

## What this course is:

Reusable Principles

### Why?

* Once you know the principles, you’ll be able to teach yourself new 
  languages quickly and improve your coding in many different languages.

* These principles are used as the basics in exciting PL research.
  Here are some examples.
  * program synthesis
  * gradual typing
  * proving security properties


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

## Resources to Help

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

 * Class/Lecture is for just the hard parts
 
 * Class will be interactive with
   * no electronics except to take notes (preferably with a stylus),
   * will be working with neighbors so encourage some movement around the 
     room once a week,
   * will be calling people to share from a random draw from the notecards, and
   * all questions about the course material and related CS topics are welcome.
     

 * We’ll talk very little about the code (just the interesting bits)

In a graduate course, you are responsible for your own learning

 * Course evaluations from previous years (from Tufts Comp 105):
   a few students want everything gone over in lecture. That’s not how things 
   work in real life, and that’s not how things work here. We point you in the 
   right direction and identify traps and pitfalls, and we find good problems 
   for you to work on.

 * If you’re expecting to see everything in lecture, you have a couple of choices: 
   change your expectations, or take a different course.

## Piazza Participation

 * Class goes very fast; Piazza participation provide chance to dig into 
   key topics with classmates and the instructor.

 * Start this Thursday and Friday.
 
 * Example problems you could submit an answer for will be posted.  You can
   also pick a problem NOT on the homework from the book to solve and post.
 
 * Only post an answer to the same question if your answer is different.
 
 * Piazza participation is 10% of your course grade.

 * Don’t just ask questions; answer them too.

 * Both activities count toward class participation.
  
 * Be super careful that any question containing your code for assignments
   must be private. (This is an issue of academic integrity.)

 * See the syllabus for possible extra credit.


## Office Hours

There is a poll in Piazza for office hours.  Please vote by the end of
today sometime (11:59pm today).

Office hours are a great opportunity for you and I to talk about concepts 
from the class, thoughts you are having about your career, doing research 
as a graduate student, job opportunities I have heard about lately, or 
anything else that is on your mind.  For Ph.D. students who are looking 
for a second professor to write a 5th semester portfolio, frequent visits 
to office hours enables me to be a potential letter writer for you.  Feel 
free to just come by and talk during office hours.


# ImpCore: The first language in our common framework

## Exercise: all-fours?

Write a function that takes a natural number n and returns true (1) 
iff all the digits in n are 4’s.

 * Work with a neighbor to write pseudocode for this.

 * Will draw a name and have someone present their solution.
 
 * Will show a solution written in impcore.

## Impcore interpretor

 * Will be building and running on the command line.

 * There is a docker container available.  See 
   [Getting Started](HomeworkWriteups/hw1-impcore-writeup.md#start)
   in the HW1 writeup.
  
 * Running the fours.imp program.
   ```
   ./impcore
   use fours.imp
   ```
   or
   ```
   ./impcore -q fours.imp
   ```

## Impcore language

 * Syntax: parentheses with keyword or function name to start

 * An Impcore program is a sequence of definitions (and expresions)

## Impcore variable definition

Example
```
    (val n 99)
```

Compare with C code
```
    int n = 99;
```
Also, expressions at top level (definition of it)


## Impcore expressions

No statements means **expression-oriented**:
```
    (if e1 e2 e3)
    (while e1 e2)
    (set x e)
    (begin e1 ... en)
    (f e1 ... en)
```
Each one has a value and may have side effects!

Functions are primitive `(+ - * / = < > print)`
or defined with `(define f ...)`.

The **only type of data is "machine integer"** (deliberate oversimplification)

## Scoping rules for Impcore

Scopes also called "name spaces"; we will call them "environments" 
because that’s the pointy-headed theory term, and if you want to 
read some of the exciting papers, pointy-headed theory has to be second nature.

### Names known in "environments"

Ways to talk about meanings of names:

 * Scope rules
 * Name spaces
 * Environments (aka symbol tables)

Impcore vars in 2 environments: globals, formals

There are **no local variables**
 * Just like awk; if you need temps, use extra formal parameters
 * For homework, you’ll add local variables

Functions live in their own environment (not shared with variables)

### Environmental abuse

Abuse of separate name spaces:
```
    -> (val f 33)
    33
    -> (define f (x) (+ x x))
    f
    -> (f f)
    66
```

# Recursion: a review

Ways a recursive function could decompose a natural number n.

1. Peel back one (Peano numbers):
```
    n = 0
    n = m + 1,    m is also a natural number

2. Split into two pieces:
```
    n = 0
    n = k + (n - k)    0 < k < n   (everything gets smaller)
```
3. Sequence of decimal digits (see study problems on digits)
```
    n = d,               where 0 <= d < 10
    n = 10 * m + d,      where 0 <= d < 10 and m > 0
```
To do your homework problems, which I recommend starting today, 
you’ll need to invent at least one more.
