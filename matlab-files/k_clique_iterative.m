function listOfCliques=k_clique_iterative(k,M)
%listOfCliques 
% How do I make it faster?


Cliques=cell(1,k) ;

for m = 2:k


    numVertices=size(M,1);
    
    
     % Base Case.
     
     if m==2
%          for XX=1:numVertices
%              for YY=XX+1:numVertices
%                  if M(XX,YY)==1
%                      listOfCliques=[listOfCliques ; [XX YY]];
%                  end
%              end
          %end

          
          [I,J] = find(M);
          Cliques{m} = [I, J];
          Cliques{m} = Cliques{m}(Cliques{m}(:,1) > Cliques{m}(:,2),:);
          
          
     else  
          
        L=Cliques{m-1};            
        tic    
        Cliquesm = zeros(0,m);
        for e = 1:size(L,1)
            
            if ~mod(e,1000)
                disp(e)
            end
            
            % Msmall=allButRowOrCol(L(e,:),M,1);
            Msmall = M(:,L(e,:));
            
            %for x=1:size(L,1)
            %    if ismember(x, L(e,:))
            %        Msmall(:,x)=zeros(size(Msmall(:,x)));
            %    end
            %end

%             for i=1:numVertices
%                 if isequal(Msmall(i,:),ones(size(Msmall(i,:))))
%                     listOfCliques=[listOfCliques; sort([Msmall(i,:) i])  ];
%                 end
%             end


            vlist = find(all(Msmall,2));
            if ~isempty(vlist)
            Cliquesm = [...
                Cliquesm; ...
                [repmat(L(e,:),[length(vlist),1]), vlist(:)]];
            clear Msmall;
            end
            
        end
        Cliques{m}=unique(sort(Cliquesm,2),'rows');
        clear Cliquesm
        
        toc
        disp(sprintf('%d %d-cliques found', size(Cliques{m},1), m))
        
        

     end
end
    
listOfCliques = Cliques{k} ;    
   

%     
%     candidates = nchoosek(1:numVertices,k) ;
%     
%     for c = 1: size(candidates,1)
%         newAdjacencyMatrix=allButRowOrCol(candidates(c,:),M,1) ;
%         newAdjacencyMatrix=allButRowOrCol(candidates(c,:),newAdjacencyMatrix,2) ;
%         
%         if isequal(newAdjacencyMatrix,ones(k)-eye(k))
%             listOfCliques=[listOfCliques; candidates(c,:)];
%         end
%         
%     end
    
%        for V = 1:numVertices
%             if sum(M(V,:))>=k
%                 %Make a list of the verts that are adjacent to V.
%                 
%                 adjacencyList = [];
%                 for V2 = 1:numVertices
%                     if M(V,V2)==1
%                         adjacencyList = [adjacencyList; V2] ;
%                     end
%                 end
%                 
%                 candidates = nchoosek(adjacencyList,k-1);
%                 for cand = 1:size(candidates,1)
%                     candVerts = candidates(cand,:) ;
%                     
%                     numEdges=0;
%                     for Vert1 = 1:length(candVerts)
%                         for Vert2 = Vert1+1 : length(candVerts)
%                             if M(Vert1,Vert2) == 1;
%                                 numEdges = numEdges+1 ;
%                             end
%                         end
%                     end
%                     
%                     if numEdges==nchoosek(k-1,2) 
%                         listOfCliques=[listOfCliques; candVerts];
%                 end
%                 
%                 
%                 
%                 
%                 
%                 
%                 
%                 
%                 %presubM=[];
%                 %subM=[];
%                 %for V2=1:numVertices
%                 %    if M(V,V2)==0
%                 %       presubM=[presubM; M(V2,:)];
%                 %    end
%                 %end
%                 %for V2=1:numVertices
%                 %    if M(V,V2)==0
%                 %       subM=[subM presubM(:,V2)];
%                 %    end
%                 %end
%                 %subListOfCliques = k_clique(k-1,subM);
%                 %subListOfCliques = [V*ones(size(subListOfCliques,1),1) subListOfCliques];
%                 %listOfCliques = [ listOfCliques; subListOfCliques ];
%             end
%         end
%        
%     end


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


end