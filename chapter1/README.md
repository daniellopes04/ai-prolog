# 1 - An overview of Prolog

This chapter reviews basic mechanisms of Prolog through an example program. Altough the treatment is largely informal many important concepts are introduced.

## 1.1 - An example program: defining family relations

### Exercises 

#### 1.1 Assuming the parent relation as defined in this section, what will be Prolog's answers to the followuing questions?

(a) `?- parent(jim, X).`

```
false.
```

(b) `?- parent(X, jim).`

```
X = pat.
```

(c) `?- parent(pam, X), parent(X, pat).`

```
X = bob.
```

(d) `?- parent(pam, X), parent(X, Y), parent(Y, jim).`

```
X = bob,
Y = pat.
```

#### 1.2 Formulate in Prolog the following questions about the parent relation:

(a) Whos is Pat's parent?

```
?- parent(X, pat).
X = bob.
```

(b) Does Liz have a child?

```
?- parent(liz, X).
false.
```

(c) Whos is Pat's grandparent?

```
?- parent(X, pat), parent(Y, X).
X = bob,
Y = pam ;
X = bob,
Y = tom.
```

## 1.2 - Extending the example program by rules

### Exercises 

#### 1.3 Translate the following statements into Prolog rules:

(a) Everybody who has a child is happy (introduce a one-argument relation **happy**).

```
happy(X) :-
    parent(X, Y).
```

(b) For all X, if X has a child who has a sister then X has two children (introduce new relation **hastwochildren**).

```
hastwochildren(X) :-
    parent(X, Y),
    sister(Y, Z).
```

#### 1.4 Define the relation grandchild using the parent relation. Hint: It will be similar to the grandparent relation.

```
grandchild(X, Z) :-
    parent(Z, Y),
    parent(Y, X).
```

#### 1.5 Define the relation aunt(X, Y) in terms of the relations parent and sister.

```
aunt(X, Z) :-
    parent(Y, Z),
    sister(X, Y).
```
## 1.3 - A recursive rule definition

### Exercises 

#### 1.6 Consider the following alternative definition of the predecessor relation:

```
predecessor(X,Z) :-
    parent(X,Z).

predecessor(X,Z) :-
    parent(X,Z),
    predecessor(X,Y).
```

Does this also seem to be a proper definition of predecessors? Can you modify the diagram of Figure 1.7 so that it would correspond to this new definition?

A: No, because it only considers the first parent relation between X and Z. This means that everytime the predecessor relation is called recursively, it will return again the first parent relation between X and some Y. 

This can be shown when we use this definition to search for the sucessors of pam.

```
?- predecessor(pam, X).
X = bob ;
X = bob ;
X = bob ;
X = bob ;
X = bob ;
X = bob .
```

Therefore, the diagram could not be modified to correspond to this new definition.

## 1.4 - How Prolog answers questions

### Exercises

#### 1.7 