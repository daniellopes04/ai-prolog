% Given two lists L1 and L2, returns a list L3, where
% L3 is the union of lists L1 and L2.
% The union can't have repeated elements.

% Case 0: The union of a empty list with another empty list is empty.
union([],[],[]).

% Case 1: The head element of list L2 is already on list L1.
% In this case, we can ignore it and move to the tail.
union(L1,[X|Tail2],L3) :-
    member(X,L1),
    union(L1,Tail2,L3).

% Case 2: The head element of L2 is not already on L1.
% In this case, we add to the final list.
union(L1,[X|Tail2],[X|Tail3]) :-
    not(member(X,L1)),
    union(L1,Tail2,Tail3),
    !.

% Case 3: The head element of L1 is a member of its own tail.
% Once we get here, we will have cleared all elements of L2.
% If it is repeated, we ignore it and move to the tail.
union([X|Tail1],[],L3) :-
    member(X,Tail1),
    union(Tail1,[],L3).

% Case 4: The head element of L1 is not a member of its own tail.
% In this case, we add it to the final list.
union([X|Tail1],[],[X|Tail3]) :-
    not(member(X,Tail1)),
    union(Tail1,[],Tail3).
