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

% Checks if list lenght is even
evenlength([]).

evenlength([_|L]) :-
    oddlength(L).

% Checks if list lenght is odd
oddlength([_|L]) :-
    evenlength(L).

% Reverses a given list L into a reversed list RL
reverse([L],L).

reverse([X|L],RL) :-
    reverse(L,Z),
    append(Z,[X],RL).
    
