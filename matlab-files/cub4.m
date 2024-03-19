function []=cub4(dim1,dim2,dim3,dim4)
%It's easiest just to ask cube4(1,1,1,1) for now.

hold off

%These are the 'basis vectors' for R^4.
%Think of it like a 3D projection of those vectors at a certain angle or something.
%Or just picking four vectors that won't overlap in R^3.
v=[1   0   0;
   0   1   0;
   0   0   1;
   -2  1.5 -.5];

%Multiply by the length, width, height, and...depth desired.

v1=dim1*v(1,:);
v2=dim2*v(2,:);
v3=dim3*v(3,:);
v4=dim4*v(4,:);


%Define four parallel squares whose corrosponding vertices
%are on a square in the other two dimensions.
s1=[0 0 0;
         v1;
         v1+v2;
         v2];
s2=[v3;
         v3+v1;
         v3+v1+v2;
         v3+v2];
s3=[v4;
         v4+v1;
         v4+v1+v2;
         v4+v2];
s4=[v4+v3;
         v4+v3+v1;
         v4+v3+v1+v2;
         v4+v3+v2];
     
%This is an Eulerian tour of the 4-cube,
%naming each vertex by it's square and vertex above.
tour=[s1(1,:);
    s1(2,:);
    s2(2,:);
    s2(3,:);
    s4(3,:);
    s4(4,:);
    s3(4,:);
    s3(1,:);
    s1(1,:);
    s2(1,:);
    s4(1,:);
    s3(1,:);
    s3(2,:);
    s3(2,:);
    s2(2,:);
    s2(1,:);
    s2(4,:);
    s4(4,:);
    s4(1,:);
    s4(2,:);
    s4(3,:);
    s3(3,:);
    s1(3,:);
    s1(2,:);
    s3(2,:);
    s3(3,:);
    s3(4,:);
    s1(4,:);
    s1(3,:);
    s2(3,:);
    s2(4,:);
    s1(4,:);
    s1(1,:)];


%plot it in 3 dimensions!
plot3(tour(:,1),tour(:,2),tour(:,2))
