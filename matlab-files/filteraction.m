function X = filteraction(listoftilings,n,loa,type)
%filteraction -- filters listoftilings into just representatives from every
%distinct orbit

if nargin==4
    if strcmp(type,'verts')
        
if size(listoftilings,1)<2
    X=listoftilings;
else
    
    X = [listoftilings(1,:) ; filteraction(shortautofilter(listoftilings(1,:),listoftilings,n,loa,type),n,loa,type)];
    
end
        
    end
else

if size(listoftilings,1)<2
    X=listoftilings;
else
    
    X = [listoftilings(1,:) ; filteraction(shortautofilter(listoftilings(1,:),listoftilings,n,loa),n,loa)];
    

    
end
end