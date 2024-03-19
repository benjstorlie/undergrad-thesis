function []=longThesisFun(listOfSimplices)

for i=0:266
    
    vec=(10*i)+1:10*(i+1);
    
    disjointSimplices=shortThesisFun(listOfSimplices,vec,4);
    
    
    eval(['list' num2str(i) '= disjointSimplices;']);
    
    save('fourdim',['list' num2str(i)],'-append')
    
end

list267=shortThesisFun(listOfSimplices,[2671,2672],4);

save('fourdim','list267','-append')
