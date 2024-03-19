function newM = awesome(M, pair,loa,disjoint)


orb = orbit(pair,loa);

for i = 1:size(orb,1)
    
    M(orb(i,1),orb(i,2))=disjoint;
    M(orb(i,2),orb(i,1))=disjoint;
    
end


newM=M;