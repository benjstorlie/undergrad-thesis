function [disjoint,x,fval,exitflag]=templinprog2(W,V)

n = size(V,1);

%f = [(sum(W,2)-sum(V,2)); 0];


b = zeros(2*(n+1),1);


A=[[-V', ones(n+1,1)] ; [W', -ones(n+1,1)] ];


options = optimset('Display','off');


[x,fval,exitflag]=linprog( [] , A, b,[],[],[],[],[],options);


% signs = zeros(size(x));
% for i = 1:size(x)
%      signs(i)= x(i)<=0  ; 
% end

% signs = (x <= 0);
% 
% if all(signs)
%     disjoint = 1;
% else
%     disjoint = 0;
% end

disjoint = all((A*x) <= 0);

% if isequal(signs,ones(size(x)))
%     disjoint = 1;
% else
%     disjoint = 0;
% end
