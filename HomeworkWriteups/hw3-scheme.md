# HW3 Functional programming in uScheme

CSc 520 Spring 2020 Assignment

* [Overview](#overview)

* [Getting Started](#start)

* [Dire Warnings](#warnings)

* [Reading Comprehension (10 percent)](#read)

* [Programming and Proof Problems (90 percent)](#prog)

* [What and how to submit](#submit)

* [How your work will be evaluated](#eval)


**Due Friday, February 7th, 2020 at 11:59PM**

This assignment is all individual work. 
There is **no pair programming**.

# Overview
<a name="overview"/>

The purpose of this assignment is to give you extensive practice writing 
functions that work with lists and S-expressions, plus a little bit more 
practice with programming-language theory and proofs. The assignment is based 
primarily on material from Section 2.1 through Section 2.6 of Ramsey. You will 
also need to know the syntax in Section 2.11, which starts on page 149 and the 
initial basis in Section 2.13, which starts on page 160—the table on page 161 is 
your lifeline. Finally, although it is not necessary, you may find some problems 
easier to solve if you read ahead from Section 2.7 through Section 2.9.

You will define many functions and write a few proofs. The functions are small; 
most are in the range of 4 to 8 lines, and none of my solutions is more than a 
dozen lines. If you don't read ahead, a couple of your functions will be a bit 
longer, which is OK.


# Getting Started
<a name="start"/>

Accept the github assignment at https://classroom.github.com/a/44OLi48k
and do a git clone of your repository.  Make sure to `get commit -a` and
`git push` frequently!

To create the executable μScheme interpreter, do the following in a clone
of your assignment repository.
```
    cd build-prove-compare/bare/uscheme
    make
    cp uscheme ../../../
    cd ../../../
    ./uscheme -q < solution.scm   // to see if that worked
```

USEFUL: We provide a template for solution.scm. The "solution.scm" template contains a skeleton version of each function you must define, but the body of the function calls error. Each call to error should be replaced with a correct implementation.


# Dire Warnings
<a name="warnings"/>

Since we are studying functional programming, the μScheme programs you submit 
must not use any imperative features. **Banish `set`, `while`, `println`, 
`print`, `printu`, and `begin` from your vocabulary! If you break this rule for 
any problem, you will get No Credit for that problem.** You may find it useful 
to use `begin` and `println` while debugging, but they must not appear in any 
code you submit. As a substitute for assignment, use `let` or `let*`.

Helper functions may be defined at top level only if they meet these criteria:

 * Each helper function has a meaningful name.

 * Each helper function is given an explicit contract—or, as described in the 
   general coding rubric, we can infer the contract by looking at the names of 
   the function and its formal parameters.

 * Each helper function is tested by check-expect or check-assert, and possibly 
   check-error.

As an alternative to helper functions, you may read ahead and define local 
functions using lambda along with `let`, `letrec`, or `let*`. If you do define 
local functions, avoid passing them redundant parameters—a local function 
already has access to the parameters and let-bound variables of its enclosing 
function.

Your solutions must be valid μScheme; in particular, they must pass the 
following test:
```
   ./uscheme -q < myfilename
```
without any error messages or unit-test failures. If your file produces error 
messages, we won't test your solution and you will earn No Credit for functional 
correctness. (You can still earn credit for structure and organization). If your 
file includes failing unit tests, you might possibly get some credit for 
functional correctness, but we cannot guarantee it.

Code you submit must not even mention &trace. We recommend that you use &trace 
only at the interactive prompt.

We will evaluate functional correctness by automated testing. **Because testing 
is automated, each function must be named be exactly as described in each 
question. Misnamed functions earn No Credit.** You may wish to use the template 
provided above (`solution.scm`), which has the correct function names.

# Reading Comprehension (10 percent)
<a name="read"/>

These problems will help guide you through the reading. We recommend that you 
complete them before starting the other problems below. You can download the 
questions.

1. Review Section 2.2 on list primitives and S-expression literals and say what 
   is the value of each of the expressions below. If a run-time error would 
   occur, please say so.
```
    (car '(a b 1 2))  
    (cdr '(a b 1 2))  
    (= 'a 'b)
```        
   To write your answers, use S-expression literals. For example:
```
    '(a b c)
    #t
    17
    'b
```

2. Review the first few pages of Section 2.3, through the end of Section 2.3.2. 
   Which of the following expressions evaluate to #t for every list xs?

```
    (=      (reverse (reverse xs)) xs)
    (equal? (reverse (reverse xs)) xs)
```

  * a. Only the first
  * b. Only the second
  * c. Both the first and the second
  * d. None

3. Read Section 2.3.2, then please explain in your own words the difference 
   between simple-reverse and reverse.

4. Review the first part of Section 2.4, up to 2.4.4, and discover a new 
   algebraic law that applies to some combination of append and length. Write 
   your law in the style of Section 2.4.4. Like the other list laws in that 
   section, your law must mention a variable xs, which must be allowed to be any 
   arbitrary list.

5. Imagine you are tasked with translating the following C function into 
   μScheme:
```
    bool parity(int m) {
        int half_m = m / 2;
        int other_half = m - half_m;
        return half_m == other_half;
    }      
```
   Review Section 2.5, and answer each of these questions with “yes” or “no.”

   * a. Is it sensible to bind `half_m` and `other_half` in the same `let` 
   expression?

   * b. Is it sensible to bind `half_m` and `other_half` in the same `let*` 
   expression?
   
   * c. Is the below translation sensible and faithful to the original C code?
```
   (define parity (m)
   (letrec ([half_m     (/ m 2)]
            [other_half (- m half_m)])
     (= half_m other_half)))
```

# Programming and Proof Problems (90 percent)
<a name="prog"/>

For the "programming and proof" part of this assignment, you will do Exercises 
1, 10, and 31 in the book, plus the problems A through D below,
but in the order they are listed.

## Problem Details

Related Reading: Many of the following problems will ask you to write recursive 
functions on lists.  You can sometimes emulate examples from Section 2.3, which 
starts on page 102. And you will definitely want to take advantage of μScheme’s 
predefined and primitive functions (the initial basis), which are listed in 
Section 2.13, which starts on page 160.

1. A list of S-expressions is an S-expression. Do Exercise 1 on page 191 of 
   Ramsey.

   Related Reading: The definitions of LIST (A) and SEXP are on page 118.


10. Taking and dropping a prefix of a list. Do Exercise 10 on page 195 of 
    Ramsey.

    Each function you define should be accompanied by test cases using  
    check-expect. In comments, explain the purpose of each test.


31. Calculational proof. Do Exercise 31 on page 203 of Ramsey, proving that 
    reversing a list does not change its length.

    Hint: structural induction.

    Related Reading: Section 2.4.7, which starts on page 115

B. Zip and unzip. Function zip converts a pair of lists to an association list; 
   unzip converts an association list to a pair of lists. If zip is given lists 
   of unequal length, its behavior is not specified.
```
  -> (zip '(1 2 3) '(a b c))
  ((1 a) (2 b) (3 c))
  -> (unzip '((I Magnin) (U Thant) (E Coli)))
  ((I U E) (Magnin Thant Coli))
```
   Provided lists xs and ys are the same length, zip and unzip satisfy these 
   algebraic laws:
```
  (zip (car (unzip pairs)) (cadr (unzip pairs))) == pairs
  (unzip (zip xs ys))  ==  (list2 xs ys)
```
   Implement zip and unzip.

   Related Reading: Information on association lists can be found in Section 
   2.3.8, which starts on page 110.

   Each function you define should be accompanied by test cases using 
   check-expect. In comments, explain the purpose of each test.

C. Arg max. This problem gives you a taste of higher-order functions, which 
   we'll be covering in more detail in the next homework assignment. Function 
   `arg-max` expects two arguments: a function `f` that maps a value in set `A` 
   to a number, and a nonempty list as of values in set `A`. It returns an 
   element `a` in `A` for which `(f a)` is as large as possible.
```
  -> (define square (a) (* a a))
  -> (arg-max square '(5 4 3 2 1))
  5
  -> (define invert (a) (/ 1000 a))
  -> (arg-max invert '(5 4 3 2 1))
  1
```
   Implement arg-max. Hint: the specification says that the list argument to 
   arg-max is not empty. Take advantage.

   Each function you define should be accompanied by test cases using 
   check-expect. In comments, explain the purpose of each test.

D. Permutations. Lists xs and ys are permutations if and only if they have 
   exactly the same elements—but possibly in different orders. Repeated elements 
   must be accounted for. Write function permutation? which tells if two lists 
   are permutations.
```
   -> (permutation? '(a b c) '(c b a))
   #t
   -> (permutation? '(a b b) '(a a b))     
   #f
   -> (permutation? '(a b c) '(c b a d))
   #f
```
   Each function you define should be accompanied by test cases using 
   check-expect. In comments, explain the purpose of each test.


A. From operational semantics to algebraic laws. This problem has two parts:

   1. The operational semantics for μScheme includes rules for `cons`, `car`, 
      and `cdr`. Assuming that `x` and `xs` are variables and are defined in ρ 
      (rho), use the operational semantics to prove that
```
    (cdr (cons x xs)) == xs
```

   2. Use the operational semantics to prove or disprove the following 
      conjecture: 
   
      if e1 and e2 are arbitrary expressions, in any context where the 
      evaluation of e1 terminates and the evaluation of e2 terminates, the 
      evaluation of `(cdr (cons e1 e2))` terminates, and 
      `(cdr (cons e1 e2)) == e2`. 
   
      The conjecture says that two independent evaluations, starting from the 
      same initial state, produce the same value as a result.

      Related Reading: The operational semantics for `cons`, `car`, and `cdr` 
      can be found on pg 159.
      Or if you prefer, you can use an Impcore-style semantics 
      extended with rules from this [handout](https://www.cs.tufts.edu/comp/105-2017f/handouts/list-opsem.pdf).

# What and how to submit
<a name="submit"/>

Please submit four files:

 * A README.md file containing
   * The names of the people with whom you collaborated (i.e. talked with
     about the assignment, no pair programming for this one, don't share code)

   * A list identifying which problems that you solved

   * The number of hours you worked on the assignment

 * A text file cqs.scheme.txt containing your answers to the 
     reading-comprehension questions (you can start with the provided file)

 * A PDF file theory.pdf containing the solutions to Exercises 1, 31, and A. 
   If you already know LaTeX, by all means use it. Otherwise, write your 
   solution by hand and scan it. Do check with someone else who can confirm 
   that your work is legible—if we cannot read your work, we cannot grade it.

 * A file solution.scm containing the solutions to all the other exercises.

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.

# How your work will be evaluated
<a name="eval"/>

## Programming in μScheme
The criteria we will use to assess the structure and organization of your 
μScheme code, which are described in detail below, are mostly the same as the 
criteria in the general coding rubric, which we used to assess your Impcore 
code. But some additional criteria appear below.

### Code must be well structured

We're looking for functional programs that use Boolean and name bindings 
idiomatically. Case analysis must be kept to a minimum.


#### Exemplary

 * The assignment does not use set, while, print, or begin.

 * Wherever Booleans are called for, code uses Boolean values #t and #f.

 * The code has as little case analysis as possible (i.e., the course staff can 
   see no simple way to eliminate any case analysis)

 * When possible, inner functions use the parameters and let-bound names of 
   outer functions directly.

#### Satisfactory

 * The code contains case analysis that the course staff can see follows from 
   the structure of the data, but that could be simplified away by applying 
   equational reasoning.

 * An inner function is passed, as a parameter, the value of a parameter or 
   let-bound variable of an outer function, which it could have accessed 
   directly.

#### Must Improve

 * Some code uses set, while, print, or begin (No Credit).

 * Code uses integers, like 0 or 1, where Booleans are called for.

 * The code contains superfluous case analysis that is not mandated by the 
   structure of the data.

### Code must be well laid out, with attention to vertical space

In addition to following the layout rules in the general coding rubric (80 
columns, no offside violations), we expect you to use vertical space wisely.

#### Exemplary

 * Code is laid out in a way that makes good use of scarce vertical space. 
   Blank lines are used judiciously to break large blocks of code into groups, 
   each of which can be understood as a unit.

#### Satisfactory

 * Code has a few too many blank lines.

 * Code needs a few more blank lines to break big blocks into smaller chunks 
   that course staff can more easily understand.

#### Must Improve

 * Code wastes scarce vertical space with too many blank lines, block or line 
   comments, or syntactic markers carrying no information.

 * Code preserves vertical space too aggressively, using so few blank lines that 
   a reader suffers from a “wall of text” effect.

 * Code preserves vertical space too aggressively by crowding multiple 
   expressions onto a line using some kind of greedy algorithm, as opposed to a 
   layout that communicates the syntactic structure of the code.

 * In some parts of code, every single line of code is separated form its 
   neighbor by a blank line, throwing away half of the vertical space (serious 
   fault).

### Code must load without errors

Ideally you want to pass all of our correctness tests, but at minimum, your own 
code must load and pass its own unit tests.

#### Exemplary

 * Your μScheme code loads without errors.

 * Your code passes all the tests we can devise.

 * Or, your code passes all tests but one.

#### Satisfactory

 * Your code fails a few of our stringent tests.

#### Must Improve


### Costs of list tests must be appropriate

Be sure you can identify a nonempty list in constant time.

#### Exemplary

 * Empty lists are distinguished from non-empty lists in constant time.

#### Satisfactory

None here.

#### Must Improve

 * Distinguishing an empty list from a non-empty list might take longer than 
   constant time.

### Your proofs

The proofs for this homework are different from the derivations and 
metatheoretic proofs from the operational-semantics homework, and different 
criteria apply.

#### Exemplary

 * Course staff find proofs short, clear, and convincing.

 * Proofs have exactly as much case analysis as is needed (which could mean no  
   case analysis)

 * Proofs by induction explicitly say what data is inducted over and clearly 
   identify the induction hypothesis.

 * Each calculational proof is laid out as shown in the textbook, with each term 
   on one line, and every equals sign between two terms has a comment that 
   explains why the two terms are equal.

#### Satisfactory

Course staff find a proof clear and convincing, but a bit long.

 * Or, course staff have to work a bit too hard to understand a proof.

 * A proof has a case analysis which is complete but could be eliminated.

 * A proof by induction doesn’t say explicitly what data is inducted over, but 
   course staff can figure it out.

 * A proof by induction is not explicit about what the induction hypothesis is, 
   but course staff can figure it out.

 * Each calculational proof is laid out as shown in the textbook, with each term 
   on one line, and most of the the equals signs between terms have comments 
   that explain why the two terms are equal.

#### Must Improve

Course staff don't understand a proof or aren't convinced by it.

 * A proof has an incomplete case analysis: not all cases are covered.

 * In a proof by induction, course staff cannot figure out what data is 
   inducted over.

 * In a proof by induction, course staff cannot figure out what the induction 
   hypothesis is.

 * A calculational proof is laid out correctly, but few of the equalities are 
   explained.

 * A calculational proof is called for, but course staff cannot recognize its 
   structure as being the same structure shown in the book.
