% Given two lists L1 and L2, returns the list L3, where L3 = L2-L1.
% In other words, L3 is composed by all elements of L2 that are not in L1.

% Case 0: The difference of a empty list with any list is a empty list.
difference(_,[],[]).

% Case 1: The head element of list L2 is member of list L1.
% In this case, we won't do anything and just proceed to the tail of L2.
difference(L1,[X|L2],L3) :-
    member(X,L1),
    difference(L1,L2,L3),
    !.

% Case 3: The head element of L2 is not a member of L1.
% In this case, we add it to the final list L3.
difference(L1,[X|L2],[X|L3]) :-
    not(member(X,L1)),
    difference(L1,L2,L3).
