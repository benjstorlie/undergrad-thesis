function newlist = filterAutomorphism3D(m6)

%filterAutomorphism3D
% newlist = filterAutomorphism3D(m6)
% m6 is a k-by-6 matrix, where the rows are tilings of the cube.
% newlist removes duplicate tilings, including duplicates by symmetry

if size(m6,1)<2
   newlist=m6;
   return


else

    listOfSimplices=simplicesList(3);
    

        M6=zeros(8,6,size(m6,1));

        for x=1:size(m6,1)
            for y=1:6
                M6(:,y,x)=listOfSimplices(m6(x,y))';
            end
        end

        clear x y 

        
    new=zeros(size(m6)); 
    counter=1;
    for row = 2:size(m6,1)
        
        if isautomorphism3D(M6(:,:, 1) , M6(:,:, row)) == 0
            new(counter,:)=m6(row,:);
            counter=counter+1;
            
        end
    end
    
    new = new(1:counter-1 , :);
    
    newlist = [m6(1,:) ; filterAutomorphism3D(new)];
    
        





end


end