function [X] = projections(n)
%projections -- returns a list of the normal vectors to all the planes
%intersecting n points in the n-cube [0,1]^n



bigMatrix=binarylist(2^n);

% Filter out all but the ones with n ones.
smallerMatrix=[];
for i=1:size(bigMatrix,1)
    if sum(bigMatrix(i,:))==n
        smallerMatrix=[ smallerMatrix; bigMatrix(i,:) ];
    end
end

%smallerMatrix is a list of (n-1)-simplices in the n-cube

X=zeros(size(smallerMatrix,1),n);
counter=1;



for i = 1: size(smallerMatrix,1)
    
    mx = vector2matrix(smallerMatrix(i,:),n);
    %mx is a n-by-n matrix whose columns are the vertices of the
    %(n-1)-simplex.
   
    
    twovecs = mx(1:n-1,:)-repmat(mx(n,:),[n-1 1]);
    %two vecs turns mx into a n-by-(n-1) matrix.
    
    
    normalvec=null(twovecs);
    
    if ~ismember(normalvec',X,'rows')
        X(counter,:)=normalvec;
        counter=counter+1;
    end
    
    
end

X=X(1:counter-1 , :);