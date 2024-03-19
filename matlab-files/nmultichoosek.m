function [ X ] = nmultichoosek(v,k)
%nmultichoosek -- It's not multichoose actually.  It's just counting.
%Let's come up with a better name that actually says what this does.  It's
%really not multichoose in the slightest.




if size(v)==1
    n=v;
    X = (factorial(n+k-1)) / (factorial(k)*factorial(n-1));
else
    
    
X = zeros(1,0);    
    
    for r = 1:k
        
        Z = [];
        for s = 1:size(v,2)
        
            Y = [  repmat(v(s),[size(X,1),1])  X  ];

            Z = [Z;Y];
        end
        
        X=Z;
    end

    
    
    
    
end


