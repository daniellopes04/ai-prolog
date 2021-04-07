# 2 - Syntax and meaning of Prolog programs

This chapter gives a systematic treatment of the syntaz and semantics of basic concepts of Prolog, and introduces structured data objects. Most of the topics included have already been reviewed in Chapter 1. Here the treatment will become more formal and detailed.

## Exercises 

### 2.1 Which of the following are syntactically correct Prolog objects? What kinds of object are they (atom, number, variable, structure)?

1. Diana: *Correct. This is a variable.*
2. diana: *Correct. This is an atom.*
3. 'Diana': *Correct. This is an atom.*
4. _diana: *Correct. This is a variable.*
5. 'Diana goes south': *Correct. This is an atom.*
6. goes(diana,south): *Correct. This is a structure.*
7. 45: *Correct. This is a number.*
8. 5(X,Y): *Incorrect. Functors can't start with numbers.*
9. +(north,west): *Correct. This is a structure.*
10. three(Black(Cats)): *Incorrect. We can define "three" as functor, but "Black" would be a variable.*

### 2.2 Suggest a representation for rectangles, squares and circles as structured Prolog objects. Use an approach similar to that in Figure 2.4. For example, a rectangle can be represented by four points (or maybe three points only). Write some example terms that represent some concrete objects of these types using the suggested representation.

```prolog
rectangle(point(X, Y), point(X, Y1), point(X1, Y), point(X1, Y1)).

square(point(X, Y), point(X, Y1), point(X1, Y), point(X1, Y1)) :-
    rectangle(point(X, Y), point(X, Y1), point(X1, Y), point(X1, Y1)),
    H is (X1 - X),
    V is (Y1 - Y),
    H = V.

circle(center(X, X), radius(X, Y)).
```


### 2.3 Will the following matching operations succeed or fail? If they succeed, what are the resulting instantiations of variables?

(a) `point(A,B) = point(1,2)`

```prolog
A = 1,
B = 2.
```

(b) `point(A,B) = point(X,Y,Z)`

```prolog
false.
```

(c) `plus(2,2) = 4`

```prolog
false.
```

(d) `+(2,D) = +(E,2)`

```prolog
D = E, E = 2.
```

(e) `triangle(point(-1,0),P2,P3) = triangle(P1,point(1,0),point(0,Y))`
    The resulting instantiation defines a family of triangles. How would you describe this family?

```prolog
P2 = point(1, 0),
P3 = point(0, Y),
P1 = point(-1, 0).
```

*This defines the family of triangles that has the segment [-1,1] on the x-axis as base and height defined in the y-axis.*

### 2.4 Using the representation for line segments as described in this section, write a term that represents any vertical line segment at x = 5.

```prolog
vertical(seg(point(5, Y), P)).
```

### 2.5 Assume that a rectangle is represented by the term rectangle(P1,P2,P3,P4) where the P's are the vertices of the rectangle positively ordered. Define the relation regular(R) which is true if R is a rectangle whose sides are vertical and horizontal.

```prolog
regular(rectangle(Point1, Point2, Point3, Point4)) :-
    vertical(seg(Point1, Point2)),
    vertical(seg(Point3, Point4)),
    horizontal(seg(Point2, Point3)),
    horizontal(seg(Point1, Point4)).
```

### 2.6 Consider the following program:

```prolog
f(1,one).
f(s(1),two).
f(s(s(1)),three).
f(s(s(s(X))),N) :-
    f(X,N).
```

How will Prolog answer the following questions? Whenever several answers are possible, give at least two.

(a) `?- f(s(1),A).`

```prolog
A = two.
```

(b) `?- f(s(s((1)),two).` 

```prolog
false.
```

(c) `?- f(s(s(s(s(s(s(1))))),C).`

```prolog
C = one.
```

(d) `?- f(D,three).`

```prolog
D = s(s(1)) ;
D = s(s(s(s(s(1))))) ;
D = s(s(s(s(s(s(s(s(1)))))))) ;
D = s(s(s(s(s(s(s(s(s(s(...)))))))))) ;
D = s(s(s(s(s(s(s(s(s(s(...)))))))))) ;
D = s(s(s(s(s(s(s(s(s(s(...)))))))))) ;
D = s(s(s(s(s(s(s(s(s(s(...)))))))))) ;
D = s(s(s(s(s(s(s(s(s(s(...)))))))))) ;
D = s(s(s(s(s(s(s(s(s(s(...)))))))))) ;
D = s(s(s(s(s(s(s(s(s(s(...)))))))))) ;
D = s(s(s(s(s(s(s(s(s(s(...)))))))))) .
```

### 2.7 the following program says that two people are relatives if

(a) one is a predecessor of the other, or
(b) they have a common predecessor, or
(c) they have a common successor:

```prolog
relatives(X,Y) :-
    predecessor(X,Y).

relatives(X,Y) :-
    predecessor(Y,X).

relatives(X,Y) :-       % X and Y have a common predecessor
    predecessor(Z,X),
    predecessor(Z,Y).

relatives(X,Y) :-       % X and Y have a common successor
    predecessor(X,Z),
    predecessor(Y,Z).
```

Can you shorten this program by using the semicolon notation?

```prolog
relatives(X, Y) :-
    predecessor(X, Y);
    predecessor(Y, X);

    predecessor(Z, X),  % X and Y have a common predecessor
    predecessor(Z, Y);
    
    predecessor(X, Z),  % X and Y have a common successor
    predecessor(Y, Z).
```

### 2.8 Rewrite the following program without using the semicolon notation.

```prolog
translate(Number,Word) :-
    Number = 1, Word = one;
    Number = 2, Word = two;
    Number = 3, Word = three.
```

```prolog
translate(1, one).
translate(2, two).
translate(3, three).
```

### 2.9 Consider the program in Figure 2.10 and simulate, in the style of Figure 2.10, Prolog's execution of the question:

```prolog
?- big(X), dark(X).
```

1. Initial goal list: big(X), dark(X).
2. Scan the program for a clause that matches big(X). `big(bear).` found.
   This clause has no body, so the goal list shrinks to `dark(X).`.
3. Scan the program by the goal dark(X). Clause `dark(Z) :- black(Z).` found.
   Replace the goal by the body of the clause found: black(X).
4. Scan the program for the goal black(bear). No clause found. Backtracks to step (3).
5. Scan the program by the goal dark(X). Clause `dark(Z) :- brown(Z).` found.
   Replace the goal by the body of the clause found: brown(X).
6. Scan the program by the goal brown(bear). Clause 4 found. It has no body so the goal list shrinks to empty. This indicates successful termination, and the corresponding variable instantiation is: X = bear.

Compare your execution trace with that of Figure 2.10 when the question was essentially the same, but with the goals in the order:

```prolog
?- dark(X), big(X).
```

In which of the two cases does Prolog have to do more work before the answer is found?

*In both cases Prolog has to do the same amount of work, the only difference being the order of the steps done.*

### 2.10  What happens if we ask Prolog:

```prolog
?- X = f(X).
```

Should this request for matching succeed or fail? According to the definition of unification in logic this should fail, but what happens according to our definition of matching in Section 2.2? Try to explain why many Prolog implementations answer the question above with:

```prolog
X = f(f(f(f(f(f(f(f(f(f(f(f(f(f( ...
```

*The request succeeds, and ir returns X = f(X). This because Prolog will instantiate the variable X with a structure of itself.*
