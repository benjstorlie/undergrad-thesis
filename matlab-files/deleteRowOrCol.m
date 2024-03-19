function newM = deleteRowOrCol(n,M,dim)
    
    numRows = size(M,dim);
    
    
    if length(n)==1
  
        if dim==1
            if n==1
                newM = M(2:end,:);
            elseif n==numRows
                newM = M(1:end-1,:);
            else
                newM = [ M(1:n-1,:) ; M(n+1:end,:) ];
            end

        elseif dim==2
            if n==1
                newM = M(:,2:end);
            elseif n==numRows
                newM = M(:,1:end-1);
            else
                newM = [ M(:,1:n-1)   M(:,n+1:end) ];
            end

        end
    else
        
        newM=[];
        for row = 1:numRows
            if ismember(row,n)==0
                if dim==1
                    newM=[newM ; M(row,:) ];
                elseif dim==2
                    newM=[newM  M(:,row)  ];
                end
            end
            
        end
 
    end
end