parent(pam,bob).        % Pam is a parent of Bob
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).

female(pam).            % Pam is female
female(liz).
female(pat).
female(ann).
male(tom).              % Tom is male
male(bob).
male(jim).

offspring(Y,X) :-       % Y is an offspring of X if
    parent(X,Y).        % X is a parent of Y

mother(X,Y) :-          % X is the mother of Y if
    parent(X,Y),        % X is parent of Y and
    female(X).          % X is female

grandparent(X,Z) :-     % X is a grandparent of Z if
    parent(X,Y),        % X is parent of Y and
    parent(Y,Z).        % Y is a parent of Z

sister(X,Y) :-          % X is a sister of Y if
    parent(Z,X),
    parent(Z,Y),        % X and Y have the same parent and
    female(X),          % X is female and
    different(X,Y).     % X and Y are different

grandchild(X,Z) :-      % X is a grandchild of Z if
    parent(Z,Y),        % Z is parent of Y and
    parent(Y,X).        % Y is parent of X

aunt(X,Z) :-            % X is a aunt of Z if
    parent(Y,Z),        % Y is parent of Z and
    sister(X,Y).        % X and Y are sisters

hastwochildren(X) :-    % X has two children if
    parent(X,Y),        % X is parent of Y and
    sister(Y,Z).        % Y has a sister

happy(X) :-             % X is happy if
    parent(X,Y).        % X is a parent

predecessor(X,Z) :-     % Rule pr1: X is a direct predecessor of Z
    parent(X,Z).

predecessor(X,Z) :-     % Rule pr2: X is an indirect predecessor of Z
    parent(X,Y),
    predecessor(Y,Z).
