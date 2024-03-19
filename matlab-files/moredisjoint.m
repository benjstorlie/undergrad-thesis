function d= moredisjoint(pair,n,los)


%los is the list of simplices, written out as a list
%n is the dimension
%pair is the pair of simplices we're trying to figure out if they are
%disjoint, written as a 1x2 vector.

A=vector2matrix(   los(pair(1),:)    ,n)';
B=vector2matrix(   los(pair(2),:)    ,n)';

d=funlinprog(A,B);