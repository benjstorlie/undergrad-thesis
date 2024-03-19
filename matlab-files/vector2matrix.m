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