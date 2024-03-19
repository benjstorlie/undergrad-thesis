function ncliques = shortnextcliques(M,oldclique)

%n = length(oldclique)+1;

% 
% buffersize = 2000;
% 
% ncliques=zeros(buffersize,n);
%    count=1;
   
   
           smallM = M(:, oldclique);
           
           
           
           newverts=find(all(smallM,2));
           
           ncliques=[ repmat(oldclique,[length(newverts), 1]) , newverts];
           
           
           
           
           
           
%            
%            
%            
%            
%            for x=1:size(M,1)
%                
%                
%                if isequal(smallM(x,:),ones(1,n-1))
%                    ncliques(count,:)=[oldclique x];
%                    
%                    count=count+1;
%                    
%                    if count>size(ncliques,1)
%                        ncliques=[ncliques ; zeros(buffersize,n)];
%                    end
%                end
%            end
% 
%    ncliques = ncliques(1:count-1,:);
%    ncliques = sort(ncliques,2);