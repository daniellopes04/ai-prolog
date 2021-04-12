% Operacoes em listas

% Verifica se X e membro da lista L
member(X,[X|_]).
member(X,[_|L]) :-
    member(X,L).

% Concatena duas listas L1 e L2
append([],L,L).
append([X|L1],L2,[X|L3]) :-
    append(L1,L2,L3).

% Verifica se X e membro da lista L usando append
member1(X,L) :-
    append(_,[X|_],L).

% Deleta os tres ultimos elementos de L
deleteLast3(L,R) :-
    append(R,[_,_,_],L).

deleteFirst3(L,R) :-
    append([_,_,_],R,L).

% Deleta os tres primeiros e os tres ultimos elementos de L
deleteFirstLast3(L,R) :-
    append([_,_,_],R,L),
    append(R,[_,_,_],L).

last(X,L) :-
    append([_],X,L).

    
