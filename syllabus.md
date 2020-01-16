# Syllabus for CSc 520: Principles of Programming Languages

Gould-Simpson 701, Mondays and Wednesdays 3:30-4:45pm
	
## Description of Course

This course will define, analyze, and evaluate important concepts found in current 
programming languages. Its goals are to build an ability to evaluate and compare 
programming languages, both from the user's and implementor's view, and to develop 
precise mechanisms for specifying the semantics of programming languages.

This course is with permission closely based on CS 105 developed and taught at 
Tufts by Norman Ramsey (https://www.cs.tufts.edu/comp/105-2019s/index.html) and 
Kathleen Fisher (https://www.cs.tufts.edu/comp/105-2017f/index.html).
They have compiled a set of experiences that students who successfully took
the course have shared (https://www.cs.tufts.edu/comp/105-2019s/a-student-tips.pdf) 
that I recommend you read through.

## Course Prerequisites

Prerequisite skills for this course include
* at least three semesters of programming experience,
  * (have implemented some of the basic data structures
     and algorithms such as stacks, queues, lists, tables,
     standard sorting,
  * some experience programming in C or C++),

* a discrete math course
  * (induction,
  * propositional and predicate calculi, eg. forall and exists, 
  * and set theory),

* and basic unix skills
  * (basics of files and directories,
  * creating and editing files,
  * compiling and loading programs,
  * and using make).

Suggested prerequisites for this course include an undergraduate programming 
languages course like CSc 372, a compilers course like 453, and an 
undergraduate algorithms or theory course.

## Instructor and Contact Information

| Instructor    | Prof. Michelle Strout, mstrout@cs.arizona.edu |
| ------------- | --------------------------------------------- |
| Office        | 707 Gould-Simpson                             |
| Office Hours  | Mondays 10:30-11:30am, Wednesdays 5-6pm       |
| Web page      | http://www.cs.arizona.edu/~mstrout            |
| Course web page (Piazza) | https://piazza.com/arizona/spring2020/csc520/home |
| Course github | https://github.com/UofA-CSc-520-Spring-2020   |
| D2L           | http://d2l.arizona.edu for grades             |
| Gradescope    | www.gradescope.com to submit all assignments  |


## Course Format and Teaching Methods

The course will have two active-learning class periods a week.  This means
that we will be doing problems in class with other students.  The solutions
discussed in class will not be in the provided class notes, but you are
welcome to share class notes with the other students in the class.  This 
is assuming that you attend each class period (see attendance below).

The collaboration will extend into interactions on piazza.  Piazza posts
are 10% of the total grade in CSc 520.

The course also has two exams: a midterm and a final.  Each of these is
worth 20% of the course grade for a combined weight of 40%.

Recommendations for a successful CSc 520 (and grad school) experience
* Go to class. Using a pen, pencil, or stylus, take notes.  (See the
  section below on [taking notes](#notes)).

* Read the homework IMMEDIATELY after you finish the previous homework.
  Bring questions to class.

* Don’t try to read the whole textbook all at once. To guide your reading,
  use the comprehension questions and other recommendations on the homework. 

* Look at the homework problems as soon as they come out.
  Think about them a little bit every day.
  
* Talk about the homework problems with your friends and classmates.

* Join and/or start a study group or group(s).

* Take advantage of office hours.  Getting to know CS professors in
  graduate courses and letting them learn about you is an excellent
  way to learn about possible internship or job opportunities and/or
  research opportunities.  Additionally, for Ph.D. students you can
  ask us for that 5th semester reference letter if we know more about
  what research you are doing and what your interests are.

* Read the handouts that describe experiences of top students
  in past classes and the instructor’s tips [FIXME: not posted yet].
  
* Build a "520-free zone" into your weekly schedule. Honor the zone 
  even if you get behind, so that at least once a week you are sure 
  to get a break from 520. (Because a homework is due every week, 
  there are no structural breaks built into the course.)
  
* Again, finally, and most important, do not allow yourself to
  become socially, emotionally, or intellectually isolated.

## Course Objectives

This course introduces you —through extensive practice— to
programming-language ideas and techniques that are found everywhere 
in today’s programming languages. These ideas and techniques will 
continue to be found among the programming languages of the future. 
Foremost among these ideas are functions, types, and objects. CSc520 
also introduces you to the mathematical foundations needed to talk 
precisely about languages and about programs: abstract syntax, 
formal semantics, type systems, and lambda calculus.

To provide a sane and sensible context in which to learn,
CSc 520 immerses you in case studies, conducted using tiny
languages that are designed to help you learn. In any given case
study, you may act as a practitioner (by writing code in a language), 
as an implementor (by working on an interpreter for the
language), as a designer (by inventing semantics for a related
language), or as a scholar (by proving mathematical properties of
the language).

CSc 520 develops high-level, flexible programming skills that
you can transfer. For example, you will find you can apply
your skills to projects written in older languages such as Perl
or Java, in currently popular languages such as Python, Ruby,
Scala, and Swift, and in interesting languages that might be important
in the future, such as Rust, Agda, Coq, and who knows what
else. No matter what language you work in, when you finish
CSc 520, you’ll be writing more powerful programs using less code.
In a profession where complexity is the enemy, your 520 skills
will equip you to tackle the most demanding jobs—and succeed.


## Expected Learning Outcomes

CSc 520 will be building two sets of skills:
* programming skills that exploit the best of the best programming-language features
* mathematical reasoning about code, which helps you communicate, specify what programs 
  do, evaluate claims about languages like security claims.


The programming skills contribute to your professional practice,
and the math contributes to several outcomes:
* Math helps you communicate clearly about languages, language design, and language features.
* Math is an ideal way to specify what programs do: it’s
  clearer and more precise than informal English, and it’s
  cleaner and more streamlined than a reference implementation.
* Experience with programming-language math will help you
  evaluate future claims about languages (for example, claims
  about security).

Here are some of the detailed skills you will develop:
* Read and write precise specifications of how languages work
* Understand how it is possible to prove universal truths that
  apply to any program written in a given language
* Write and reason about recursive functions
* Capture common patterns of recursion in higher-order functions
* Recognize and exploit common higher-order list-processing functions
* Program with first-class functions as data
* Prove correctness of code-improving transformations
* Express rich control structures using functions as continuations
* Design and implement polymorphic functions, methods, and data structures
* Understand the merits of polymorphism in programming
* Use types to guide the construction of code
* Understand in detail what are the merits of type checking
  and how type checking works, including polymorphic type checking
* Understand in detail what are the merits of type inference
  and how type inference works, including polymorphic type inference
* Describe computations using the lambda calculus
* Hide information using abstract data types, modules, and interfaces
* Hide information using objects and protocols
* Reuse code using inheritance

## Absence and Class Participation Policy

The UA’s policy concerning Class Attendance, Participation, and Administrative Drops 
is available at http://catalog.arizona.edu/policy/class-attendance-participation-and-administrative-drop  
The UA policy regarding absences for any sincerely held religious belief, observance 
or practice will be accommodated where reasonable: http://policy.arizona.edu/human-resources/religious-accommodation-policy.
Absences preapproved by the UA Dean of Students (or dean’s designee) will be honored. 
See https://deanofstudents.arizona.edu/absences  

Participating in the course and attending lectures and other course events are vital 
to the learning process. As such, attendance is required at all class meetings. Absences 
may affect a student’s final course grade. If you anticipate being absent, are unexpectedly 
absent, or are unable to participate in class online activities, please contact me as soon 
as possible.  To request a disability-related accommodation to this attendance policy, please 
contact the Disability Resource Center at (520) 621-3268 or drc-info@email.arizona.edu. If you 
are experiencing unexpected barriers to your success in your courses, the Dean of Students 
Office is a central support resource for all students and may be helpful. The Dean of Students 
Office is located in the Robert L. Nugent Building, room 100, or call 520-621-7057.

We will be covering the difficult concepts in class in a collaborative environment.  If you are 
going to miss any course sessions, please let me know ahead of time so we can discuss.  You can 
also talk to the graduate coordinator in our department, Chelsea Skotnicki, if attending CSc 520 
becomes problematic.

## Makeup Policy for Students Who Register Late

Students who register late, must do each of the missed homework assignments, in order, as quickly
as possible.  No discussion with other students in the course about the assignments will be 
permitted until the student is working on the same assignment as the other students.  Upon late 
registration, the student will have at most four days per missed assignment.  Coordinate with the 
instructor if you register late by attending the first possible office hour and/or setting up a meeting
time with the instructor.

## Course Communications

* Course grades will be kept in D2L (http://d2l.arizona.edu).
* Course announcements and required discussions will be done via Piazza 
  (https://piazza.com/arizona/fall2019/csc620).
* Class notes and homework assignment writeups will be on github
  (https://github.com/UofA-CSc-520-Spring-2020).
* Submissions and grading feedback will be provided on Gradescope (www.gradescope.com).

## Required Texts or Readings

You absolutely, positively have to have the book *Programming Languages: Build, Prove, 
and Compare* by Norman Ramsey and its associated supplement.  You can buy the book in the 
UofA bookstore as two sets of class notes.

## Assignments: Schedule/Due Dates

| Assignment                  | Due Date       | Description                                 |
| --------------------------- | -------------- | ------------------------------------------- |
| [Piazza participation](#piazza) | **each week**  | at least two posts a week (details below)   |
| [HW1 impcore](HomeworkWriteups/hw1-impcore-writeup.md) | **Fri Jan 24** | reading; programming in impcore PL          |
| HW2 opsem                   | Fri Jan 30     | reading; modifying impcore interpreter      |
| HW3 uScheme                 | Fri Feb 6      | reading; programming in uScheme             |
| [Project: proposal](#project) | Fri Feb 14   | propose two possible PL papers to present   |
| HW4 hof                     | Fri Feb 28     | reading; higher-order functions             |
| HW5 continulations          | Fri March 5    | reading; continuations                      |
| [Midterm, in class](#exam)  | Thurs March 18 | cumulative test on concepts covered to date |
| HW6 ML programming          | Fri March 27   | reading; programming in ML                  |
| HW7 typesys                 | Fri April 3    | reading; type checking                      |
| HW8 ml-inf                  | Fri April 9    | reading; type inference                     |
| HW9 usmall                  | Fri April 17   | reading; programming in usmalltalk          |
| HW10 lambda                 | Fri April 24   | reading; lambda calculus                    |
| [Project: in-class talk with slides](#project)| Wednesday April 28 | slides for presenting course concepts relevant to a paper |
| [Final, in room 701](#exam)    | Tues May 12, 3:30-5:30pm | cumulative test for semester      |


### Piazza Participation
<a name="piazza"/>

Discussion on piazza is required.  Each week, I expect to see at least two 
posts a week per student with at least one each from the following categories:

* An answer to an exercise that was either posted on piazza by the instructor,
  an exercise you make up, or an exercise from the book that is NOT also a 
  homework problem.  Feel free to check with me before starting to work on 
  such a post, because repeating the same answer for the same question will 
  not count.  First come, first serve.

* Ask a substantive question (not one that is already answered in the syllabus),
  attempt to answer someone else's substantive question, provide constructive
  feedback to someone else's exercise answer (unique feedback, no repetition
  of feedback that others post), or any other substantive post.

You may post anonymous to the class.  Piazza is setup so I will be able to
see who posted even if the class cannot.

There will be 30 points for this in D2L (two points per week).  You will
start the semester with 0 points and then at the end of each week I will 
grade posts.  This is going to make your grade look scary at the beginning
of the semester, but your grade will improve as more assignments and exams
are posted into D2L and you have earned more participation points.

If you do not see the number of points you expected to receive, then feel
free to send me a private piazza post asking about it and/or come to office hours.

Extra Credit: If you find a typo or other mistake in the syllabus, course notes, 
or homework writeups, you can send a private piazza post to the instructor.
If you are the first person to find a particular mistake, then you will earn
1 piazza participation point.  Over the semester you can earn up to 5 piazza 
participation points for finding mistakes in the posted material.

### Homeworks

In this class, you will learn most of the material as you complete
the homework assignments. The importance of homework is
reflected in the weight it is assigned. Most homework for this
course involves short programming assignments. Many of them
are based on the text by Ramsey. There are also some larger
programming assignments. And there is some theory homework,
involving more proving and less programming.

The homework has a significant theory component. You will prove theorems 
using existing theory, and you will also develop new theory of your own, 
which will describe how a language feature might work. Early assignments are 
either “mostly programming” or “mostly theory;” later assignments mix programming 
and theory; and some assignments ask you to apply theory to write code.

* Expect to spend 1-2 hours per day for a whole week for each assignment.

* As in most classes, it helps to start the homework early. But
  in this course, starting early seems to produce unusually good benefits.
  Many students report that if they start early, even if they don’t
  appear to make much progress, a solution will "come to them"
  while they are doing something else.

* Early in the course, homework is structured as a large collection of small 
  problems. When the going is most difficult, this structure makes your progress 
  visible, even when progress is incremental.

* Every homework begins with some comprehension questions about the reading. 
  These questions guide you toward reading those parts of the book that are 
  most valuable for completing the homework. The comprehension questions
  focus your attention on the most relevant parts of the very long book.
  Comprehension questions are short, and if you understand
  the reading, you should be able to answer all the questions in
  just a few minutes. To achieve that understanding, however,
  substantial reading may be required.

* All of the homeworks will be referring to the [coding style](coding-style.md)
  and [coding rubric](coding-rubric.md) documents.  They spell out how your
  homeworks will be graded.
  
* Any homework question can be posted publically to Piazza,
  *unless* that homework question contains code, an inference
  rule, or another part of the solution. Any question that
  discloses your work must be posted privately to the instructor.
  
* If needed, you have 7 days to request a regrade in Gradescope.
  
* Working with other people.

  * *Discussions with classmates.* Programming is a creative
    process. To help you think creatively, understand what the
    homework problems are asking, and discover paths to solutions, 
    I encourage you to discuss the questions with friends
    and colleagues. You will do much better in the course, and
    at UofA, if you find people with whom you regularly discuss
    problems.  Once you reach the coding stage, however, discussions 
    are no longer appropriate. Each program, unless explicitly 
    assigned as a pair problem, must be entirely your own work.
     **In each assignment README.md, always acknowledge those with 
     whom you discuss problems!**
  
  * *Use Piazza!*  Post solutions to example problems that are not in the 
    homeworks, ask questions, and answer questions that others post.
    **Only post homework code or proof questions in private to the instructor**.
   
  * In CSc, there are some pair programming opportunities.  These
    are never an obligation.  You are not required to work in pairs.
    If you do choose to work in a pair—which I recommend—
    know the following:
   * That no single pair may work together on more than three assignments.
   * When work is being done on the program, both partners are present at 
     the computer. One partner holds the keyboard; the other watches the 
     screen. Both partners talk, and the keyboard should change hands occasionally.
   * You submit a single program under both your names. That
     work gets one grade, which you both receive.
   * It is never acceptable to divide an assignment into parts and have 
     some parts done by one partner and other parts done by the other. 
     Submitting work done by someone else as your own will be considered 
     an egregious violation of academic integrity. Submitting individual 
     work as the product of pair programming is also a violation of academic 
     integrity.
   * If you need help finding a partner, advertise on Piazza.
  
* Each homework writeup will indicate which files to submit.  When a pdf file is
  needed, you can use latex (a useful skill to learn in grad school anyway) and/or
  use [the Gradescope documentation on how to generate a pdf]
  (https://www.gradescope.com/help#help-center-item-student-scanning).
  
* *Too MUCH collaboration.*
  Interactions and discussions with classmates must take place in
  natural language, at a high level. You must not discuss code, and
  you must not exchange pseudocode, or other information that is
  expressed at the level of code. If you start communicating in code
  or at the level of code, you’re breaking the rules.

  * While I encourage shared work at the whiteboard or in notebooks,
    if your shared work is so detailed or low-level that
    there is only one reasonable translation into code, you are
    collaborating too closely.
    
  * Unless you are working with another student as part of a
    programming pair, *it is not acceptable to permit that student
    to see any part of your program, and it is not acceptable
    to permit yourself to see any part of that other student’s
    program*. In particular, you may not test or debug another
    student’s code, nor may you have another student test or
    debug your code. (If you can’t get code to work, consult
    the instructor.) Using another's code in any form
    or writing code for use by another violates the University’s
    academic regulations.
  
  * Do not, under any circumstances, post a question to Piazza
    that contains any part of your code. Such questions should
    be posted privately to the instructor.
    
  * Do not, under any circumstances, submit code you have found on
    the internet.
  
  * Feel free to use any code in the book and supplement.
    
  Suspected violations will be reported to the Dean of Students.
  Be careful! As described in the university’s academic-integrity
  policy, the penalties for violation can be severe. 
  The same standards apply to all homework assignments; work
  you submit under your name must be entirely your own work.
  **Always acknowledge those with whom you discuss problems!**
  
 * Code in a github repository is visible to other students. So,
   you may not post your code to a github repository—unless you
  are very careful to make the repository private. It is certainly
  convenient to use github for backup and to share your work with
  potential employers. But it must be private. It is against course
  policy for you to put your homework in a public github repository
  as it can be considered a violation of academic integrity because
  it facilitates misbehavior by others.

### Project
<a name="project"/>

For the project this semester, you will be explaining portions of a
research paper that rely on theoretical concepts we learn in this 
course such as operational semantics, proofs about program behavior,
type checking, and/or lambda calculus.  You can and are encouraged to
do this project with a partner.  See [project.md](project.md) for more details 
about the project.


### Midterm and Final
<a name="exam"/>

The questions on the exams will be similar to those covered in class, 
done in the homeworks, and those posted on piazza.  It will be important 
to practice similar problems, preferrably with a study group, while studying 
for the midterm and the final.

The midterm is a 75-minute in-class exam. It is a closed-book
exam, but you may take with you one standard US letter page of
notes written on both sides. I strongly encourage you to create
such page and to write your notes by hand; preparing the notes is
a very effective way to study.

The final exam is administered during final-examination period as
part of the usual UofA system of two-hour final exams. As with
the midterm, you may prepare and use one standard US letter
page of notes written on both sides.

### Solutions

I provide solutions to all homework and exam questions. Being
able to examine master solutions helps you learn. But I provide
solutions for your private use only. Please do not share them with
other students, and please make sure they do not find their way
into public places, archives, and so on.

Copying solutions, whether from me or from another student, is a
serious violation of academic integrity. Providing solutions to be
copied is equally serious.  Possible consequences for either violation
include taking a paid course on academic integrity, receiving negative 
points for an assignment, receiving an F in the course, and suspension.


## Grading Scale and Policies

Individual assignment and exam grades and your current course grade will be posted on D2L.  
Feedback and individual assignment and exam grades will be provided on Gradescope.

| Assignment           | Percentage of Course Grade |
| -------------------- | -------------------------- |
| Homework             | 40%                        |
| Project              | 10%                        |
| Midterm              | 20%                        |
| Final                | 20%                        |
| Piazza participation | 10%                        |

The late policy is that assignments will not be accepted after the due date and a
zero will be given.  Submit everything you have managed to do so far on the due
date for partial credit.

Assignments will be graded within one week of the due date.

Requests for incomplete (I) or withdrawal (W) must be made in accordance with 
University policies, which are available at http://catalog.arizona.edu/policy/grades-and-grading-system#incomplete 
and http://catalog.arizona.edu/policy/grades-and-grading-system#Withdrawal, respectively.

## Tactics and Strategies for Being Successful in CSc 520

* Work on the course one to two hours a day outside of class.  I paraphrase Garth Flint:
  "[Talented students] are very resistant to [a systematic,
   thoughtful, slow] approach. They do not want to plan;
   they want to do trial and error at the keyboard. They
   have not learned an important axiom of programming:
   'three hours of trial-and-error coding will save fifteen
   minutes of planning.' (I wish I knew who came up
   with that. They deserve an award.)"

* Read through the the WHOLE homework writeup, before starting the homework.

* Start and/or join a study group.

* Take notes and engage during class.  Try to figure out as much as possible in class.
  Ask questions to help that happen.

## Scheduled Topics/Activities

| Week                    | Topics                                 | Homework Due                       |
| ----------------------- | -------------------------------------- | ---------------------------------- |
| 1a: Jan 15 (short week) | motivating PL papers and intro         |                                    |
| 1b: Jan 22 (short week) | introduction to semantics              | Friday Jan 24, HW1, Impcore        |
| 2: Jan 27 and 29        | semantics, syntactic proofs, metatheory| Friday Jan 30, HW2, adding locals and some proofs |
| 3: Feb 3 and 5          | functional programming and scheme      | Friday Feb 6, HW3, uScheme         |
| February 11, 2020       | Last Day to Admin Drop W/O a W         |                                    |
| 4: Feb 10 and 12        | motivating papers; let and lambda v1   | Friday Feb 14, propose two possible PL papers to explain at end of semester |
| 5: Feb 17 and 19        | Prof. Sethi on lambda calculus; let and lambda part 2 | Consider starting HW10 this week, but nothing is due. |
| 6: Feb 24 and 26        | higher-order functions and continuations | Friday Feb 28, HW4, hof          |
| 7: March 2 and 4        | scheme semantics and ML intro          | Friday March 5, HW5, continuations |
| Spring Break: March 9-13|                                        |                                    |
| 8: March 16 and 18      | Review; Midterm                        |                                    |
| 9: March 23 and 25      | programming with constructed data and types | Friday March 27, HW6, ML prog, uScheme |
| 10: March 30 and April 1| types and type checking                | Friday April 3, HW7, type checking |
| March 31, 2020          | Last Day to Admin Withdrawal           |                                    |
| 11: April 6 and 8       | type inference                         | Friday April 9, HW8, type inference|
| 12: April 13 and 15     | object orientation                     | Friday April 17, HW9, usmalltalk   |
| 13: April 20 and 22     | lambda calculus                        | Friday April 24, HW10, lambda calc |
| 14: April 27 and 29     | app of concepts in PL papers from start; project talks |                    |   	
| 15: May 4 and 6         | project talks; Review                  |                                    |      
| Final: Tuesday May 12th 3:30-5:30 |                              |                                    |

## Taking Notes
<a name="notes"/>

To maximize your own learning, I recommend that you take notes,
sketches, and diagrams by hand. Paper is good, with a pen or
pencil. If you have a large touch screen and can take notes with a
stylus, that works, too. I recommend against using a keyboard
with a standard laptop or word-processing software:

* The neuroscience is quite clear that note-taking with pen
  or pencil activates most of the brain. Note-taking using a
  keyboard activates a much smaller region.

* Word-processing software is not great for note-taking. Your
  notes should be about highlights and connections: good
  notes connect more recent material with material from earlier
  in the lecture; good notes contain diagrams; good notes
  contain arrows and boxes. Good notes are highly non-linear.
  A word processor is designed to produced polished final
  documents, not to take notes. Use the superior tool: pencil
  and paper.

You never need to copy the instructor’s notes or slides; they are
available online. Use your own notes to make connections and
to highlight points that you find difficult or that you want to
remember.

## Department of Computer Science Code of Conduct

The Department of Computer Science is committed to providing and maintaining a supportive 
educational environment for all.  We strive to be welcoming and inclusive, respect privacy 
and confidentiality, behave respectfully and courteously, and practice intellectual honesty.  
Disruptive behaviors (such as physical or emotional harassment, dismissive attitudes, and 
abuse of department resources) will not be tolerated.  The complete Code of Conduct is available 
on our department web site.  We expect that you will adhere to this code, as well as the UA 
Student Code of Conduct, while you are a member of this class.

## Classroom Behavior Policy

To foster a positive learning environment, students and instructors have a shared 
responsibility.  We want a safe, welcoming, and inclusive environment where all of us feel 
comfortable with each other and where we can challenge ourselves to succeed. To that end, 
our focus is on the tasks at hand and not on extraneous activities (e.g., texting, chatting, 
reading a newspaper, making phone calls, web surfing, etc.).

The use of personal electronics such as laptops, iPads, and other such mobile devices is 
distracting to the other students and the instructor. Their use can degrade the learning 
environment. Therefore, students are not permitted to use these devices during the class 
period unless they are specifically taking notes.  Taking notes means students are typing 
down ideas in some text format.  Any web searches will need to be done outside of class.

## Pronoun Preference

All people have the right to be addressed and referred to in accordance with their personal 
identity.  In this class, we will have the chance to indicate the name that we prefer to be 
called and, if we choose, to identify pronouns with which we would like to be addressed. I 
will do my best to address and refer to all students accordingly and support classmates in 
doing so as well.

## My preferred pronouns are she/her/hers.

In a graduate course, students are free to call me “Michelle” instead of "Dr. Strout" or 
"Prof. Strout".  Please respect that all students will pick whichever of these they are 
most comfortable with.

## Threatening Behavior Policy

The UA Threatening Behavior by Students Policy prohibits threats of physical harm to any 
member of the University community, including to oneself. See 
http://policy.arizona.edu/education-and-student-affairs/threatening-behavior-students. 

## Accessibility and Accommodations

The Disability Resources Offices provides guidelines regarding accessibility and 
accommodations:  http://drc.arizona.edu/instructors/syllabus-statement.

## Code of Academic Integrity

Students are encouraged to share intellectual views and discuss freely the principles and 
applications of course materials. However, graded work/exercises must be the product of 
independent effort unless otherwise instructed. Students are expected to adhere to the UA 
Code of Academic Integrity as described in the UA General Catalog. See 
http://deanofstudents.arizona.edu/academic-integrity/students/academic-integrity.

The University Libraries have some excellent tips for avoiding plagiarism, available at 
http://new.library.arizona.edu/research/citing/plagiarism.

Selling class notes and/or other course materials to other students or to a third party 
for resale is not permitted without the instructor’s express written consent. Violations 
to this and other course rules are subject to the Code of Academic Integrity and may result 
in course sanctions. Additionally, students who use D2L or UA e-mail to sell or buy these 
copyrighted materials are subject to Code of Conduct Violations for misuse of student 
e-mail addresses. This conduct may also constitute copyright infringement.

## UA Nondiscrimination and Anti-harassment Policy 

The University is committed to creating and maintaining an environment free of discrimination; 
see http://policy.arizona.edu/human-resources/nondiscrimination-and-anti-harassment-policy

Our classroom is a place where everyone is encouraged to express well-formed opinions and 
their reasons for those opinions. We also want to create a tolerant and open environment 
where such opinions can be expressed without resorting to bullying or discrimination of others.

## Additional Resources for Students 

UA Academic policies and procedures are available at http://catalog.arizona.edu/policies

Student Assistance and Advocacy information is available at 
http://deanofstudents.arizona.edu/student-assistance/students/student-assistance

Confidentiality of Student Records
http://www.registrar.arizona.edu/personal-information/family-educational-rights-and-privacy-act-1974-ferpa?topic=ferpa


## Subject to Change Statement

Information contained in the course syllabus, other than the grade and absence policy, may 
be subject to change with advance notice, as deemed appropriate by the instructor.


The University of Arizona sits on the original homelands of indigenous peoples who have stewarded 
this land since time immemorial. Aligning with the university’s core value of a diverse and 
inclusive community, it is an institutional responsibility to recognize and acknowledge the
people, culture, and history that make up the Wildcat community. At the institutional level, 
it is important to be proactive in broadening awareness throughout campus to ensure our students 
feel represented and valued.

