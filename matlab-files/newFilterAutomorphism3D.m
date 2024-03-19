function newlist = newFilterAutomorphism3D(m6)



if size(m6,1)<2
   newlist=m6;
   return


else

    
    listOfAutomorphisms = automorphismsList();
    
    new=zeros(size(m6)); 
    counter=1;
    
    for s = 2:size(m6,1)
        
        auto = 0;
        for i = 1:48
            
            newvec = zeros(8,1);
            for x=1:6
                newvec(x) = listOfAutomorphisms(i,m6(s, x));
            end
            if isequal(sort(newvec) , sort(m6(1,:)) )
                auto = 1;
                break
            end
                
        end
        
        if auto==0
            
            new(counter,:)=m6(s,:);
            counter=counter+1;
            
        end
        
        
    end
    
    new = new(1:counter-1 , :);
    
    newlist = [m6(1,:) ; filterAutomorphism3D(new)];
end
end
    
    
    