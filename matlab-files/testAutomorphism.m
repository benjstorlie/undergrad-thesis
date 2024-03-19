function [newlist]=testAutomorphism(integerlist)

if size(integerlist,1)<2
   newlist=integerlist;
   return

else

    new=zeros(size(integerlist)); 
    counter=1;
    for row = 2:size(integerlist,1)
        
        if ~isequal(integerlist(1,:), integerlist(row,:))
            new(counter,:)=integerlist(row,:);
            counter=counter+1;
            
        end
    end
    
    new = new(1:counter-1 , :);
    
    newlist = [integerlist(1,:) ; testAutomorphism(new)];
  
end