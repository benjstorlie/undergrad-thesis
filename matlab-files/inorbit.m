function answer = inorbit(tiling, other,loa)
%inorbit -- is other in the orbit of tiling in dimension n?



answer = 0;


for i = 1: size(loa,1)
    
   image=zeros(size(tiling));
   for x = 1:size(tiling,2)
       
       
       image(1, x ) = loa(i,tiling(1,x));
       
   end
   image=sort(image);
   
   if isequal(image, other)
       answer=1;
       break
       
   end
    
    
    
end