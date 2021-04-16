% Adiciona um elemento a uma lista ordenada

% Caso base: inserindo o elemento numa lista vazia
insereListaOrdenada(X,[],[X]).       

% Caso 1: o elemento é menor do que o cabeça da lista
% Inserimos o elemento no começo da lista
insereListaOrdenada(X,[Head|Tail],[X,Head|Tail]) :-	
    X =< Head.								              

% Caso 2: o elemento é maior do que o cabeça da lista
% Nesse caso, sabemos que o cabeça da lista continuará como tal
% E vamos chamar novamente a função com a cauda da lista
insereListaOrdenada(X,[Head|Tail],[Head|Tail2]) :-	  
    X > Head,								                
    addOrdered(X,Tail,Tail2).				        
