% Primeiro calculamos o numero F(n) de Fibonacci

fibonacci(0,0) :- !.
fibonacci(1,1) :- !.

fibonacci(N,S) :- 
    N > 1,
	F1 is N-1,
	F2 is N-2,
	fibonacci(F1,S1),
	fibonacci(F2,S2),
	S is S1 + S2.

% O n-esimo elemento de fibonnaci = F(n-1)

fibo(N,S) :-
    fibonacci(N-1,S).
