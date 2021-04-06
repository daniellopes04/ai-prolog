parent(pam,bob).
parent(tom,bob).
parent(tom,liz).
parent(bob,ann).
parent(bob,pat).
parent(pat,jim).
parent(pat,sarah).
parent(john,jim).
parent(john,sarah).
female(pam).
female(liz).
female(ann).
female(pat).
female(sarah).
male(tom).
male(bob).
male(jim).
male(john).
father(X,Y) :- male(X), parent(X,Y).
mother(X,Y) :- female(X), parent(X,Y).

irmaos(X,Y) :-
	father(Z1,X),
	father(Z1,Y),
	mother(Z2,X),
	mother(Z2,Y).
