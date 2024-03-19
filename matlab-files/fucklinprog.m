function disjoint = funlinprog(V,W)
%funlinprog -- It's totally always a bunch of 0s, 1s, and 2s.  Let's just
%try those as vectors.



n = size(V,1);


disjoint = 0;

vectors = nmultichoosek([-4,-3,-2,-1,0,1,2,3,4],n);
%vectors = projections(n);
[xx,I] = ismember(zeros(1,n),vectors,'rows');
vectors = [ vectors(1:I-1,:) ; vectors(I+1:end,:) ];


for vec = 1:size(vectors,1)

    v = zeros(n+1,1);
    for i = 1:n+1
        v(i) = vectors(vec,:)*V(:,i);
    end
    w = zeros(n+1,1);
    for j = 1:n+1
        w(j) = vectors(vec,:)*W(:,j);
    end
    
    if max(v) <= min(w)
        disjoint = 1;
        break
        
    end
end

    
end
