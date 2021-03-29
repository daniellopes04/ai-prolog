parent(pam,bob).        % Pam is a parent of Bob
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).


predecessor(X,Z) :-     % Rule pr1: X is a direct predecessor of Z
    parent(X,Z).

predecessor(X,Z) :-     % Rule pr2: X is an indirect predecessor of Z
    parent(X,Y),
    predecessor(Y,Z).

/*
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
*/

relatives(X, Y) :-
    predecessor(X, Y);
    predecessor(Y, X);

    predecessor(Z, X),  % X and Y have a common predecessor
    predecessor(Z, Y);
    
    predecessor(X, Z),  % X and Y have a common successor
    predecessor(Y, Z).
