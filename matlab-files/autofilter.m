function newlist = autofilter(list, n)
%autofilter -- returns the list mod automorphisms for the n-cube



first = list(1,:);

if size(list,1) <= 1
    newlist = list;
    
    
else

    prelist = zeros(size(list));
    counter = 1;

    for i = 2:size(list,1)

        if ~isautomorphism(first,list(i,:),n)
            prelist(counter,:) = list(i,:);
            counter=counter+1;
        end
    end
    
    newlist = [first; autofilter( prelist(1:counter-1 , :) , n)];
    
end


