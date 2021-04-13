# 3 - Lists, Operator, Arithmetic

In this chapter we will study a special notation for lists, one of the simplest and most useful structures, and some programs for typical operations on lists. We will also look at simple arithmetic and the operator notation which often improves the readability of programs. Basic Prolog of Chapter 2, extended with these three aditions, becomes a convenient framework for writing interesting programs.

## Exercises 

### 3.1 

#### (a) Write a goal, using conc, to delete the last three elements from a list L producing another list L1. Hint: L is the concatenation of L1 and a three-element list.

```prolog
deleteLast3(L,R) :-
    conc(R,[_,_,_],L).
```

#### (b) Write a sequence of goals to delete the first three elements and the last three elements from a list L producing list L2.

```prolog
deleteFirst3(L,R) :-
    conc([_,_,_],R,L).

deleteFirstLast3(L,R) :-
    deleteFirst3(L,R1),
    deleteLast3(R1,R).
```

### 3.2 Define the relation 

```prolog
last(Item,List)
``` 

### so that Item is the last element of a list List. Write two versions: 

#### (a) using the conc relation. 

```prolog
last(X,L) :-
    conc(_,[X],L).
```

#### (b) without conc.

```prolog
last2(X,[X]).

last2(X,[_|L]) :-
    last2(X,L).
```

### 3.3 Define two predicates 

```prolog
evenlength(List).
oddlength(List).
```

### so they are true if their argument is a list of even or odd length respectively. For example, the list [a,b,c,d] is 'evenlength' and [a,b,c] is 'oddlength'.

### 3.4 Define the relation 

```prolog
reverse(List,ReversedList)
```

### that reverses lists. For example, reverse([a,b,c,d],[d,c,b,a]).

### 3.5 Define the predicate 

```prolog
palindrome(List)
```

### A list is a palindrome if it reads the same in the forward and in the backward direction. For example, [m,a,d,a,m].

### 3.6 Define the relation

```prolog
shift(List1,List2)
```

### so that List2 is List1 'shifted rotationally' by one element to the left. For example,

```prolog
?- shift([1,2,3,4,5],L1),shift(L1,L2).
```

### produces:

```prolog
L1 = [2,3,4,5,1]
L2 = [3,4,5,1,2]
```

### 3.7 Define the relation

```prolog
translate(List1,List2)
```

### to translate a list of numbers between 0 and 9 to a list of the corresponding words. For example:

```prolog
translate([3,5,1,3],[three,five,one,three])
```

### Use the following as an auxiliary relation:

```prolog
means(0,zero).
means(1,one).
means(2,two).
...
```

### 3.8 Define the relation

```prolog
subset(Set,Subset)
```

### where Set and Subset are two lists representing two sets. We would like to be able to use this relation not only to check for the subset relation, but also to generate all possible subsets of a given set. For example:

```prolog
?- subset([a,b,c],S).
S = [a,b,c] ;
S = [b,c] ;
S = [c] ;
S = [] ;
S = [a,c] ;
S = [a] ;
...
```

### 3.9 Define the relation 

```prolog
dividelist(List,List1,List2)
```

### so that the elements of List are partitioned between List1 and List2, and List1 and List2 are approximately the same length. For example, 

```prolog
partition([a,b,c,d,e],[a,c,e],[b,d]).
```

### 3.11 Define the relation 

```prolog
flatten(List,FlatList)
```

### where List can be a list of lists, and FlatList is List 'flattened' so that the elements of List's sublists (or sub-sublists) are reorganized as one plain list. For example:

```prolog
?- flatten([a,b,[c,d],[],[[[e]]],f],L).
L = [a,b,c,d,e,f] .
```
