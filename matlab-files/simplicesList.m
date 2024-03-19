function listOfSimplices=simplicesList(dim,type)

bigMatrix=binarylist(2^dim);

% Filter out all but the ones with (dim+1) ones.
smallerMatrix=[];
for i=1:size(bigMatrix,1)
    if sum(bigMatrix(i,:))==dim+1
        smallerMatrix=[ smallerMatrix; bigMatrix(i,:) ];
    end
end

% Filter out all but the ones with volume one.
listOfSimplices=[];
for j=1:size(smallerMatrix,1)
    A=vector2matrix(smallerMatrix(j,:),dim);
    if vol(A,dim) == 1
        listOfSimplices=[listOfSimplices; smallerMatrix(j,:) ];
    end
end

clear i j

if nargin==2
    if strcmp(type,'list')
        
        X=zeros(size(listOfSimplices,1),dim+1);
        for i=1:size(listOfSimplices,1)
            count=1;
            for j=1:size(listOfSimplices,2)
                if listOfSimplices(i,j)==1
                    X(i,count)=j;
                    count = count+1;
                end
            end
        end
        listOfSimplices = X;
    end 
    
end




function z = vol( A,dim )
%Used for filtering for volume.
    z=det(A(1:dim,:)-repmat(A(dim+1,:),[dim 1]));
    z=abs(z);
end

end
