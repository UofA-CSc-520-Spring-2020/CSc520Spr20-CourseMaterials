# Polymorphic Type Checking

April 6, 2020

## Announcements

 * HW7 is due Wednesday


## Last Time

* What is type soundness?

* Formation, Introduction, and Elimination Rules

* Type checking with type constructors

## Today

Polymorphic type systems (TypedUScheme)
Generic type representations
Kinds for classifying types

<hr>
<img src="14-type-constructors/type-soundness.png" alt="type-soundness" />
<hr>

Limitations of monomorphic type systems
Monomorphic types are limiting

Each new type constructor requires

Special syntax
New type rules
New internal representation (type formation)
New code in type checker (intro, elim)
New or revised proof of soundness
Slide 2 

Notes:

Implementing arrays on homework
Writing rules for lists on homework
Monomorphism hurts programmers too

Monomorphism leads to code duplication

User-defined functions are monomorphic:

(define int lengthI ([xs : (list int)])
   (if (null? xs) 0 (+ 1 (lengthI (cdr xs)))))
(define int lengthB ([xs : (list bool)])
   (if (null? xs) 0 (+ 1 (lengthB (cdr xs)))))
(define int lengthS ([xs : (list sym)])
   (if (null? xs) 0 (+ 1 (lengthS (cdr xs)))))
Quantified types
Slide 4 

Type formation via kinds
``’’???

Back up here—what types do we have?

Type formation: Composing types

Typed Impcore:

Closed world (no new types)

Simple formation rules

Standard ML:

Open world (programmers create new types)

How are types formed (from other types)?

Can’t add new syntactic forms and new type formation rules for every new type.

Slide 7 

Slide 8 

Slide 9 

Well-formed types

We still need to classify type expressions into:

types that classify terms (e.g., int)

type constructors that build types (e.g., list)

nonsense that means nothing (e.g., int int)

Idea: kinds classify types

one-off type-formation rules

Δ tracks type constructors, vars

Polymorphic Type Checking
Quantified types
Slide 11 

Representing quantified types

Two new alternatives for tyex:

datatype tyex
  = TYCON  of name
  | CONAPP of tyex * tyex list
  | FUNTY  of tyex list * tyex
  | TYVAR  of name
  | FORALL of name list * tyex
Slide 13 

Programming with quantified types

Substitute for quantified variables

-> length                                                                          
<procedure> : (forall ('a) ((list 'a) -> int))                                     
-> (@ length int)                                                                  
<procedure> : ((list int) -> int)                                                  
-> (length '(1 2 3))
type error: function is polymorphic; instantiate before applying
-> ((@ length int) '(1 2 3))
3 : int
Substitute what you like

-> length
 : (forall ('a) ((list 'a) -> int))
-> (@ length bool)
 : ((list bool) -> int)
-> ((@ length bool) '(#t #f))
2 : int
More ``Instantiations’’

-> (val length-int (@ length int))                                                 
length-int : ((list int) -> int)                                                   
-> (val cons-bool (@ cons bool))
cons-bool : ((bool (list bool)) ->
                                (list bool))
-> (val cdr-sym (@ cdr sym))
cdr-sym : ((list sym) -> (list sym))
-> (val empty-int (@ '() int))
() : (list int)
Bonus instantiation:

-> map
<procedure> :
  (forall ('a 'b)
    (('a -> 'b) (list 'a) -> (list 'b)))
-> (@ map int bool)
<procedure> :
  ((int -> bool) (list int) -> (list bool))
Create your own!

Abstract over unknown type using type-lambda

  -> (val id (type-lambda ['a]
                (lambda ([x : 'a]) x )))
  id : (forall ('a) ('a -> 'a))
'a is type parameter (an unknown type)

This feature is parametric polymorphism

Two forms of abstraction:

Power comes at notational cost

Function composition

-> (val o (type-lambda ['a 'b 'c]
    (lambda ([f : ('b -> 'c)]
             [g : ('a -> 'b)])
     (lambda ([x : 'a]) (f (g x))))))

o : (forall ('a 'b 'c)
       (('b -> 'c) ('a -> 'b) -> ('a -> 'c)))
Aka o :

Type rules for polymorphism
Slide 19 

Slide 20 

A phase distinction embodied in code


-> (val x 3)
3 : int
-> (val y (+ x x))
6 : int

fun processDef (d, (delta, gamma, rho)) =
  let val (gamma', tystring)  = elabdef (d, gamma, delta)
      val (rho',   valstring) = evaldef (d, rho)
      val _ = print (valstring ^ " : " ^ tystring)
  in  (delta, gamma', rho')
  end
Slide 22 

Type formation through kinds
Slide 23 

Slide 24 

Slide 25 

Slide 26 

Slide 27 

Bonus content: a definition manipulates three environments
Slide 28 

Slide 29 

Slide 30 

