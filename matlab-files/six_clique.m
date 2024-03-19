function listOfCliques=six_clique(M,L)
%listOfCliques 
% How do I make it faster?


    numVertices=size(M,1);
    listOfCliques=[];
    
    listOfTriangles
    for e = 1:size(L,1)
        a=L(e,1);
        b=L(e,2);
        
        Mab=allButRowOrCol(L(e,:),M,1);
        
    end
    
    
    
    
    
    
    
    
    
%     % Base Case.
%     if k==2
%         for XX=1:numVertices
%             for YY=XX+1:numVertices
%                 if M(XX,YY)==1
%                     listOfCliques=[listOfCliques ; [XX YY]];
%                 end
%             end
%         end
%     else
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



end