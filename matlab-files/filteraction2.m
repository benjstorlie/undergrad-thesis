function [X,Y] = filteraction2(listoftilings,loa,num)


if nargin==2

if size(listoftilings,1)<2
    X=listoftilings;
else
    
    X = [listoftilings(1,:) ; filteraction2(shortfilteraction2(listoftilings(1,:),listoftilings,loa),loa)];
  
end

Y=[];

else
    X=zeros(num,size(listoftilings,2));
    X(1,:)=listoftilings(1,:);
    
    
    orb = orbit(listoftilings(1,:),loa);
    
    
    Y = setdiff(listoftilings,orb,'rows');

    for i=2:num
        
        orb = orbit(Y(1,:),loa);
        
        Y = setdiff(Y,orb,'rows');
        
        X(i,:) = Y(1,:);

    end
    
end




end

function Y = shortfilteraction2(tiling,listoftilings,loa)

orb = orbit(tiling,loa);

Y = setdiff(listoftilings,orb,'rows');



end