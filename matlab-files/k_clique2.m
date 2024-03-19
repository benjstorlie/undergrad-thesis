function [ X ] = k_clique2( k,M )
%k_clique2 Which k-cliques are there in the graph whose adjacency mx. is M.
%   Detailed explanation goes here




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

