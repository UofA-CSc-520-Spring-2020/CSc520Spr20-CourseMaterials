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

1. Receivers, arguments, and messages. Read the first seven pages of chapter 10, through section 10.1.3. Now examine these expressions from the definition of class Tikzpicture, which should be below Figure 10.3 on page 808:

(div: w 2)
(drawOn: shape self)
(do: shapes [block (shape) (drawOn: shape self)])
In each expression, please identify the receiver, the argument, and the message:

In (div: w 2),

The receiver is …
The argument is …
The message is …
In (drawOn: shape self),

The receiver is …
The argument is …
The message is …
In (do: shapes [block (shape) (drawOn: shape self)]),

The receiver is …
The argument is …
The message is …
Colons in method names. Continuing with the analysis of Tikzpicture, in both the protocol and the implementation, method add: has one colon in the name, method draw has no colons in the name, and the method drawEllipseAt:width:height: has three colons in the name.

What, if anything, does the number of colons have to do with receivers?

Your answer: …

What, if anything, does the number of colons have to do with arguments?

Your answer: …

If you need to, review the presentation in section 10.1.1 on “Objects and Messages,” which shows messages sent to shapes.

Class protocols and instance protocols. Every message is part of some protocol. As example messages, study the transcript in code chunks 803e and 804, which puts three shapes into a picture and then draws the picture.

Of the messages used in the transcript, which ones are part of the class protocol for Tikzpicture, and which are part of the instance protocol?

In general, what do you do with messages in a class protocol, and how does that differ from what you do with messages in an instance protocol?

Dynamic dispatch, part I: a toy class. For the mechanisms of message send and dynamic dispatch, read section 10.3.4, which starts on page 820. Using the class definitions in that section, message m1 is sent to an object of class C. What method definitions are dispatched to, in what order?

Please edit this answer to put in the correct methods and classes:

Dispatch to method m1 on class ?
Dispatch to method ? on class ? …
Dynamic dispatch, part II: number classes. Study the implementation of class Number, which starts around page 881. Now study the implementation of class Fraction, which starts around page 885.

When message - (minus) is sent to the Fraction (/ 1 2) with argument Fraction (/ 1 3), the computation dispatches message to instance methods of classes Fraction, Number, and SmallInteger, as well as a class method of class Fraction. We are interested in only some of those dispatches—ones that meet both of these criteria:

The message is sent from a method defined on class Fraction or class Number.

The message is received by an instance of class Fraction or class Number.

These criteria rule out class methods of class Fraction, messages sent to SmallInteger, and so on.

Starting with message - (minus) is sent to an instance of Fraction, please identify only the interesting dispatches:

Message   Sent from method     Sent to object      Method defined
          defined on class     of class            on class

-          (anywhere)          Fraction            Number
?         Number               ?                   ?
 ... complete the rest of this table ...
Dynamic dispatch, part III: messages to self and super. Now study the class method new defined on class List, which appears just after page 875. The definition sends message new to super. (Keep in mind: because new is a class method, both super and self stand for the class, not for any instance.)

When class method new is executed, what three messages are sent by the method body, in what order? (If you like, you can also study the message trace shown above, but it may be simpler just to look at the source code.)

What does each of the three message sends accomplish?

If we change new’s definition so instead of (new super) it says (new self), which of the following scenarios best describes how the changed program behaves?

The new message will be dispatched to class List. The same method will run again, and the computation will not terminate.

The new message will be dispatched to a different class, and the reply to the new message will leave the sentinel pointing to the wrong value.

Nothing will change; in this example, there’s no difference between (new super) and (new self).

Your answer: The best description is scenario number ?

Design of the numeric classes. Read about coercion in section 10.4.6 on page 839. Look at the last part of the instance protocol for Number on page 838. Explain the roles of the methods asInteger, asFraction, asFloat, and coerce:. If you are unsure, look at the implementations of these methods on class Integer, starting on page 883.

The role of asInteger is …

The role of asFraction is …

The role of asFloat is …

The role of coerce: is …

You are ready to implement mixed arithmetic, with coercions, in exercise 44.

Abstract classes in principle. In section 10.11.1, which starts on page 929 (“Key words and phrases”), you will find a short definition of “abstract class.” What is the purpose of an abstract class? Pick one of the responses below.

To hide the representation of instances so programmers can change internal details without affecting client code

To define methods that other classes inherit, so that subclasses get useful default methods

The same as the purpose of a regular class: to define an abstraction

Your answer: …

Abstract classes in practice: magnitudes and numbers. Your natural-number class will inherit from abstract class Magnitude, and your big-integer code will inherit from Magnitude and from Number, which is also an abstract class.

Study the implementation of class Magnitude; it is the first dozen lines of code in section 10.7.6, which starts on page 881. List all the methods that are “subclass responsibility”:

Your answer: ...
These are methods that you must implement in both your Natural class and your large-integer classes.

The very next class definition is the definition of abstract class Number. Read the first code chunk and again, list all the methods that are “subclass responsibility”:

Your answer: ...
These are the methods that you must implement in your large-integer classes. (Two of them, + and *, must also be implemented in class Natural.)

You are getting ready to implement large integers.

Double Dispatch. Read section 10.7.5, which starts on page 880. And read the section “laws for multiple dispatch” in the 7th lesson on program design (“Program Design with Objects”). Now, of the methods on class Number listed in the previous question, list each one that needs to know either of the following facts about its argument (not its receiver):

Whether the argument is large or small
If the argument is large, whether it is “positive” or “negative”
For example, + is such a method.

Please list all such methods here:

Your answer: + …

The methods in part (a) are exactly the ones that require double dispatch. The implementation of each such method sends a message to its argument, and the exact message depends on the class of the receiver.

Assume that the receiver is a LargePositiveInteger. Please say, for each method in part (a), what message the method implementation sends to the argument.

Your answer:

Method + sends addLargePositiveIntegerTo: to the argument
…



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

