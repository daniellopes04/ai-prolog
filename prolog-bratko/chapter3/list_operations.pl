% List operations

% Checks if X is member of list L
member(X,[X|_]).
member(X,[_|L]) :-
    member(X,L).

% Concatenate two lists L1 and L2
append([],L,L).
append([X|L1],L2,[X|L3]) :-
    append(L1,L2,L3).

% Checks if X is member of list L using append
member1(X,L) :-
    append(_,[X|_],L).

% Delete the last three elements of L
deleteLast3(L,R) :-
    append(R,[_,_,_],L).

% Delete the first three elements of L
deleteFirst3(L,R) :-
    append([_,_,_],R,L).

% Delete the first and last three elements of L
deleteFirstLast3(L,R) :-
    deleteFirst3(L,R1),
    deleteLast3(R1,R).

% Checks if X is last member of L using append
last(X,L) :-
    append(_,[X],L).

% Checks if X is last member of L
last2(X,[X]).

last2(X,[_|L]) :-
    last2(X,L).

% Adds a new element in front of the list
add(X,L,[X|L]).

% Deletes an item X from a list
del(X,[X|Tail],Tail).

del(X,[Y|Tail],[Y|Tail1]) :-
    del(X,Tail,Tail1).

% Inserts an item at any place in the list
insert(X,List,BiggerList) :-
    del(X,BiggerList,List).

% Checks if X is member of List using del
member2(X,List) :-
    del(X,List,_).

% Checks if S is a sublist of L
sublist(S,L) :-
    append(_,L2,L),
    append(S,_,L2).

% Generates permutations of a given list
permutation([],[]).

permutation([X|L],P) :-
    permutation(L,L1),
    insert(X,L1,P).

permutation2([],[]).

permutation2(L,[X|P]) :-
    del(X,L,L1),
    permutation2(L1,P).

% Checks if list lenght is even
evenlength([]).

evenlength([_|L]) :-
    oddlength(L).

% Checks if list lenght is odd
oddlength([_|L]) :-
    evenlength(L).

% Reverses a given list L into a reversed list RL
reverse([X|L],RL) :-
    permutation([L|X],RL).
