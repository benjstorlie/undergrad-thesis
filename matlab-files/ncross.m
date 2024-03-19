function [ V ] = ncross( M )
%NCROSS 
%

n = size(M,2);
N = M(:,2:end) - repmat(M(:,1), [1 n-1]);

V = zeros(n,1);
for a = 1:n
   V(a) = (-1)^(a-1) * det(N([1:a-1 a+1:end],:));
end

end

