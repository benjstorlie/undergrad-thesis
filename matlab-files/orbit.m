function X=orbit(tiling,loa)
%orbit -- returns every tiling in the orbit of tiling under B_n.



X=zeros(size(loa,1),size(tiling,2));

for i= 1:size(loa,1)
    
    image=zeros(size(tiling));
    for x = 1:size(tiling,2)
        image( x ) = loa(i,tiling(x));
    
    end
    image=sort(image);
    
    X(i,:)=image;
end

X= unique(X,'rows');


