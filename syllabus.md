# Syllabus for CSc 520: Principles of Programming Languages

Gould-Simpson 701, Mondays and Wednesdays 3:30-4:45pm
	
## Description of Course

This course will define, analyze, and evaluate important concepts found in current 
programming languages. Its goals are to build an ability to evaluate and compare 
programming languages, both from the user's and implementor's view, and to develop 
precise mechanisms for specifying the semantics of programming languages.


## Course Prerequisites

Prerequisites for this course include at least three semesters of programming
experience, some experience programming in C, a discrete math course with 
experience doing induction proofs, and experience using a unix command line.

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


Course Format and Teaching Methods
The course will consist of instructor and student-led discussions of research papers.  Students will also do a semester-long research project.  The course will also include writing reviews for each of the papers read and presenting papers to the class. This course does not involve a textbook or any exams, but there will be reading quizzes.

Course Objectives 
Students will learn how to synthesize a number of papers that attempt to solve similar research problems, make comparisons between such papers, and identify remaining limitations that could lead to future research.  Additional research skills students will learn include effectively communicating research verbally and in writing and executing their own, related, semester-long research projects.  For this offering of 620, students will learn what aspects affect the design and implementation of embedded domain specific languages (EDSL) in a number of contexts.  


Expected Learning Outcomes
Identify and summarize the research problem, context, proposed approach, evaluation, and limitations in research papers.
Organize and plan the execution of a research project.
Effectively communicate the problem being solved, context, proposed approach, evaluation, and limitations of their own research project.
Provide constructive suggestions to others in the course about their research projects.

Absence and Class Participation Policy
The UA’s policy concerning Class Attendance, Participation, and Administrative Drops is available at http://catalog.arizona.edu/policy/class-attendance-participation-and-administrative-drop  
The UA policy regarding absences for any sincerely held religious belief, observance or practice will be accommodated where reasonable: http://policy.arizona.edu/human-resources/religious-accommodation-policy.
Absences preapproved by the UA Dean of Students (or dean’s designee) will be honored. See https://deanofstudents.arizona.edu/absences  
Participating in the course and attending lectures and other course events are vital to the learning process. As such, attendance is required at all lectures and discussion section meetings. Absences may affect a student’s final course grade. If you anticipate being absent, are unexpectedly absent, or are unable to participate in class online activities, please contact me as soon as possible.  To request a disability-related accommodation to this attendance policy, please contact the Disability Resource Center at (520) 621-3268 or drc-info@email.arizona.edu. If you are experiencing unexpected barriers to your success in your courses, the Dean of Students Office is a central support resource for all students and may be helpful. The Dean of Students Office is located in the Robert L. Nugent Building, room 100, or call 520-621-7057.
Most of the evaluation in 620 will be based on your participation in class by presenting papers, discussing papers, presenting your research, etc.  If you are going to miss any course sessions, please let me know ahead of time so we can discuss.  You can also talk to the graduate coordinator in our department, Chelsea Skotnicki, if attending 620 becomes problematic.

Makeup Policy for Students Who Register Late
Students who register late, must propose a paper to present and an EDSL to do a tutorial presentation on within 1 week of signing up for the course.

Course Communications
Course grades will be kept in D2L (http://d2l.arizona.edu). All other course communications will be done via Piazza (https://piazza.com/arizona/fall2019/csc620).  Submissions and grading feedback will be provided on Gradescope (www.gradescope.com).

Required Texts or Readings
We will read quite a few research papers this semester.  The actual number of papers and their topics will vary according to the students’ interests and the research projects. Papers will be disseminated via Piazza.  At the beginning of the semester we will read and present two papers per lecture.  Later in the semester we will read fewer papers and spend more time on research projects.  We will probably discuss on the order of 30 papers in class.



Assignments: Schedule/Due Dates

Class Participation
Everyone must read each paper. While you are reading each paper, you should develop at least one question or point relevant for discussion of the paper in class.
Self-Graded Quizzes
The first 5 minutes of each class will be set aside for a quiz about the reading that will be discussed that day.  The quiz will contain 2-3 questions that will help initiate the paper discussion.  There will be a course discussion about the questions and the papers.  The last 5 minutes of class will be students grading their own quiz and submitting it to the instructor for review.  Reviewed quizzes will be handed back to students in Gradescope.
Grading scale
10, Answering the quiz questions was thought provoking, but easy because I read this paper multiple times, took notes, and discussed it with other students in the class BEFORE coming to class.
9, Answering the quiz questions was thought provoking, but pretty easy because I read this paper at least once and took notes on it BEFORE coming to class.
8, Answering the quiz questions was thought provoking, but not difficult because I read this paper at least once BEFORE coming to class.
5, Answering the quiz questions was feasible, but somewhat challenging because I only skimmed this paper before coming to class.
2, I attempted to answer the quiz questions, but I did not read the paper before class so it was challenging.
Written critical paper reviews
Each student will be responsible for writing at most one critical review each week of one of the papers covered that week. You need to turn in on gradescope 7 reviews throughout the semester (only 13 weeks including the first week provide an opportunity to submit a critical review). The review is due before the beginning of the class where we plan to discuss the paper.  The reviews should be one to two pages and succinctly answer the following questions about the paper:
What problem did the paper address? Who is the audience?
Is it important/interesting? What was the context for the paper? Why should the audience care?
What is the approach used to solve the problem?
How does the paper support or otherwise justify the conclusions it reaches?
What problems are explicitly or implicitly left as future research questions?
How does the paper address the questions we are asking about embedded domain-specific languages this semester?

Here is an example review for the LamWolf91 paper that was read in CS553 at one point (pdf, tex, bib).  The detail in the example review is the amount of detail you will need in your review for the paper you present in class. For your other 6 submitted paper reviews, use the same format, but you only need to do ONE of the following:
Place this paper in context of papers we haven't already read in class by actually skimming some of those papers. (In the example, the second paragraph for the second question).
Provide an example to illustrate the approach.
Generate a number of future research questions that were not specified explicitly in the paper.
Provide the authors concrete suggestions for how they can better write their paper.  For example, what are some ways they can bring their punchline into the abstract and introduction, better describe the problem they are solving, etc.

The goal is for graded reviews to be returned to students before the next course period.


EDSL Tutorial Presentation
Each student will select an embedded domain-specific language (EDSL), select a paper that is primarily about that EDSL (paper approval from the instructor is needed), and present some examples of using that EDSL to the class.  These EDSL presentation proposals are due by Friday Sept 6th AOE (Anywhere on Earth), but EDSL assignments will be done on a first-come, first-serve basis so I encourage you to submit your EDSL tutorial proposal early.  The EDSL proposal should include a prioritized list of 3 dates for presenting an EDSL (select from Tuesday Sept 10th, Thursday Sept 12th, Thursday Sept 19th, Thursday Sept 26th, Thursday Oct 3rd, Thursday Oct 10th, Thursday Oct 17th, and Thursday Oct 24th) and a prioritized list of 3 EDSLs you would like to cover along with a corresponding paper for each.  Make sure the paper you are proposing is NOT one of the ones already on the course schedule on piazza.  Do consider looking at http://bit.ly/EDSLsuggestions for ideas.  See the piazza assignments list for an example EDSL proposal.

The EDSL presentation should satisfy and will be graded using the following guidelines:
Your talk should be 15-20 minutes long without interruptions and therefore include only 7-10 slides. Of course you want to encourage discussion, so it will actually end up taking you 75 minutes.
You should give an overview of the EDSL, what domain is it used in and why, how is it implemented (use terminology we have been discussing in class), and describe key programming constructs in the EDSL.
You should show some example programs written in the language that you wrote and show how to run them.  Your presentation slides should include enough information in the slides + notes section for other students in the course to try out the EDSL.  The slides will be posted in piazza on the forum, which is private to the class.
The presentation of the paper about the EDSL should cover the same questions that are expected in paper reviews and paper presentations, but not as long. The focus is on the overview and demonstration of the EDSL.
Tell us what you are going to tell us and why we should care, tell us, and then conclude by summarizing the main points.
Plan a definite purpose for each slide. For each slide be able to answer the question, "Why am I showing the audience this slide?".
Do not put too much information on each slide. Use big fonts.
Make eye contact with your audience.
Do not read your slides.
Speak clearly, project, and practice aloud in advance.


Paper Presentation
Each student will be presenting and leading the discussion for one paper.  See the schedule of papers on piazza and propose your top three preferred papers to present as a text file in gradescope.  These paper presentation proposals are due in Gradescope by Friday Sept 20th AOE (Anywhere on Earth), but paper presentation assignments will be done on a first-come, first-serve basis so consider submitting your proposal early.  See the piazza assignments for a sample paper presentation proposal.

The presentation should satisfy and will be graded according to the following guidelines:
Your talk should be 15-20 minutes long and therefore include only 7-10 slides.
The presentation should cover the same questions that are expected in paper reviews. In other words, the presentation is NOT a summarization of the paper, but instead a review of the paper. Focusing on one aspect of the paper and elaborating that aspect with an example is a good approach.
Tell us what you are going to tell us and why we should care, tell us, and then conclude by summarizing the main points.  Use the punchline method.
Plan a definite purpose for each slide. For each slide be able to answer the question, "Why am I showing the audience this slide?".
Do not put too much information on each slide. Use big fonts.
Make eye contact with your audience.
Do not read your slides.
Speak clearly, project, and practice aloud in advance.

Here is Simon Peyton Jones' site with more information on how to give a good research talk. Here are some example presentations:
Presenting a Survey Paper
Presenting a paper focused on one approach


Final Project

Each student will do an individual semester-long project. The project consists of the following deliverables:
Preliminary project proposal (Due September Friday the 13th AOE, 10 pts). The preliminary project proposal should be one paragraph describing the EDSL you want to study or develop, some specific problems you plan to apply the EDSL to (finding something directly related to your research is strongly encouraged), and some initial ideas for what criteria you plan to use for evaluation of the EDSL.
Written project proposal (3-4 pages, Due Friday October 4th AOE, 20 pts).  The proposal should include a description of the EDSL you have selected to use and analyze (and/or develop) and why. The proposal should also include details about how you plan to evaluate the EDSL (which metrics, machines, etc.), motivation and description of the problem that will be used as the evaluation context, a related work section that has at least five citations, and a detailed timeline for the project.  At the time you write your proposal you should have started doing small EDSL program examples in your target EDSL and have a specific problem you plan to apply it to (e.g., rewriting an existing analysis code or simulation code or ML code in the target EDSL).  The proposal should be no longer than 5 pages of text. Unsatisfactory proposals will be returned to the students for revision. Turning back proposals is a common occurrence. Consider it an opportunity to learn and improve.
Project status “elevator” pitches (5 minutes, in class Thursday October 31st, 10 pts).   Using 2-3 slides and 5 minutes, tell the class about your project.
Project 1-minute lightening videos (1 minute, Will show in class Tuesday November 12th, 10 pts).  Conferences such as PLDI sometimes have authors create a 1 minute video to advertise their paper to attendees.  See https://www.youtube.com/channel/UCsscfaosriyJNqM3aicsnpg for some examples.  Your video should share the main point of your project (the punchline) and be easy for people to follow.  The 1-minute time limit is strict.
Final presentation (20 minutes, in class Dec 3rd, 5th, or 10th, 20 pts, will draw for presentation slots).  Your final presentation should be like a conference paper talk. Look up online suggestions for giving Computer Science conference talks. With the 20 minute time limit, the maximum number of slides is 10 (the title slide does not count).
Final report (6-10 pages using a conference style file, Due Wednesday Dec 11th AOE, 30 pts).  The final report should be in the form of a 6-10 page conference paper (e.g. you could use the ACM or IEEE double-column latex format). As with a conference paper, the final report should describe and motivate the problem, present the approach, and evaluate the approach. Make sure that you answer all of the questions we have been asking about papers in our reviews when you write your own paper.  The aim is to have a paper that could be submitted to a relevant workshop or conference.


Grading Scale and Policies
Grades will be posted on D2L.  Feedback will be provided on Gradescope.
Project, 40%
Critical reviews of papers, 30%
EDSL demonstration and evaluation, 10%
Presenting and leading a discussion on a paper, 10%
Self-graded, reading quizzes, 10%

There late policy is that assignments will not be accepted after the due date.
Assignments will be graded within one week of the due date.
Requests for incomplete (I) or withdrawal (W) must be made in accordance with University policies, which are available at http://catalog.arizona.edu/policy/grades-and-grading-system#incomplete and http://catalog.arizona.edu/policy/grades-and-grading-system#Withdrawal, respectively.

Scheduled Topics/Activities
Week
Events
1: Aug 26-30
Why embedded domain-specific languages? (3-week module)
Intro to EDSLs, and how to write reviews and present papers
Monday Sept 2
Labor Day, University Holiday
2: Sept 3-6
EDSL tutorial presentation; EDSL tutorial proposal due Friday (first come first serve)
3: Sept 9-13
EDSL tutorial presentations; Preliminary project proposals due Friday
4: Sept 16-20
Mechanisms for implementing EDSLs (4-week module)
Intro to EDSL implementation and an EDSL tutorial; Paper presentation proposal due Friday (first come first serve)
Saturday Sept 22
Last day to drop without a W grade
5: Sept 23-27
Paper presentations and EDSL tutorial presentation
6: Sept 30-Oct 4
Paper presentations and EDSL tutorial presentation; Written project proposals due Friday
7: Oct 7-11
Paper presentations and EDSL tutorial presentation
8: Oct 14-18
EDSLs for Machine Learning (2-week module)
Paper presentations and EDSL tutorial presentation
9: Oct 21-25
Paper presentations and EDSL tutorial presentation
10: Oct 28-Nov 1
EDSLs for Simulation (2-week module)
Paper presentations; Project status elevator pitches in class Thurs
Sunday Nov 3
Last day to drop with a W grade
11: Nov 4-8
Paper presentations
Monday Nov 11
Veterans Day, University Holiday
12: Nov 12-15
EDSLs for High Performance Computing/Parallelism (2-week module)
Tuesday 1-minute project videos and paper presentation; Thursday paper presentation
13: Nov 18-22
(SC19) Paper presentations
14: Nov 25-27
Paper presentation; 11/28 Thanksgiving -- no class on Thursday
15: Dec 2-6
Project presentations both days
16: Dec 9-11
Project presentations; class only on Tuesday this week
Wed Dec 11
Project final report due AOE


Department of Computer Science Code of Conduct
The Department of Computer Science is committed to providing and maintaining a supportive educational environment for all.  We strive to be welcoming and inclusive, respect privacy and confidentiality, behave respectfully and courteously, and practice intellectual honesty.  Disruptive behaviors (such as physical or emotional harassment, dismissive attitudes, and abuse of department resources) will not be tolerated.  The complete Code of Conduct is available on our department web site.  We expect that you will adhere to this code, as well as the UA Student Code of Conduct, while you are a member of this class.
Classroom Behavior Policy
To foster a positive learning environment, students and instructors have a shared responsibility. We want a safe, welcoming, and inclusive environment where all of us feel comfortable with each other and where we can challenge ourselves to succeed. To that end, our focus is on the tasks at hand and not on extraneous activities (e.g., texting, chatting, reading a newspaper, making phone calls, web surfing, etc.).
The use of personal electronics such as laptops, iPads, and other such mobile devices is distracting to the other students and the instructor. Their use can degrade the learning environment. Therefore, students are not permitted to use these devices during the class period unless they are specifically taking notes.  Taking notes means students are typing down ideas in some text format.  Any web searches will need to be done outside of class.

Pronoun Preference
All people have the right to be addressed and referred to in accordance with their personal identity. In this class, we will have the chance to indicate the name that we prefer to be called and, if we choose, to identify pronouns with which we would like to be addressed. I will do my best to address and refer to all students accordingly and support classmates in doing so as well.

My preferred pronouns are she/her/hers.

In a graduate course, students are free to call me “Michelle” instead of “Dr. Strout”.  Please respect that all students will pick whichever of these they are most comfortable with.

Threatening Behavior Policy 
The UA Threatening Behavior by Students Policy prohibits threats of physical harm to any member of the University community, including to oneself. See http://policy.arizona.edu/education-and-student-affairs/threatening-behavior-students. 

Accessibility and Accommodations
The Disability Resources Offices provides guidelines regarding accessibility and accommodations:  http://drc.arizona.edu/instructors/syllabus-statement.

Code of Academic Integrity
Students are encouraged to share intellectual views and discuss freely the principles and applications of course materials. However, graded work/exercises must be the product of independent effort unless otherwise instructed. Students are expected to adhere to the UA Code of Academic Integrity as described in the UA General Catalog. See http://deanofstudents.arizona.edu/academic-integrity/students/academic-integrity.
The University Libraries have some excellent tips for avoiding plagiarism, available at http://new.library.arizona.edu/research/citing/plagiarism.
Selling class notes and/or other course materials to other students or to a third party for resale is not permitted without the instructor’s express written consent. Violations to this and other course rules are subject to the Code of Academic Integrity and may result in course sanctions. Additionally, students who use D2L or UA e-mail to sell or buy these copyrighted materials are subject to Code of Conduct Violations for misuse of student e-mail addresses. This conduct may also constitute copyright infringement.

UA Nondiscrimination and Anti-harassment Policy 
The University is committed to creating and maintaining an environment free of discrimination; see http://policy.arizona.edu/human-resources/nondiscrimination-and-anti-harassment-policy
Our classroom is a place where everyone is encouraged to express well-formed opinions and their reasons for those opinions. We also want to create a tolerant and open environment where such opinions can be expressed without resorting to bullying or discrimination of others.

Additional Resources for Students 
UA Academic policies and procedures are available at http://catalog.arizona.edu/policies

Student Assistance and Advocacy information is available at http://deanofstudents.arizona.edu/student-assistance/students/student-assistance

Confidentiality of Student Records
http://www.registrar.arizona.edu/personal-information/family-educational-rights-and-privacy-act-1974-ferpa?topic=ferpa


Subject to Change Statement
Information contained in the course syllabus, other than the grade and absence policy, may be subject to change with advance notice, as deemed appropriate by the instructor.


The University of Arizona sits on the original homelands of indigenous peoples who have stewarded this land since time immemorial. Aligning with the university’s core value of a diverse and inclusive community, it is an institutional responsibility to recognize and acknowledge the people, culture, and history that make up the Wildcat community. At the institutional level, it is important to be proactive in broadening awareness throughout campus to ensure our students feel represented and valued.

