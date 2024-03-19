function []=cube5(dim1,dim2,dim3,dim4,dim5,v0)

%I4=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
S=[1 0 0;0 1 0;0 0 1;-2 2 -1.5;8 3 -2];
S(4,:)=S(4,:)/norm(S(4,:));
S(5,:)=S(5,:)/norm(S(5,:));
S=S';

I5a=S(:,1:4);
I5b=[S(:,1:3) S(:,5)];

hold off
cube4(dim1,dim2,dim3,dim4,v0,I5a)
hold on
cube4(dim1,dim2,dim3,dim4,v0+S*[0;0;0;0;dim5],I5a)
cube4(dim1,dim2,dim3,dim5,v0,I5b)
cube4(dim1,dim2,dim3,dim5,v0+S*[0;0;0;dim4;0],I5b)

