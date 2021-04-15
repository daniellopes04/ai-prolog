% ------------------------------------------------
% List Operations
% ------------------------------------------------

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

% ------------------------------------------------
% Exercises

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

% Checks if list lenght is even
evenlength([]).

evenlength([_|L]) :-
    oddlength(L).

% Checks if list lenght is odd
oddlength([_|L]) :-
    evenlength(L).

% Reverses a given list L into a reversed list RL
reverse([],[]).

reverse([X|L],RL) :-
    add(X,RL,RL),
    reverse(L,RL).

% Subtracts one list from another
difference([],_,[]).

difference([X|L1],L2,L3) :-		% First case: element of L1 is in L2
    member(X,L2),
    !,
    difference(L1,L2,L3).

difference([X|L1],L2,[X,L3]) :-		% Second case: element of L1 is not in L2
    difference(L1,L2,L3).

% Subtracts one list from another, considering its permutations
difference1(L1,L2,L3) :-			
    difference(L1,L2,L),
    permutation(L,L3).

% Flattens a list so that its sublists are reorganized as one plain list
flatten([Head|Tail],FlatList):-
    flatten(Head,FlatHead),
    flatten(Tail,FlatTail),
	append(FlatHead,FlatTail,FlatList).

flatten([],[]).

flatten(X,[X]).

% Flattens a list so that its sublists are reorganized as one plain list using cut
flatten2([],[]).

flatten2([Head|Tail],FlatList):-
    flatten(Head,FlatHead),
    flatten(Tail,FlatTail),
    !,
	append(FlatHead,FlatTail,FlatList).

% flatten2(X,[X]).

% Returns the sum of the elements in a sublist of a given list
subsum([],0,[]).

subsum([X|L],N,[X|L1]) :-		% First case: element of L is in sublist L1
    N1 is N-X,
    N1 >= 0,
    subsum(L,N1,L1).
    
    
subsum([_|L],N,L1) :-			% Second case: element of L is not in sublist L1
    subsum(L,N,L1).
