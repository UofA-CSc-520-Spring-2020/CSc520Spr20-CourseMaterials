# Type Inference

April 8, 2020

## Announcements

 * HW7 is due today
 
 * HW8 is due a week from today


## Last Time

* Polymorphic type systems (TypedUScheme)

* Generic type representations

* Kinds for classifying types

## Today

Type Inference


# Key Ideas for Type inference

* Fresh type variables represent unknown types.

* Example: In `(lambda (x) (+ x 3))`, assign `x` fresh type variable α
  Constraints record knowledge about type variables.

* Example: α ≡ int


# Let's do an example on the "board"

```
(val-rec twotimes (lambda (x) (+ x x)))
```

What do we know?

* `twotimes` has type `'a1`

* `x` has type `'a2`

* `+` has type `int * int -> int`

* `(+ x x)` is an application, what does it require?

  * `'a2 = int` and `'a2 = int`

* Is this possible?

Key idea: Record the constraint in a typing judgement.

```
'a2 = int /\ 'a2 = int, { twotimes : 'a1, x : 'a2 } |- (+ x x) : int
```

General form of typing judgement:

```
C, Gamma |- e : tau
```

which is pronounced "Assuming the constraints in C are true, in environment 
Gamma, expression e has type tau."

# Inferring polymorphic types

```
(val app2 = (lambda (f x y)
               (begin
                   (f x)
                   (f y))))
```

Assume f : 'a_f

Assume x : 'a_x

Assume y : 'a_y

```
f x implies 'a_f = 'a_x -> 'a1

f y implies 'a_f = 'a_y -> 'a2
```

Together, these constraints imply `'a_x = 'a_y and 'a1 = 'a2`

`begin` implies result of function is `'a2`

So, app2 : `('a_x -> 'a1) * 'a_x * 'a_x -> 'a1`

'a_x and 'a aren’t mentioned anywhere else in program, so

we can generalize to:

```
forall 'a_x, 'a1 . ('a_x -> 'a1) * 'a_x * 'a_x -> 'a1
```

which is the same thing as:

```
forall 'a, 'b . ('a -> 'b) * 'a * 'a -> 'b
```


# Exercise: Give the type of cc

```
let val cc = (lambda (nss) (car (car nss)))

Assume nss : 'b

We know car : forall 'a . 'a list -> 'a

=> car_1 : 'a1 list -> 'a1

=> car_2 : 'a2 list -> 'a2

(car_1 nss) => 'b  = 'a1 list

(car_2 (car_1 nss)) => 'a1 = 'a2 list

(car_2 (car_1 nss)) : 'a2

nss : 'b : 'a1 list : ('a2 list) list

So, cc : ('a2 list) list -> 'a2
```

Because `'a2` is unconstrained, we can generalize:

```
cc : forall 'a . ('a2 list) list -> 'a
```


Answer: Give the type of cc

```
let val cc = (lambda (nss) (car (car nss)))

forall 'a . 'a list list -> 'a
```

# Formalizing Type Inference and Instantiation

* Formalizing type inference

* Moving from type schemes to types (Instantiation)

* Moving from types to type schemes (Generalization)


# Formalizing Type Inference

Sad news: Type inference for polymorphism is undecidable.

Solution: Each formal parameter has a monomorphic type.

Consequences:
* Polymorphic functions are not first class.

* The argument to a higher-order function cannot be polymorphic

* `forall` appears only outermost in types

<hr>
<img src="16-type-inference/stratified-HM.png" alt="stratified-HM" />
<hr>



## Representing Hindley-Milner types

```
datatype ty
  = TYVAR  of name        
  | TYCON  of name        
  | CONAPP of ty * ty list

datatype type_scheme
  = FORALL of name list * ty
```

<hr>
<img src="16-type-inference/key-ideas.png" alt="key-ideas" />
<hr>

<hr>
<img src="16-type-inference/defs-n-uses.png" alt="defs-n-uses" />
<hr>

<hr>
<img src="16-type-inference/type-infer-alg.png" alt="type-infer-alg" />
<hr>

<hr>
<img src="16-type-inference/apply-rule.png" alt="apply-rule" />
<hr>


<hr>
<img src="16-type-inference/begin-rule-exercise.png" alt="begin-rule-exercise" />
<hr>

<hr>
<img src="16-type-inference/begin-rule-answer.png" alt="begin-rule-answer" />
<hr>

# What you know and can do now

## Your skills so far

You can complete `typeof`

* Takes e and Γ, returns τ and C

* (Except for let forms.)

Next up: solving constraints!

# Solving Constraints

## Representing Constraints

```
datatype con = ~   of ty  * ty
             | /\  of con * con
             | TRIVIAL
infix 4 ~
infix 3 /\
```

Question: What does a solution to a set of constraints look like?

Answer: A substitution/mapping from types variables to types: θ.

<hr>
<img src="16-type-inference/solve-constraints.png" alt="solve-constraints" />
<hr>

## Examples

Which have solutions?

1. `int        ~ bool`
2. `int list   ~ bool list`
3. `'a         ~ int`
4. `'a         ~ int list`
5. `'a         ~ int -> int`
6. `'a         ~ 'a`
7. `'a * int   ~ bool * 'b`
8. `'a * int   ~ bool -> 'b`
9. `'a         ~ ('a, int)`
10. `'a        ~ tau`        (arbitrary tau)


## Solutions for Examples

Which have solutions?

1. `int        ~ bool`    No
2. `int list   ~ bool list`   No
3. `'a         ~ int         'a |-> int`
4. `'a         ~ int list    'a |-> int list`
5. `'a         ~ int -> int  'a |-> int -> int`
6. `'a         ~ 'a          'a |-> 'a`
7. `'a * int   ~ bool * 'b   'a |-> bool and 'b |-> int`
8. `'a * int   ~ bool -> 'b`  No
9. `'a         ~ ('a, int)`   No
10. `'a        ~ tau`         depends if 'a in free-vars(tau)


<hr>
<img src="16-type-inference/substitute.png" alt="substitute" />
<hr>



<hr>
<img src="16-type-inference/constraint-satisfied.png" alt="constraint-satisfied" />
<hr>

Question: in solving `tau1 ~ tau2`, how many potential cases are there to 
consider?

Question: how are you going to handle each case?

<hr>
<img src="16-type-inference/solving-conjunctions.png" alt="solving-conjunctions" />
<hr>

# What you know and can do after this lecture


After this lecture, you can write solve, a function which, given a constraint C, 
has one of three outcomes:

* Returns the identity substitution in the case where C is trivially satisfied

* Returns a non-trivial substitution if C is satisfiable otherwise.

* Calls unsatisfiableEquality in when C cannot be satisfied

You can also write a type inferencer ty for everything except let forms. (Coming 
Monday)

