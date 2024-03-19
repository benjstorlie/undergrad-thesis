function listOfAutomorphisms = automorphismsList()


listOfSimplices=simplicesList(3);


R=[0 1 0 0 0 0 0 0;
   0 0 0 1 0 0 0 0;
   1 0 0 0 0 0 0 0;
   0 0 1 0 0 0 0 0;
   0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 1;
   0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 1 0];

S=[0 1 0 0 0 0 0 0;
   1 0 0 0 0 0 0 0;
   0 0 0 1 0 0 0 0;
   0 0 1 0 0 0 0 0;
   0 0 0 0 0 1 0 0;
   0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 0 1;
   0 0 0 0 0 0 1 0];

D=[1 0 0 0 0 0 0 0;
   0 0 1 0 0 0 0 0;
   0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 1 0;
   0 1 0 0 0 0 0 0;
   0 0 0 1 0 0 0 0;
   0 0 0 0 0 1 0 0;
   0 0 0 0 0 0 0 1];

DR3D=D*(R^3)*D;

M=zeros(8,8,48);
counter=1;

for dr3d=0:1
    for s=0:1
        for d=0:2
            for r=0:3
                M(:,:,counter) = S^s * ((DR3D)^dr3d) * R^r * D^d;
                counter = counter+1;
            end
        end
    end
end
 


listOfAutomorphisms=zeros(48,56);


for i=1:48
    for h=1:56
        
        vector = listOfSimplices(h,:);
        newvec = M(:,:,i)*vector';
        [xx,I] = ismember(newvec',listOfSimplices,'rows');
        listOfAutomorphisms(i,h) = I;
        
        
    end
end
    