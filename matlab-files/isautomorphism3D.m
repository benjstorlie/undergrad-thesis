function [answer]=isautomorphism3D(mx1,mx2)

% The input matrices are 2^n x n!  
% Each column vector is a tetrahedron.

R=[0 1 0 0 0 0 0 0;
   0 0 0 1 0 0 0 0;
   1 0 0 0 0 0 0 0;
   0 0 1 0 0 0 0 0;
   0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 1;
   0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 1 0];

S=[0 1 0 0 0 0 0 0;
   1 0 0 0 0 0 0 0;
   0 0 0 1 0 0 0 0;
   0 0 1 0 0 0 0 0;
   0 0 0 0 0 1 0 0;
   0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 0 1;
   0 0 0 0 0 0 1 0];

D=[1 0 0 0 0 0 0 0;
   0 0 1 0 0 0 0 0;
   0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 1 0;
   0 1 0 0 0 0 0 0;
   0 0 0 1 0 0 0 0;
   0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 1];

DR3D=D*(R^3)*D;

M=zeros(8,8,48);
counter=1;

for dr3d=0:1
    for s=0:1
        for d=0:2
            for r=0:3
                M(:,:,counter) = S^s * ((DR3D)^dr3d) * R^r * D^d;
                counter = counter+1;
            end
        end
    end
end
            


mx2col = sortrows(mx2');  % It's actually totally sorted already...
answer=0;

for i=1:48
    if isequal( sortrows( ((M(:,:,i))*mx1)' ) , mx2col)
        answer=1;
        break 
    end
end








end