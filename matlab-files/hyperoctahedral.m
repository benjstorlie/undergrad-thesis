function [X]=hyperoctahedral(n,type)
%hyperoctahedral -- Gives a list of the elements of the octahedral group for
%n dimensions. Each row of X is a permutation such that X(i,j) is the image
%of vertex j under permutation i.
%


verts=binarylist(n);  % 2^n-by-n matrix where each row is the 
                         % coordinates of a vertex of the cube.

perm = perms(1:n);

if strcmp(type,'list')
    X = zeros(2^n*factorial(n),2^n);
elseif strcmp(type,'vectors')
    X= zeros(2^n,n,2^n*factorial(n));
    
end
count=1;
                         
for k = 1:2^n
    for p = 1:factorial(n)
        
        permverts = zeros(size(verts));
        for col = 1:n
            permverts(:,perm(p,col)) = verts(:,col);
        end
        
        newverts = xor( repmat(verts(k,:),[2^n 1]) , permverts);
        
        if strcmp(type,'list')
            for row = 1:2^n
                [xx,I] = ismember(newverts(row,:),verts,'rows');
                X(count,row)=I; 
            end
        elseif strcmp(type,'vectors')
            X(:,:,count) = newverts;
        end
        count=count+1;
    end
end
               
end