# Coding Style

Readability of programming assignments
A solution to a problem is of little value if that solution cannot be understood and modified by others. For that reason, your homework will be graded on your explanation of what you are doing as well as your results.

For homeworks that involve small programming problems, most explanations will take the form of documentation for the code you write. Each assignment explains what documentation is expected.
For homeworks that involve a large programming problem or that have a substantial design component, an explanation should appear in a README file that accompanies the assignment.
Appropriate explanations vary with the size of the problem.

For a trivial solution of a few lines of code, it's often best to have no explanation at all. Ideally the names of your functions and their parameters will be all the explanation anyone needs to understand the code.
For a solution of a dozen lines of code, a sentence or two is usually sufficient.
For these kinds of small problems, the best method of explanation is comments in with the source code itself.

For a solution of a hundred lines or more, I would expect several paragraphs of explanation. Here the explanation needs to cover not so much the code itself, but the organization of the code and the plan that produced it.
For larger programs, especially programs that are divided into multiple files, a couple of pages on planning, organization, and so on are appropriate.
For these larger problems, you must describe your thinking at least as well as your code. These kinds of long explanation should be in the README file, not in the code itself. It is as bad to write too much explanation for a simple solution as to write too little explanation for a complex solution.

Good programming style and documentation are essential ingredients in a readable assignment. Good style includes the use of functions, modules, and abstract data types where appropriate. Select algorithms appropriate to the task at hand, and make your code structured and easy to read. Good use and placement of documentation is vital. Lots of comment text is usually a sign of poor documentation. Documentation should focus on high-level issues such as design and organization, data representation, and data invariants. As noted above, even programs that run perfectly will earn low grades if they are badly documented.

Documentation is a deep topic in its own right, which I am not prepared to address here, but here are a few suggestions. Good large-scale documentation should answer such questions as:

What algorithms are used, if any?
Why is the implementation correct?
Why does it terminate?
What are the important invariants, preconditions, and postconditions?
What are the major data structures and their representations?
Large-scale documentation is usually not a good place to list a lot of information about the names of functions and their arguments and other low-level details that are most easily understood in the context of reading the code.

Small-scale documentation (comments in the code) should say

What is the contract of each function? (The contract of a simple function should be evident merely from the name of the function and from the names and types of its arguments and result. The contract of a more complex function may require a comment.)
There's more about contracts below.

What are the arguments of the most significant functions? For example, is a list of edges the list of all edges in the graph or the list of edges not yet visited?
If any code is tricky (e.g., you had trouble getting it right the first time), what are the local invariants? What are the pre- and post-conditions of the procedures? What is the `recursion invariant' (analogous to a loop invariant)?
Please don't use comments to repeat information that is readily available in the code. Here is an example of poor style:

; (example of poor commenting style)
;
;  Function: caar
;  Description: Returns the car of the car of the given element.
;
(define caar (x)
  (car (car x))
)
Everything in the comment is more easily learned just by looking at the code. Here is an example of better style:

; (example of better commenting style)
;
; Visit vertex and every successor of vertex that appears in edges,
; in depth-first order.  Executed for side effects on the global 
; variables output and visited.
; Graph is the complete list of edges in the graph; 
; we use structural recursion on edges.  

(define dfsvisit (vertex edges graph) 
  (if (null? edges) '()
      ( ...  (dfsvisit mumble (cdr edges) graph) ...)))
The comment explains what the function is doing, notes that there is no return value but there are side effects, and explains what the parameters mean. The comment also explains why the function terminates (the key phrase is ``structural recursion''). This comment should be supported by comments on the global variables output and visited, saying what they represent and what the representation invariants are.

Here are two examples of very poor commenting style:

   ++i;   /* Use the prefix autoincrement operator to increase i by one. */

   for (;;) {   /* Infinite loop. */
Requirements for coding style
We emphasize readability and clarity. Work that we find obscure or difficult to read will earn lower grades. Other than that, we do not require any particular coding style. However, whatever coding style you choose must meet these constraints:

Code you submit should be accepted by the appropriate compiler without errors or warnings.
Your code should not wrap when displayed in 80 columns. and it must not contain TAB characters. (Why this stuff matters and how to deal with it.)
All submitted code must obey the offside rule, as explained below.
The offside rule
The offside rule comes into play when a definition, declaration, expression, or statement (which I'll call a construct) has to be split across multiple lines of code. Roughly speaking, it says that when you split a construct, later lines have to be indented with respect to the beginning of the construct. The may never be "outdented" to the left. The rule is based on the start of the construct, not the start of the line.

Here's the rule given more precisely:

Code respects the offside rule if and only if whenever the first token of a construct appears in column i, every other token appears in a column greater than i.
Using Lisp syntax, the rule is very easy to interpret: any token enclosed in parentheses must appear to the right of the opening parenthesis. Here's an example of code that violates the offside rule:

 (define gcd (m n)
     (begin (while (!= (set r (mod m n)) 0)
         (begin
           (set m n)
           (set n r)))
       n))
The problem is with the second begin: it is part of the body of the while loop, so it should appear to the right of the while.

Here is the same function formatted in a way that respects the offside rule:

 (define gcd (m n)
     (begin
       (while (!= (set r (mod m n)) 0)
         (begin
           (set m n)
           (set n r)))
       n))
And here is the some function formatted more compactly. I can't say I like the layout, but it does respect the offside rule:

 (define gcd (m n) (begin
                     (while (!= (set r (mod m n)) 0)
                        (begin (set m n) (set n r)))
                     n))
Here is a C declaration that violates the offside rule:

static Valuelist evallist(Explist el, Valenv globals, Funenv functions, Valenv
                                                                      formals);
The problem is in the declaration of the last parameter: formals appears to the left of the first token, Valenv. This code was created by a computer program that squeezes wide code into 80 columns but may violate the offside rule. A more clever program, or a human being, might format the code like this:

static Valuelist evallist(Explist el, Valenv globals, Funenv functions,
                          Valenv formals);
which respects the offside rule.

What is a contract?
A contract is a form of documentation for functions. A function's contract relates the values of variables and other machine state at exactly two points in time:

The point at which the function is called
The point at which the function returns
Functions that do not refer to global variables or to mutable state on the heap have exceptionally simple contracts. (This simplicity is one reason people like them.)

As an example, a function to compute the greatest common denominator of two natural-number arguments m and n might say simply:

Returns the largest integer that evenly divides both m and n.
Such a contract is so simple that putting this contract in a comment would be considered bad style, because the contract should be evident from the function's name.

Another example of a contract would be for a sort function:

Takes a list of integers ns and returns a new list containing the same elements as the argument list, but in nondecreasing order.
Here, some documentation of the contract is necessary, because the name of the sort function alone does not tell you what the sort order is.

Here is an example of documentation that is not a contract:

The function walks through the tree and at each step checks to see if the node contains a prime number. If not, it checks the left subtree and the right subtree for prime numbers.
There are some signs that something is very wrong:

The documentation says nothing about what the function returns.
The documentation contains a narrative description of an algorithm, i.e., a computation that evolves over multiple points in time.
The algorithm being described is almost impossible to write a contract for. Probably the author intended to implement a different algorithm.
Here is a good contract for a related algorithm:

Takes as argument a binary-search tree full of integers, and returns the smallest prime number in that tree, or if the tree contains no prime number, returns -1.