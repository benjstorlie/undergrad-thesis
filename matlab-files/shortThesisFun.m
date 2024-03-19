function disjointSimplices=shortThesisFun(listOfSimplices,vec,dim)

    numSimplices=size(listOfSimplices,1);

    disjointSimplices=zeros(numSimplices,numSimplices);
    % sharedFaceSimplices=zeros(numSimplices,numSimplices);

    checkedoff=zeros(numSimplices*(numSimplices-1),2);
    % do everything in each orbit at a time, instead of checking everything
    % fifty bajillion times.  So checkdoff is a list of the edges already
    % covered.
    checkcount=1;

    tic
    for X=vec
        disp(X)
        for Y=X+1:numSimplices
            if ~ismember([X Y],checkedoff)
                
                xyorbit=orbit([X Y],dim);
                
                A=vector2matrix(listOfSimplices(X,:),dim)';
                B=vector2matrix(listOfSimplices(Y,:),dim)';


                        if funlinprog(A,B)==1;
                        %if templinprog2(A,B)==1;
                            
                            for r = 1:size(xyorbit,1)
                                disjointSimplices(xyorbit(r,1),xyorbit(r,2))=1;
                                disjointSimplices(xyorbit(r,2),xyorbit(r,1))=1;
                                
                                checkedoff(checkcount,:) = xyorbit(r,:);
                                checkcount=checkcount+1;
                            end
                            
                            
                            
                        end

        %                 % Do X and Y share a dim-1 face?
        %                 if sum(listOfSimplices(X,:)==listOfSimplices(Y,:)) == dim-1
        %                     sharedFaceSimplices(X,Y) = 1;
        %                     sharedFaceSimplices(Y,X) = 1;
        %                 end
        %                 
        %                 %listOfEdges = [listOfEdges; [X Y] ];

    
            end

            if ~mod(Y,500)
                disp(Y), toc
            end

        end


    end
    
    disjointSimplices=disjointSimplices(vec,:);

end

    