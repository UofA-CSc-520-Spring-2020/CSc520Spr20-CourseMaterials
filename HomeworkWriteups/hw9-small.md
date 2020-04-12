# Object-Oriented Programming in Smalltalk 

CSc 520 Spring 2020 Assignment

* [Overview](#overview)

* [Getting Started](#start)

* [Reading Comprehension (100 percent)](#read)

* [What and how to submit](#submit)


**Due Wednesday, April 22, 2020 at 11:59PM**

This homework is to be done individually.


# Overview
<a name="overview"/>


Object-oriented programming has been popular since the 1990s, and like lambdas, 
object-oriented features are found everywhere. But these features are not always 
easy to tease out: many object-oriented languages, such as Java and C++, are 
hybrids, which mix objects with abstract data types or other notions of 
encapsulation and modularity. When you don't already know how to program with 
objects, hybrid designs are more confusing than helpful. For that reason, we 
study pure objects, as popularized by Smalltalk: even simple algorithms send 
lots of messages back and forth among a cluster of cooperating, communicating 
objects. Popular languages that use similar models include Ruby, JavaScript, and 
Objective C.

This assignment ONLY has reading comprehension questions.

# Getting Started
<a name="start"/>

Although this assignment only involves reading comprehension questions,
it will be educational to experiment with the uSmalltalk interpreter.

## Setup

Accept the github assignment at https://classroom.github.com/a/jxMFzMMf
and do a git clone of your repository.  Make sure to `git commit -a` and
`git push` frequently!


The initial github repository will include the following
files:
 * `README.md`
 * `cqs.small.txt`
 * `build_prove_compare/`

To download an ML interpreter, install Moscow ML from https://mosml.org/.
Then you should have mosml on the command-line.

To run the usmalltalk interpreter, do the following:
```
$ cd build_prove_compare/bare/usmalltalk
$ make
$ ./usmalltalk
```

Dr. Ramsey's version of this assignment at https://www.cs.tufts.edu/comp/105-2019s/homework/small.html
has a Getting to know uSmalltalk interactively section.
This is helpful to read, but note that in the provided interpreter
`(List new)` works, but `(new List)` does not.  Any other inconsistencies
you find, please post on piazza.




# Reading Comprehension (100 percent)
<a name="read"/>

These problems will help guide you through the reading. We recommend 
that you complete them before starting the other problems below. 
There is a `cqs.small.txt` in the starter github repository.

1. *Receivers, arguments, and messages*. Read the first seven pages of Chapter 
   10, through Section 10.1.3. Now examine these expressions from Figures 10.4 
   and 10.6:
```
(w div: 2)
(shape drawOn: self)
(shapes do: [block (shape) (drawOn: shape self)])
```

   In each expression, please identify the receiver, the argument, and the 
   message:

   In `(w div: 2)`,

   * The receiver is …

   * The argument is …
   
   * The message is …

   In `(shape drawOn: self)`,

   * The receiver is …

   * The argument is …

   * The message is …

   In `(shapes do: [block (shape) (drawOn: shape self)])`,

   * The receiver is …

   * The argument is …

   * The message is …


2. *Colons in method names*. Continuing with the analysis of the Picture and 
   TikzCanvas code in Figures 4 and 5, in both the protocol and the 
   implementation, method add: has one colon in the name, method startDrawing 
   has no colons in the name, and the method drawEllipseAt:width:height: has 
   three colons in the name.

  * (a) What, if anything, does the number of colons have to do with receivers?

    Your answer: …

  * (b) What, if anything, does the number of colons have to do with arguments?

    Your answer: …

   If you need to, review the presentation in Section 10.1.1 on "Objects and 
   Messages," which shows messages sent to shapes.

3. *Class protocols and instance protocols*. Every message is part of some 
   protocol. As example messages, study the transcript in code chunks 698c and 
   698d, which puts three shapes into a picture and then draws the picture.

  * (a) Of the messages used in the transcript, which ones are part of the class 
    protocol for Picture or TikzCanvas, and which are part of the instance 
    protocol?

  * (b) In general, what do you do with messages in a class protocol, and how 
    does that differ from what you do with messages in an instance protocol?

4. *Dynamic dispatch, part I: a toy class*. For the mechanisms of message send 
   and dynamic dispatch, read Section 10.3.4. Using the class definitions in 
   that section, message `m1` is sent to an object of class `C`. What method 
   definitions are dispatched to, in what order?

   Please edit this answer to put in the correct methods and classes:

  * Dispatch to method `m1` on class ??

  * Dispatch to method ?? on class ?? …

5. *Dynamic dispatch, part II*: messages to `self` and `super`. Now study the 
   class method `new` defined on class `List`, which appears on page 752. The 
   definition sends message `new` to `super`. (Keep in mind: because `new` is a 
   class method, both `super` and `self` stand for the class, not for any 
   instance.)

  * (a) When class method `new` is executed, what three messages are sent by the 
    method body, in what order?

  * (b) What do each of the three message sends accomplish?

  * (c) If we change `new`s definition so instead of `(new super)` it says 
    `(new self)`, which of the following scenarios best describes how the 
    changed program behaves?

   * 5.c.1 The `new` message will be dispatched to class `List`. The same method 
     will run again, and the computation will not terminate.

   * 5.c.2 The `new` message will be dispatched to a different class, and the 
     reply to the `new` message will leave the sentinel pointing to the wrong 
     value.

   * 5.c.3 Nothing will change; in this example, there's no difference between 
     `(new super)` and `(new self)`.

   Your answer: The best description is scenario number ??

6. *Design of the numeric classes*. Read about coercion in Section 10.5.7 on 
   page 755. Look at the last part of the instance protocol for Number on page 
   738. Explain the roles of the methods `asInteger`, `asFraction`, `asFloat`, 
   and `coerce:`. If you are unsure, look at the implementations of these 
   methods on class `Integer` on page 757.

   * The role of `asInteger` is …

   * The role of `asFraction` is …

   * The role of `asFloat` is …

   * The role of `coerce:` is …


7. *Abstract classes in principle*. In Section 10.1-.1, ("Key words and 
   phrases"), you will find a short definition of "abstract class." What is the 
   purpose of an abstract class? Pick one of the responses below.

  * (a) To hide the representation of instances so programmers can change 
    internal details without affecting client code

  * (b) To define methods that other classes inherit, so that subclasses get 
    useful default methods

  * (c) The same as the purpose of a regular class: to define an abstraction

   Your answer: …

8. *Abstract classes in practice*: magnitudes and numbers. A natural-number 
   class would inherit from abstract class `Magnitude`, and a big-integer class 
   would inherit from `Magnitude` and from `Number`, which is also an abstract 
   class.

   Study the implementation of class `Magnitude` on page 744. List all the 
   methods that are "subclass responsibility":

   Your answer: ...

   These are methods that would need to be implemented in both a Natural class 
   and a large-integer classes.


9. *Double Dispatch*. Read section 10.5.9. And read the section "laws for 
  multiple dispatch" in the 7th lesson on program design ("Program Design with 
  Objects").  [NOTE: The version of seven lessons has a swapped order of the 
  receiver and the message name.]
  
  Rewrite the 10 "laws of dispatch" on page with the receiver first and the 
  message second.


# What and how to submit
<a name="submit"/>

Please submit two files:

 * `README.md` file with who you talked with about the assignment, who your 
   partner was if you had one,  and how many hours you spent on the assignment.

 * A text file `cqs.small.txt` containing your answers to the 
   reading-comprehension questions (you can start with the provided file)

As soon as you have the files listed above, submit preliminary versions of your 
work to gradescope. Keep submitting until your work is complete; we grade only 
the last submission.

