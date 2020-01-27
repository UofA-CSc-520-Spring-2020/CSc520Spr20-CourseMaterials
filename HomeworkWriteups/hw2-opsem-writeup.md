# Operational Semantics for the Imperative Core

CSc 520 Spring 2020 Assignment

* [Getting Started](#start)

* [Part A: Reading Comprehension (Individual work, 10 percent)](#read)

* [Part B: Adding Local Variables to the Interpreter 
   (Work with a partner, 23 percent)](#local)

* [Part C: Operational semantics, derivations, and metatheory 
   (Individual work, 67 percent)](#opsem)

* [Organizing the answers to Part C](#organize)

* [How to organize and submit your work](#submit)

* [How your work will be evaluated](#eval)


**Due Friday, January 31, 2020 at 11:59PM**

The purpose of this assignment is to help you develop rudimentary skills 
with operational semantics, inference rules, and syntactic proof technique. 
You will use these skills heavily throughout the first two-thirds of the 
course, and you will use them again later if you ever want to keep up with 
the latest new ideas in programming languages or if you want to go on to 
advanced study.

Some of the essential skills are

 * Understanding what judgment forms mean, how to read them, and how to 
   write them

 * Understanding what constitutes a valid syntactic proof, known as a
   derivation

 * Understanding how a valid derivation in the operational semantics 
   relates to a successful, terminating evaluation of an expression

 * Proving facts about families of programs by reasoning about derivations, 
   a technique known as metatheory

 * Using operational semantics to express language features and 
   language-design ideas

 * Connecting operational semantics with informal English explanations 
   of language features

 * Connecting operational semantics with code in compilers or interpreters

Few of these skills can be mastered in a single assignment. When you’ve 
completed the assignment, I hope you will feel confident of your knowledge of 
exactly the way judgment forms, inference rules, and derivations are written. On 
the other skills, you’ll have made a start.


# Getting Started
<a name="start"/>

If you have `gcc`, `make`, `git`, `valgrind`, and potentially others installed
on your local machine, then you can skip the (docker) steps from the HW1
getting started and just do everything on your own command line.

* create your github repository by accepting assignment invite,
  https://classroom.github.com/a/OtvHrFxj

* within your running docker container or your own command line 
  (**NOTE: you need to replace yourgithubid below with your github id**):
  * clone your HW2 repository: `git clone https://github.com/UofA-CSc-520-Spring-2020/HW2-opsem-yourgithubid.git`

  * Edit README.md and cqs.opsem.txt, submit a README.locals and any modified
    C files from `bare/impcore-with-locals`, and create awk-icon.imp and 
    create theory.pdf to complete HW2.

* Other NOTES
  * You can start the impcore REPL by typing `./impcore`.  Note that to send
    an end-of-file in the REPL and quit the REPL, use Ctrl-D.
  * git commit and push FREQUENTLY
  * You will be submitting README.md, cqs.opsem.txt, awk-icon.imp,
    theory.pdf, README.locals, and edited C files from `bare/impcore-with-locals` 
    to Gradescope.  Each time you have to submit **ALL** of the files.
  * If you have any questions about this process ask **everyone** on
    Piazza.

# Part A: Reading Comprehension (individual work, 10 percent)
<a name="read"/>

For questions 1–5, please read pages 27–36 (the book sections on environments
and on operational semantics of expressions).

 1. ξ (or xi) is an environment that maps names to:

 2. ϕ (or phi) is an environment that maps names to:

 3. ρ (or rho) is an environment that maps names to:

Choices for questions 1–3:

  a. only user-defined functions.
  b. only the values of formal parameters.
  c. both primitive and user-defined functions.
  d. the values of both global variables and formal parameters.
  e. only primitive functions.
  f. only the values of global variables.

 4. In operational semantics, what kind of a thing does e stand for?

 5. In operational semantics, what kind of a thing does v stand for?

Choices for questions 4 and 5:

  a. a variable
  b. an elaboration
  c. an expression
  d. a value
  e. a function

For questions 6 and 7, please read Section 1.1.6 (page 23) on the 
difference between primitive functions and predefined functions, and 
please study the rules for function application in Section 1.4.6, which starts 
on page 34.

 6. Function <= is in the initial basis but is not a primitive function (it is 
    a predefined function). When evaluating (<= 0 n), what rule of the 
    operational semantics is used at the root of the derivation?

 7. Function < is primitive. When evaluating (< n 10), what rule of the 
    operational semantics is used at the root of the derivation?

Choices for Questions 6 and 7:

  a. ApplyLessThanEqTrue
  b. ApplyLessThanEqFalse
  c. ApplyUser
  d. ApplyLessThanTrue
  e. ApplyLessThanFalse
  f. ApplyPrim


# Part B: Adding Local Variables to the Interpreter 
  (Work with a partner, 23 percent)
<a name="local"/>

Related reading: Section 1.5, particularly Section 1.5.2, which starts on 
page 48. These pages will walk you through how the impcore interpreter is 
implemented.

This exercise will help you understand how operational semantics is implemented, 
and how language changes can be realized in C code. You will do Exercise 33 from 
page 92 of Ramsey’s book. We recommend that you solve this problem with a 
partner, but this solution must be kept separate from your other solutions. Your 
programming partner, if any, must not see your other work.

For information on pair programming, see this course's 
[pair programming](../pair-programming.md) guide and read advise about pair
programming on the internet.

Your github repository will start out with the `build-prove-compare/` directory
again.  You can find the source code from Chapter 1 in subdirectory `bare/impcore` 
or `commented/impcore`. The bare version, which we recommend, contains just the C 
code from the book, with simple comments identifying page numbers. The commented 
version, which you may use if you like, includes part of the book text as commentary.
We provide new versions of `all.h`, `definition-code.c`, `parse.c`, `printfuns.c`, and 
`tableparsing.c` that handle local variables. These versions are found in subdirectory 
`bare/impcore-with-local`s. There are not many changes; to see what is different, try running
```
   diff -r bare/impcore bare/impcore-with-locals
```
You may wish to try the -u or -y options with `diff`. In the directory `bare/impcore-with-locals`,
you can build an interpreter by typing `make`. The interpreter you build will parse 
definitions containing local variables, but it will ignore them. To get local variables 
working, you'll need to make changes:

In `eval.c`, you will have to modify the evaluator to give the right semantics to local 
variables. Local variables that have the same name as a formal parameter should hide 
that formal parameter, as in C.

You also have the right to modify other files as you see fit.

You may find the function `mkVL` in file `list-code.c` helpful.

Create a file called `README.locals` in your `impcore-with-locals` directory. Describe 
your solution in the README.locals.


# Part C: Operational semantics, derivations, and metatheory
  (Individual work, 67 percent)
<a name="opsem"/>

Related reading:

 * For an example of a derivation tree, see page 63.
 * For rules of operational semantics, see pages 85-86.
 * For metatheory, see Section 1.6.2, which starts on page 63.

These exercises are intended to help you become fluent with operational 
semantics. Do not share your solutions with any programming partners. 
We encourage you to discuss ideas, but nobody else may see your rules, 
your derivations, or your code. If you have difficulty, talk with the instructor
on piazza or in office hours.

 * Do Exercise 13 on page 86 of Ramsey’s book. The purpose of the exercise is 
   to develop your understanding of derivations, so be sure to make your 
   derivation complete and formal. You can write out a derivation like the 
   ones in the book, as a single proof tree with a horizontal line over each 
   node. If you prefer, you can write a sequence of judgments, number each 
   judgment, and write a proof tree containing only the numbers of the judgments, 
   which you will find easier to fit on the page.

 * Do Exercise 14 on page 86 of Ramsey’s book. Now that you know how to write 
   a derivation, in this exercise you start reasoning about derivations.

 * Do Exercises 21 and 22 on page 87 of Ramsey’s book. This is an exercise in 
   language design. The main purpose of the exercise is to give you a feel for 
   the kinds of choices language designers can make. But you must also be able 
   to think about the consequences of language-design choices before an 
   implementation of the language has been built.

   You do have an implementation that can verify the first two properties mentioned
   in the exercise: it's the standard Impcore interpreter. But you don't have an 
   Awk-like interpreter or an Icon-like interpreter, so you have no implementation 
   that you can use to verify the last two properties. Your choices are to think 
   carefully about the semantics you have designed and the program you have 
   written—or to build two more interpreters, so that you can actually test your code. 
   Thinking carefully is the sane choice.

   **Exercise 22 clarification:** The "program" referred to in the exercise is just 
   a sequence of definitions.

   Here is an example of a program that is syntactically valid:
```
    (define always-three () 3)
    (always-three)
```
   When running this program in the standard Impcore intepreter, notice that the first 
   line returns the function always-three, it does not return 3. The function needs 
   to be called in order for 3 to be returned (which happens on the second line).

   **Invoke functions** if your program includes functions. A common mistake is to
   define a function in your program, and then forget to call it. If you forget to 
   call your function, then when we run your program, the output will probably not 
   be what you wanted it to be.

 * Do Exercise 20 on page 87 of Ramsey’s book. In this exercise you prove that given 
   a set of environments, the result of evaluating any expression e is completely 
   determined. That is, in any given starting state, evaluation produces the same 
   results every time. This proof requires you to raise your game again, reasoning 
   about the set of all valid derivations. It’s metatheory. Metatheoretic proofs 
   are probably unfamiliar, but you will have a crack at them in lecture and in piazza
   example problems. When you have got your thinking to this level, you can see how 
   language designers use operational semantics to show nontrivial properties of 
   their languages—and how these properties can guide implementors.

   The way to tackle this problem is to assume you have two valid derivations with 
   the same e and the same environments on the left, but different v's on the right
   —let's call them v1 and v2. You then prove that if both derivations are valid, v1 = v2.

   In other words, show that no matter what e is, if  <e, ξ, ϕ, ρ> ⇓ <v1, ξ′, ϕ′, ρ′> 
   and  <e, ξ, ϕ, ρ> ⇓ <v2, ξ′, ϕ′, ρ′>, then v1 = v2.

   You will do this proof in **Theoretical Impcore**. Theoretical Impcore is a restricted 
   subset of Impcore in which:
   * There are no while or begin expressions.
   * Every function application has exactly two arguments.
   * The only primitive function is +.

   Using Theoretical Impcore reduces the number of cases to a manageable number. It will 
   relieve some of the tedium (which is very common in programming-language proofs).

# Organizing the answers to Part C
<a name="organize"/>

For these exercises you will turn in two files: theory.pdf and awk-icon.imp. 
For file theory.pdf, you could consider using LaTeX, but unless you already 
have experience using LaTeX to typeset mathematics, it’s a bad idea. We recommend 
that you write your theory homework by hand, then scan or photograph it.

To help us read your answers to Part C, we need for you to organize them carefully:

 * The answer to each question must start on a new page.

 * The theory answers must appear in this order: Exercises 13, 14, 21. and finally 20.

 * Your answer to Exercise 22 should be in file awk-icon.imp.


# How to organize and submit your work
<a name="submit"/>

Before submitting code, **test what you can**. We do not provide any tests; 
you write your own. All code can be fully tested except the code for Exercise 22.

 * To complete part A, which you do by yourself, download the questions, and edit 
   the answers into the file cqs.opsem.txt. If your editor is not good with Greek 
   letters, you can spell out their names: ξ is "xi," ϕ is "phi," and ρ is "rho."

 * To submit part B, which you may have done with a partner, submit a README.locals
   file that documents your solution and all of the C files in bare/impcore-with-locals/
   that you modified and/or added.

 * As soon as you have these files, submit a preliminary version of your work to Gradescope.
   Keep submitting until your work is complete; we grade only the last submission.  Each time
   you submit you need to submit ALL of the files.

 * To complete part C, which you do by yourself, create files awk-icom.imp and theory.pdf. 
   Please also create a file called README.md, in which you tell us anything else you 
   think is useful for us to know.

   We provide a template for your README.md in your initial github repository.

 * As soon as you have the files for parts A and C, which you will have done by yourself,
   submit the files README.md, cqs.opsem.txt, awk-icon.omp, and theory.pdf to Gradescope.
   You will have to submit **ALL** of the C files you have edited and/or created and 
   README.locals at the same time.
   **Preliminary versions of files are FINE to submit.**  Keep submitting and resubmitting until
   your work is complete; we grade only the last submission.  When you submit, submit ALL
   of the files.

# How your work will be evaluated
<a name="eval"/>

## Adding local variables to Impcore

Everything in the [general coding rubric](../coding-rubric.md) applies, but we will focus 
on three areas specific to this exercise:

### Locals

#### Exemplary

 * Change to interpreter appears motivated either by changing 
   the semantics as little as possible or by changing the code as little 
   as possible.

 * Local variables for Impcore pass simple tests.

#### Satisfactory

 * Course staff believe they can see motivation for changes to interpreter, 
   but more changes were made than necessary.

 * Local variables for Impcore pass some tests.

#### Must improve

 * Course staff cannot understand what ideas were used to change the interpreter.

 * Local variables for Impcore pass few or no tests.

### Naming

#### Exemplary

 * Where the code implements math, the names of each variable in the code 
   is either the same as what’s in the math (e.g., rho for ρ), or is an 
   English equivalent for what the code stands for (e.g., parameters or parms for ρ).

#### Satisfactory

 * Where the code implements math, the names don't help the course staff 
   figure out how the code corresponds to the math.

#### Must Improve

 * Where the code implements math, the course staff cannot figure out how 
   the code corresponds to the math.

### Structure

#### Exemplary

 * The code is so clear that course staff can instantly tell whether it 
   is correct or incorrect.

 * There’s only as much code as is needed to do the job.

 * The code contains no redundant case analysis.

#### Satisfactory

 * Course staff have to work to tell whether the code is correct or incorrect.

 * There’s somewhat more code than is needed to do the job.

 * The code contains a little redundant case analysis.

#### Must Improve

 * From reading the code, course staff cannot tell whether it is correct or incorrect.

 * From reading the code, course staff cannot easily tell what it is doing.

 * There's about twice as much code as is needed to do the job.

 * A significant fraction of the case analyses in the code, maybe a third, are redundant.

## Operational semantics

Here is an extensive list of criteria for judging semantics, rules, 
derivations, and metatheoretic proofs. As always, you are aiming for 
the left-hand column, you might be willing to settle for the middle 
column, and you want to avoid the right-hand column.

### Changed rules of Impcore (Exercise 21)

#### Exemplary

 * Every inference rule has a single conclusion, which is a 
   judgment form of the operational semantics.

 * In every inference rule, every premise is either a judgment 
   form of the operational semantics or a simple mathematical 
   predicate such as equality or set membership.

 * In every inference rule, if two states, two environments, 
   or two of any other thing must be the same, then they are 
   notated using a single metavariable that appears in multiple places. 
   (Example: ρ or σ)

 * In every inference rule, if two states, two environments, or two 
   of any other thing may be different, then they are notated using 
   different metavariables. (Example: ρ and ρ')

 * New language designs use or change just enough rules to do the job.

 * Inference rules use one judgment form per syntactic category.

#### Satisfactory

 * In every inference rule, two states, two environments, or two of 
   any other thing must be the same, yet they are notated using different 
   metavariables. However, the inference rule includes a premise that 
   these metavariables are equal. (Example: ρ1 = ρ2)

 * A new language design has a few too many new or changes a few too 
   many existing rules.

 * Or, a new language design is missing a few rules that are needed, 
   or it doesn’t change a few existing rules that need to be changed.

#### Must Improve

 * Notation that is presented as an inference rule has more than one 
   judgment form or other predicate below the line.

 * Inference rules contain notation above the line that does not resemble 
   a judgment form and is not a simple mathematical predicate.

 * Inference rules contain notation, either above or below the line, 
   that resembles a judgment form but is not actually a judgment form.

 * In every inference rule, two states, two environments, or two of any 
   other thing must be the same, yet they are notated using different 
   metavariables, and nothing in the rule forces these metavariables to 
   be equal. (Example: ρ and ρ' are both used, yet they must be identical.)

 * In some inference rule, two states, two environments, or two other things 
   may be different, but they are notated using a single metavariable. 
   (Example: using ρ everywhere, but in some places, ρ' is needed.)

 * In a new language design, the number of new or changed rules is a lot 
   different from what is needed.

 * Inference rules contain a mix of judgment forms even when describing the 
   semantics of a single syntactic category.


### Program to probe Impcore/Awk/Icon semantics (Exercise 22)

#### Exemplary

 * The program which is supposed to behave differently in Awk, 
   Icon, and Impcore semantics behaves exactly as specified with each semantics.

#### Satisfactory

 * The program that is supposed to behave differently in Awk, Icon, 
   and Impcore semantics behaves almost exactly as specified with each semantics.

#### Must Improve

 * The program which is supposed to behave differently in Awk, Icon, and 
   Impcore semantics gets one or more semantics wrong.

 * The program which is supposed to behave differently in Awk, Icon, and 
   Impcore semantics looks like it is probably correct, but it does not 
   meet the specification: either running the code does not print, or it 
   prints two or more times.

### Derivations (Exercises 13 and 14)

#### Exemplary

 * In every derivation, every utterance is either a judgment form 
   of the operational semantics or a simple mathematical predicate 
   such as equality or set membership.

 * In every derivation, every judgement follows from instantiating 
   a rule from the operational semantics. (Instantiating means 
   substituting for meta variables.) The judgement appears below a 
   horizontal line, and above that line is one derivation of each premise.

 * In every derivation, equal environments are notated equally. In 
   a derivation, ρ and ρ' must refer to different environments.

 * Every derivation takes the form of a tree. The root of the tree, 
   which is written at the bottom, is the judgment that is derived (proved).

 * In every derivation, new bindings are added to an environment 
   exactly as and when required by the semantics.

#### Satisfactory

 * In one or more derivations, there are a few horizontal lines 
   that appear to be instances of inference rules, but the 
   instantiations are not valid. (Example: rule requires two 
   environments to be the same, but in the derivation they are different.)

 * In a derivation, the semantics requires new bindings to be added 
   to some environments, and the derivation contains environments 
   extended with the right new bindings, but not in exactly the right places.

#### Must Improve

 * In one or more derivations, there are horizontal lines that 
   the course staff is unable to relate to any inference rule.

 * In one or more derivations, there are many horizontal lines 
   that appear to be instances of inference rules, but the 
   instantiations are not valid.

 * A derivation is called for, but course staff cannot identify 
   the tree structure of the judgments forming the derivation.

 * In a derivation, the semantics requires new bindings to be 
   added to some environments, and the derivation does not contain 
   any environments extended with new bindings, but the new bindings 
   in the derivation are not the bindings required by the semantics. 
   (Example: the semantics calls for a binding of answer to 42, but 
   instead answer is bound to 0.)

 * In a derivation, the semantics requires new bindings to be added
   to some environments, but the derivation does not contain any 
   environments extended with new bindings.

### Metatheory (Exercise 20)

#### Exemplary

 * Metatheoretic proofs operate by structural induction on derivations, 
   and derivations are named.

 * Metatheoretic proofs classify derivations by case analysis over the 
   final rule in each derivation. The case analysis includes every possible 
   derivation, and cases with similar proofs are grouped together.

#### Satisfactory

 * Metatheoretic proofs operate by structural induction on derivations, but 
   derivations and subderivations are not named, so course staff may not be 
   certain of what’s being claimed.

* Metatheoretic proofs classify derivations by case analysis over the final 
  rule in each derivation. The case analysis includes every possible derivation, 
  but the grouping of the cases does not bring together cases with similar proofs.

#### Must Improve

 * Metatheoretic proofs don't use structural induction on derivations (serious fault).

 * Metatheoretic proofs have incomplete case analyses of derivations.

 * Metatheoretic proofs are missing many cases (serious fault).

 * Course staff cannot figure out how metatheoretic proof is broken down by cases (serious fault).


