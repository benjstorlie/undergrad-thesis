function answer = isautomorphism(x,y,n)
%isautomorphism -- Takes two lists of n-simplices, x and y,
% and determines whether they are the same mod cube symmetry.
% Each simplex is numbered based on the function simpliesList

loa = simplicesAutomorphism(n);
% Stands for List of Automorphims
% Each row will be a permutations such that loa(i,j) is the 
% image of simplex j under permutation i.


answer=0;

for i = 1:size(loa,1)   %should be 2^n*n!
    z = zeros(size(x));   % the new vector that is some automorphism of x
    
    for s = 1:size(x)
        z( loa(i,x(s)) ) = x(s);
    end

    if isequal(sort(y),sort(z));
        answer=1;
        break
    end
    
end
end

