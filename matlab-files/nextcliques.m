function ncliques = nextcliques(M,oldcliques)

if (nargin == 1)
    n = 2;
else
    n = size(oldcliques,2) + 1;
end

buffersize = 2000;

ncliques=zeros(buffersize,n);
   count=1;
    
   if n==2
   
       [a b] = find(M);
       ncliques = unique(sort([a, b],2),'rows');
       
       %ncliques = filteraction(ncliques,dim);
   
   else
       
       for c=1:size(oldcliques,1)
           smallM = M(:, oldcliques(c,:));
           
           for x=1:size(M,1)
               if isequal(smallM(x,:),ones(1,n-1))
                   ncliques(count,:)=[oldcliques(c,:) x];
                   
                   count=count+1;
                   
                   if count>size(ncliques,1)
                       ncliques=[ncliques ; zeros(buffersize,n)];
                   end
               end
           end
       end
       
   
  
   ncliques = ncliques(1:count-1,:);
   ncliques = sort(ncliques,2);
   ncliques = unique(ncliques,'rows');
   %ncliques = filteraction(ncliques,dim);
   
   
   end
   
   


   