% Retorna o n-esimo elemento da sequencia de Fibonacci

fibo(1,0).
fibo(2,1).

fibo(N,S) :- 
    	N > 2,
	F1 is N-1,
	F2 is N-2,
	fibo(F1,S1),
	fibo(F2,S2),
	S is S1 + S2.
