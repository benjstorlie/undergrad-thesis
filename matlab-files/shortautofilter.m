function X = shortautofilter(tiling, listoftilings,n,loa,type)
%shortautofilter -- gives a list of which tilings in listoftilings are not
%in the orbit of tiling.


if nargin==5
    if strcmp(type,'verts')
    
        loa = hyperoctahedral(n,'list');
        
        
    end
else

if nargin==3
    loa=simplicesActions(n);
end

end

X = zeros(size(listoftilings));
counter=1;


orb=orbit(tiling,n,loa);

for i = 1: size(listoftilings,1)
    
    
    if ismember(listoftilings,orb,'rows')
        
        X(counter,:)=listoftilings(i,:);
        counter=counter+1;
    end
end
        

X = X(1:counter-1,:);




        


