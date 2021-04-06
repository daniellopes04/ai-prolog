% Dado um numero n, retorna a soma dos numero de 0 a n

soma(0,0).			% Caso mais simples é 0

soma(X,S) :- 			% Se X>0, S = X+(X-1)+..+1+0
	X>0,			% Nao estamos no caso mais simples
 	Y is X-1,		% Decrementamos X
	soma(Y,Z),		% Calculamos Z = (X-1)+(X-2)+..+1+0
				% E assim por diante, ate o caso mais simples
	S is X+Z.		% S = X+(X-1)+..+1+0

% Dado um numero n, retorna o fatorial de n

fatorial(0,1).			% Caso mais simples, 0! = 1

fatorial(X,S) :-		% Se X>0, S = X! = X * (X-1)!
	X>0,			% Nao estamos no caso mais simples
	Y is X-1,		% Decrementamos X
	fatorial(Y,Z),		% Calculamos (X-1)! 
				% E assim por diante, ate o caso mais simples
	S is X*Z.		% S = X*(X-1)*(X-2)*...*1

	
