% Returns a list L with all the multiples of 4 that are less than or equal a given number X >= 0

% Case 0: 0 is multiple of every natural number
multiples4(0,[0]).

% Case 1: The number X is multiple of 4
% In this case, we add X to the list if X % 4 = 0
% We check then if X-1 is multiple of 4
multiples4(X,[X|Tail]) :-
    R is X mod 4,
    R = 0,
    X1 is X-1,
    X1 > 0,                 % Make sure that X1 don't go past 0 into negative
    multiples4(X1,Tail).

% Case 2: The number X is not multiple of 4
% Then, we just proceed to X-1
multiples4(X,L) :-
    R is X mod 4,
    R > 0,
    X1 is X-1,
    multiples4(X1,L).
