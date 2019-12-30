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
| Office Hours  | TBD                                           |
| Web page      | http://www.cs.arizona.edu/~mstrout            |
| Course web page (Piazza) | https://piazza.com/arizona/spring2020/csc520/home |
| Course github | https://github.com/UofA-CSc-520-Spring-2020   |
| D2L           | http://d2l.arizona.edu for grades             |
| Gradescope    | www.gradescope.com to submit all assignments  |


## Course Format and Teaching Methods

FIXME

The course will consist of instructor and student-led discussions of research papers.  Students will also do a semester-long research project.  The course will also include writing reviews for each of the papers read and presenting papers to the class. This course does not involve a textbook or any exams, but there will be reading quizzes.

## Course Objectives

CSc 520 will be building two sets of skills:
* programming skills that exploit the best of the best programming-language features
* mathematical reasoning about code, which helps you communicate, specify what programs 
  do, evaluate claims about languages like security claims.


## Expected Learning Outcomes

FIXME

Identify and summarize the research problem, context, proposed approach, evaluation, and limitations in research papers.
Organize and plan the execution of a research project.
Effectively communicate the problem being solved, context, proposed approach, evaluation, and limitations of their own research project.
Provide constructive suggestions to others in the course about their research projects.

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
UofA bookstore.

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
| [Project: in-class talk](#project)| Thurs April 29 | present course concepts relevant to a paper |
| [Final, in class](#exam)    | Tues May 12, 3:30-5:30pm | cumulative test for semester      |


### Piazza Participation
<a name="piazza"/>

Discussion on piazza is required.  Each week, I expect to see at least two 
posts a week per student with at least one each from the following categories:

* An answer to an exercise in the book or an exercise you make up or find 
  that is NOT also a homework problem.  Feel free to check with me before
  starting to work on such a post, because repeats of the same question
  from different students will not count.  First come, first serve.

* Ask a substantive question (not one that is already answered in the syllabus),
  attempt to answer someone else's substantive question, provide constructive
  feedback to someone else's exercise answer (unique feedback, no repetition
  of feedback that others post), or any other substantive post.

You may post anonymous to the class.  Piazza is setup so I will be able to
see who posted even if they class cannot.

There will be 30 points for this in D2L (two points per week).  You will
start the semester with 0 points and then at the end of each week I will 
grade posts.  This is going to make your grade look scary at the beginning
of the semester, but your grade will improve as more assignments and exams
are posted into D2L and you have earned more participation points.

If you do not see the number of points you expected to receive, then feel
free to send me a private piazza post asking about it or come to office hours.

### Homeworks

* Expect to spend 1-2 hours per day for a whole week for each assignment.

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

* FIXME

### Project
<a name="project"/>

FIXME

### Midterm and Final
<a name="exam"/>

FIXME

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
| 4: Feb 10 and 12        | motivating papers; let and lambda v1   | Friday Feb 14, propose two possible PL papers to explain at end of semester |
| 5: Feb 17 and 19        | Prof. Sethi on lambda calculus?; let and lambda part 2 | Consider starting HW10 this week, but nothing is due. |
| 6: Feb 24 and 26        | higher-order functions and continuations | Friday Feb 28, HW4, hof          |
| 7: March 2 and 4        | scheme semantics and ML intro          | Friday March 5, HW5, continuations |
| Spring Break: March 9-13|                                        |                                    |
| 8: March 16 and 18      | Review; Midterm                        |                                    |
| 9: March 23 and 25      | programming with constructed data and types | Friday March 27, HW6, ML prog, uScheme |
| 10: March 30 and April 1| types and type checking                | Friday April 3, HW7, type checking |
| 11: April 6 and 8       | type inference                         | Friday April 9, HW8, type inference|
| 12: April 13 and 15     | object orientation                     | Friday April 17, HW9, usmalltalk   |
| 13: April 20 and 22     | lambda calculus                        | Friday April 24, HW10, lambda calc |
| 14: April 27 and 29     | app of concepts in PL papers from start; project talks |                    |   	
| 15: May 4 and 6         | project talks; Review                  |                                    |      
| Final: Tuesday May 12th 3:30-5:30 |                              |                                    |


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

