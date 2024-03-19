function [disjoint,x,fval,exitflag]=templinprog(W,V)

n = size(V,1);
f = (sum(W,2)-sum(V,2));

b = zeros((n+1)^2,1);

A = zeros((n+1)^2,n);
counter=1;

for i = 1:n+1
    for j = 1:n+1
        A(counter,:) = (W(:,i)-V(:,j))';
        counter = counter+1;
    end
end

options = optimset('Display','off');


% [x,fval,exitflag]=linprog( f , A, b, [], [], -1, 1,zeros(n,1) ,options);
[x,fval,exitflag]=linprog( f , A, b,[],[],[],[],[],options);


if fval < 0 && exitflag==-3
    disjoint = 1;
else
    disjoint = 0;
end
