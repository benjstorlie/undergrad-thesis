function [ X ] = plotTiling( tileVec,color  )
%plotTiling Plot a tiling of tetrahedra


listOfSimplices=simplicesList(3);


colors=['g','b','r','y','m','c'];
if nargin == 2
    colors(1)=color;
end

for vec=1:numel(tileVec);
    [a,b,c]=tetra(vector2matrix(listOfSimplices(tileVec(vec),:) , 3));
    patch(a,b,c,colors(vec),'FaceAlpha',.5)
    clear a b c
end

    
    
X = zeros(8,numel(tileVec));
for q=1:numel(tileVec)
    X(:,q)=listOfSimplices(tileVec(q),:);
end









function [X,Y,Z]=tetra(M)

%Turns four points into a tetrahedron that 'patch' can understand.

x=M(1,:);
y=M(2,:);
z=M(3,:);
w=M(4,:);

blue=[x,y,z;
   w,x,y;
   z,w,x;
   y,z,w];

X=blue(:,1:3:end)';
Y=blue(:,2:3:end)';
Z=blue(:,3:3:end)';
end



function z = vol( A,dim )
%Used for filtering for volume.
    z=det(A(1:dim,:)-repmat(A(dim+1,:),[dim 1]));
    z=abs(z);
end

axis equal

end

