% Adds one element to a ordered list

% Case 0: adding the element to a empty list
addOrdered(X,[],[X]).       

% Case 1: the element is less than the head of the list
% We insert it on the beginning of the list
addOrdered(X,[Head|Tail],[X,Head|Tail]) :-	
    X =< Head.								              

% Case 2: the element is bigger than the head of the list
% In this case, the head of the list will stay unaltered
% We call the predicate again with the list tail
addOrdered(X,[Head|Tail],[Head|Tail2]) :-	  
    X > Head,								                
    addOrdered(X,Tail,Tail2).				        
