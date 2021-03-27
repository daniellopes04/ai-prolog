# 2 - Syntax and meaning of Prolog programs

This chapter gives a systematic treatment of the syntaz and semantics of basic concepts of Prolog, and introduces structured data objects. Most of the topics included have already been reviewed in Chapter 1. Here the treatment will become more formal and detailed.

## 2.1 - Data objects

### Exercises 

#### 2.1 Which of the following are syntactically correct Prolog objects? What kinds of object are they (atom, number, variable, structure)?

(a) Diana
(b) diana
(c) 'Diana'
(d) _diana
(e) 'Diana goes south'
(f) goes(diana,south)
(g) 45
(h) 5(X,Y)
(i) +(north,west)
(j) three(Black(Cats))

#### 2.2 Suggest a representation for rectangles, squares and circles as structured Prolog objects. Use an approach similar to that in Figure 2.4. For example, a rectangle can be represented by four points (or maybe three points only). Write some example terms that represent some concrete objects of these types using the suggested representation.


## 2.2 - Matching

### Exercises 

#### 2.3 Will the following matching operations succeed or fail? If they succeed, what are the resulting instantiations of variables?

(a) `point(A,B) = point(1,2)`
(b) `point(A,B) = point(X,Y,Z)`
(c) `plus(2,2) = 4`
(d) `+(2,D) = +(E,2)`
(e) `triangle(point(-1,0),P2,P3) = triangle(P1,point(1,0),point(0,Y))`
    The resulting instantiation defines a family of triangles. How would you describe this family?

#### 2.4 Using the representation for line segments as described in this section, write a term that represents any vertical line segment at x = 5.

#### 2.5 Assume that a rectangle is represented by the term rectangle(P1,P2,P3,P4) where the P's are the vertices of the rectangle positively ordered. Define the relation regular(R) which is true if R is a rectangle whose sides are vertical and horizontal.

## 2.3 - Declarative meaning of Prolog programs

### Exercises

#### 2.6 Consider the following program:

```prolog
f(1,one).
f(s(1),two).
f(s(s(1)),three).
f(s(s(s(X))),N) :-
    f(X,N).
```

How will Prolog answer the following questions? Whenever several answers are possible, give at least two.

(a) `?- f(s(1),A).`
(b) `?- f(s(s((1)),two).` 
(c) `?- f(s(s(s(s(s(s(1))))),C).`
(d) `?- f(D,three).`

#### 2.7 the following program says that two people are relatives if

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

#### 2.8 Rewrite the following program without using the semicolon notation.

```prolog
translate(Number,Word) :-
    Number = 1, Word = one;
    Number = 2, Word = two;
    Number = 3, Word = three.
```

## 2.4 - Procedural meaning

### Exercises

#### 2.9 Consider the program in Figure 2.10 and simulate, in the style of Figure 2.10, Prolog's execution of the question:

```
?- big(X), dark(X).
```

Compare your execution trace with that of Figure 2.10 when the question was essentially the same, but with the goals in the order:

```
?- dark(X), big(X).
```

In which of the two cases does Prolog have to do more work before the answer is found?

