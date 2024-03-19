function loa = simplicesActions(n)


los=simplicesList(n);  
    % Stands for List Of Simplices.
    % Each row is a vector with (n+1) ones and the rest zeros.
    % los(i,j) is whether vertex j is in simplex i, one for yes, zero for
    % no.



 
syms=hyperoctahedral(n,'list');
    % Each row of syms is a permutation such that syms(i,j) is the image
    % of vertex j under permutation i.
    % syms is all of the symmetries of the cube
M=zeros(2^n,2^n,size(syms,1));
    % M translates each row of syms into a 2^n-by-2^n binary permutation
    % matrix.

for s = 1:size(syms,1)
    for v = 1:2^n
        M( v, syms(s,v) , s)=1;
    end
    
end



loa=zeros(2^n*factorial(n),size(los,1));   
% Stands for List of Automorphims
% Each row will be a permutations such that loa(i,j) is the 
% image of simplex j under permutation i.


for i=1:size(loa,1)
    for h=1:size(los,1)
        
        vector = los(h,:);
        newvec = M(:,:,i)*(vector');
        [xx,I] = ismember(newvec',los,'rows');
        loa(i,h) = I;
        
        
    end
end
    