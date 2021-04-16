% Dado um número X maior ou igual a zero, retorna em uma lista L, todos os múltiplos de 4 que são menores ou iguais a X

% Caso base: 0 é múltiplo de todos os números naturais
multiples4(0,[0]).

% Caso 1: O número X é múltiplo de 4
% Nesse caso, adicionamos X à lista se o módulo de X por 4 é zero
% Checamos então se X-1 é múltiplo de 4
multiples4(X,[X|Tail]) :-
    R is X mod 4,
    R = 0,
    X1 is X-1,
    X1 > 0,                 % Garantimos que não ultrapasse o caso base com X1 negativo
    multiples4(X1,Tail).

% Caso 2: O número X não é múltiplo de 4
% Nesse caso, apenas prosseguimos para X-1
multiples4(X,L) :-
    R is X mod 4,
    R > 0,
    X1 is X-1,
    multiples4(X1,L).
