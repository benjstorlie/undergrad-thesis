function [ X ] = k_clique3( k,M,n )
%k_clique3 Which k-cliques are there in the graph whose adjacency mx. is M.
% n in the dimension of the cube we're talking about.
%   Detailed explanation goes here

loa = simplicesAutomorphism(n);


for n = 2:k

    if n==2
        cliques=nextcliques(M);
        
        
        
        
        
    else
        cliques=nextcliques(M,oldcliques);
    end
    
    if n==k
        X=cliques;
    else
        oldcliques=cliques;
    end
    

end

