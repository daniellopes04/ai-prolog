union([],[],[]).

union(L1,[],L1).

union(L1,[X|L2],L3) :-
    member(X,L1),
    union(L1,L2,L3).

union(L1,[X|L2],[X|L3]) :-
    \+(member(X,L1)),
    union(L1,L2,L3).
