function []=cube3(dim1,dim2,dim3,v0,I3)

R=dim1*I3(:,1);
L=-dim1*I3(:,1);
U=dim2*I3(:,2);
D=-dim2*I3(:,2);
I=dim3*I3(:,3);
O=-dim3*I3(:,3);

cube=[U I R O D I L O R I U O L I D O];
v=v0;

path=zeros(3,length(cube));
    for c=1:length(cube)
        v=v+cube(:,c);
        path(:,c)=v;
    end
path=[v0 path];
plot3(path(1,:),path(2,:),path(3,:));