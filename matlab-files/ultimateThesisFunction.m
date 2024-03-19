function [ disjointSimplices ] = ...
    ultimateThesisFunction( dim )
%ultimateThesisFunction How many ways can you tile an n-cube with equal
%volumed n-simplices?
%   Detailed explanation goes here


% Find all possible, allowed simplices.


listOfSimplices=simplicesList(dim);

% %%%%%%%%%%%%%%%%
% listOfSimplices=listOfSimplices(1:10,:);
% bigList=zeros(dim+1,dim,10);
% for vector=1:10
%     bigList(:,:,vector)=vector2matrix(listOfSimplices(vector,:),dim);
% end
% %%%%%%%%%%%%%%%%



% Make a list of one-dimensional subspaces of R^n.

% oneDimensionalSpaces=[];
% for s=1:numSimplices    % For all the simplices
%     simplex=vector2matrix(listOfSimplices(s,:),dim);
%     for vertex=1:size(simplex,1)
%         face=[ simplex(1:vertex-1,:) ; simplex(vertex+1:end,:) ];
%         faceVectors=face(1:dim-1,:)-repmat(face(dim,:),[dim-1 1]);
%         W=null(faceVectors,'r');
%         if ismember(W',oneDimensionalSpaces,'rows')==0
%             oneDimensionalSpaces = [oneDimensionalSpaces;W'];
%         end
%     end  
% end


numSimplices=size(listOfSimplices,1);


disjointSimplices=zeros(numSimplices,numSimplices);
% sharedFaceSimplices=zeros(numSimplices,numSimplices);


disp(numSimplices)
for X=1:numSimplices
    disp(X)
    tic
    for Y=X+1:numSimplices
        A=vector2matrix(listOfSimplices(X,:),dim)';
        B=vector2matrix(listOfSimplices(Y,:),dim)';


                if intersectTest(A,B,dim)==1;
                    disjointSimplices(X,Y) = 1;
                    disjointSimplices(Y,X) = 1;
                end
                
%                 % Do X and Y share a dim-1 face?
%                 if sum(listOfSimplices(X,:)==listOfSimplices(Y,:)) == dim-1
%                     sharedFaceSimplices(X,Y) = 1;
%                     sharedFaceSimplices(Y,X) = 1;
%                 end
%                 
%                 %listOfEdges = [listOfEdges; [X Y] ];

    if ~mod(Y,100)
        disp(Y), toc
    end

    end
end
        










% function X=binary(dim)
% % make a list of dim-digit binary numbers
%     if dim==1
%         X=[0 ; 1];
% 
%     else
%         recursive=binary(dim-1);
%         len=size(recursive,1);
%         first=[zeros(len,1) recursive];
%         second=[ones(len,1) recursive];
%         X=[first;second];
%     end
% end

function [ X ] = vector2matrix( vec,dim )
%translateBack translate tetra vector into tetra matrix
%   Detailed explanation goes here
    binMx=binarylist(dim);
    X=[];
    for iter=1:2^dim
        if vec(iter) == 1
            X=[ X ; binMx(iter,:) ];
        end
    end
end

function [ vecBinary ] = matrix2vector( M,dim )
%TRANSLATE translate from binary to numbers

    vec=zeros(size(M,1),1);

    for x=1:size(M,1)
        for y=1:size(M,2)
            vec(x) = vec(x)+ M(x,y)*2^(y-1);
        end
        vec(x) = vec(x) + 1;   %So it's 1-16, instead of 0-15

    end
    vecBinary=zeros(2^dim,1);
    for t=1:dim+1
        vecBinary(vec(t))=1;
    end
end

function newM = deleteRowOrCol(n,M,dim)
    
    numRows = size(M,dim);
    
    
    if length(n)==1
  
        if dim==1
            if n==1
                newM = M(2:end,:);
            elseif n==numRows
                newM = M(1:end-1,:);
            else
                newM = [ M(1:n-1,:) ; M(n+1:end,:) ];
            end

        elseif dim==2
            if n==1
                newM = M(:,2:end);
            elseif n==numRows
                newM = M(:,1:end-1);
            else
                newM = [ M(:,1:n-1)   M(:,n+1:end) ];
            end

        end
    else
        
        newM=[];
        for row = 1:numRows
            if ismember(row,n)==0
                if dim==1
                    newM=[newM ; M(row,:) ];
                elseif dim==2
                    newM=[newM  M(:,row)  ];
                end
            end
            
        end
 
    end
end

end


