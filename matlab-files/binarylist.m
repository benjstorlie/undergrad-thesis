
function X=binarylist(dim)
% make a list of dim-digit binary numbers
    if dim==1
        X=[0 ; 1];

    else
        recursive=binarylist(dim-1);
        len=size(recursive,1);
        first=[zeros(len,1) recursive];
        second=[ones(len,1) recursive];
        X=[first;second];
    end
end