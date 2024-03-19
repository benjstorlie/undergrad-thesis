


% (w(i)-v(j))*x geq 0  <==>  -(w(i)-v(j))*x leq 0

% V is the matrix of vertices for one simplex
% W is the matrix of vertices for the other simplex

W = [0 1 0 0 0;
     0 0 1 0 0;
     0 0 0 1 0;
     0 0 0 0 1];
 
% V=W;
 

V = [1 1 0 0 0;
     1 0 1 0 0;
     1 0 0 1 0;
     1 0 0 0 1];
 
% V = [1 0 1 1 1;
%      1 1 0 1 1;
%      1 1 1 0 1;
%      1 1 1 1 0];

n=4;




% f = sqrt((1:n));
% f = [sqrt(1) ; sqrt(2) ; sqrt(3) ; sqrt(4) ];

f = (sum(W,2)-sum(V,2));

b = zeros((n+1)^2,1);           % b is a vector of all zeros.

A = zeros((n+1)^2,n);           % Blank A to fill in later.

for i = 1:n+1
    for j = 1:n+1
        A((i-1)*(n+1)+(j-1)+1,:) = (W(:,i)-V(:,j))';
    end
end

[x1,fval1,exitflag1]=linprog( f , A, b, [], [], -1, 1)
