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