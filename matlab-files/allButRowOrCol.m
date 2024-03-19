function newM = allButRowOrCol(v,M,dim)
    
    numRows = size(M,dim);

        newM=[];
        for row = 1:numRows
            if ismember(row,v)==1
                if dim==1
                    newM=[newM ; M(row,:) ];
                elseif dim==2
                    newM=[newM  M(:,row)  ];
                end
            end
            
        end
 
    
end