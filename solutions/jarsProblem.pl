/*  
    Inteligência Artifical
    Tarefa 2 - Busca não informada
    Alunos: Daniel Lopes de Sousa
*/

% ------------------------------------------------------------------------------------ %
% 1. Modelagem do problema

% (a) 

% O objetivo é ter 2 litros de água na jarra 1, não importando quantos litros de água 
% tenhamos na jarra 2.
objetivo((2,_)).

% ------------------------------------------------------------------------------------ %

% (b) 

% Quando o conteúdo das jarras é menor que sua capacidade total, podemos usar as ações
% encher1 e encher2 para enchê-las totalmente.
acao((J1, J2), encher1, (4, J2)) 
    :- J1 < 4.

acao((J1, J2), encher2, (J1, 3)) 
    :- J2 < 3.

% Da mesma forma, podemos esvaziar completamente as jarras, caso elas não estejam vazias.
acao((J1, J2), esvaziar1, (0, J2)) 
    :- J1 > 0.

acao((J1, J2), esvaziar2, (J1, 0)) 
    :- J2 > 0.

% Quando passamos água de uma jarra para outra, podemos ter duas possibilidades. A água
% que passarmos pode ser suficiente para encher a jarra destino, ou não. Quando a água de
% uma jarra é suficiente para encher outra, colocamos apenas o volume suficiente para encher
% a segunda jarra, deixando o restante na primeira. Por exemplo, se J1 tem 2 litros e J2 tem
% 2 litros também, ao executar a acão passar12, teremos 1 litro em J1 e 3 litros em J2.
% Ou seja, acao((J1, J2), passar12, (X, Y)) nos retorna X = 1 e Y = 3.
acao((J1, J2), passar12, (Resto, 3)) :- 
    J1 > 0,
    J2 < 3,
    VolumePassado is 3 - J2, 
    Resto is J1 - VolumePassado, 
    Resto > 0.

acao((J1, J2), passar21, (4, Resto)) :- 
    J2 > 0, 
    J1 < 4, 
    VolumePassado is 4 - J1, 
    Resto is J2 - VolumePassado, 
    Resto > 0.

% A segunda possibilidade é de que, ao passar da jarra 1 para a 2, a segunda não possa ser
% completamente preenchida com a água passada da primeira. Nesse caso, só precisamos somar
% os volumes de água, verificando os limites de cada jarra.
acao((J1, J2), passar12, (0, Soma)) :- 
    J1 > 0, 
    % Podemos ter 'J1+J2', se usarmos S = J1 + J2, por isso, usamos 'is'
    Soma is J1 + J2, 
    Soma =< 3.

acao((J1, J2), passar21, (Soma, 0)) :- 
    J2 > 0, 
    Soma is J1 + J2, 
    Soma =< 4.

% ------------------------------------------------------------------------------------ %

% (c)

% Apenas para testes.
p(a).
p(b).
q(X):-p(X).

% findall(Y,q(Y),L).

% Para encontrar todas as configurações possíveis que podemos obter aplicando cada uma 
% das ações, podemos utilizar _. Por exemplo, ao fazer a consulta acao((1, 2), _, (X, Y)),
% X e Y assumirão todos os valores possíveis ao se aplicar cada uma das acões ao estado (1,2).
% Sabendo isso, queremos usar findall para colocar todas estas configurações em uma lista
% de filhos.
vizinho((J1, J2), Filhos) :- 
    findall((N1, N2), acao((J1, J2), _, (N1, N2)), Filhos).

% vizinho((1,2), Filhos).

% ------------------------------------------------------------------------------------ %

% (d)

busca_largura([Node|_]) :- 
    objetivo(Node).

busca_largura([Node|F1]) :- 
    vizinho(Node, NN),
    adiciona_a_fronteira_largura(NN, F1, F2),
    busca_largura(F2).

adiciona_a_fronteira_largura(NN, F1, F2):-
    append(F1, NN, F2).    
    
% busca_largura([(0,0)]).

% A consulta acima entra em um loop em que retorna true indefinidamente. Isso acontece porque
% estamos executando a busca, porém não existe nenhum critério de parada quando atingimos o 
% objetivo. Para solucionar isso, basta adicionarmos um cut quando o objetivo for satisfeito.
% Além disso, a busca só imprime true, pois encontra resultado para a busca, mas não mostra o 
% resultado obtido nem a sequẽncia das configurações das jarras.

busca_largura_cut([Node|_]) :- 
    objetivo(Node),
    !.

busca_largura_cut([Node|F1]) :- 
    vizinho(Node, NN),
    adiciona_a_fronteira_largura(NN, F1, F2),
    busca_largura_cut(F2).

% busca_largura_cut([(0,0)]).

% ------------------------------------------------------------------------------------ %

% (e)

busca_largura_estados([[Node|LNode]|_], Saida) :- 
    objetivo(Node), 
    !, 
    reverse([Node|LNode], Saida).

busca_largura_estados([[Node|LNode]|F1], Saida) :-
    vizinho(Node, NN),
    findall([X|[Node|LNode]], member(X, NN), Caminhos),
    adiciona_a_fronteira_largura(Caminhos, F1, F2),
    busca_largura_estados(F2, Saida).

% busca_largura_estados([[(0, 0)]], L).



    















