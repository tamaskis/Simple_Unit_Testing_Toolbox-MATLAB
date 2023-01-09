%==========================================================================
%
% compare_sizes  Determines if two arrays are of the same size or not.
%
%   result = compare_sizes(X1,X2)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-01-08
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   X1      - (double array) double array #1
%   X2      - (double array) double array #2
%
% -------
% OUTPUT:
% -------
%   result  - (1×1 logical) true if two arrays have the same size, false
%             otherwise
%
%==========================================================================
function result = compare_sizes(X1,X2)
    
    % vectors with the array sizes along each dimension
    size_X1 = size(X1);
    size_X2 = size(X2);
    
    % if size_X1 and size_x2 are of different lengths, then we know the two
    % arrays have a different number of dimensions and thus cannot be the
    % same size
    if length(size_X1) ~= length(size_X2)
        result = false;
        return;
    end
    
    % loops through each dimension, comparing the size of the arrays along
    % each dimension; if inequality exists along any dimensions, the arrays
    % cannot be of the same size
    for i = 1:length(size_X1)
        if size_X1(i) ~= size_X2(i)
            result = false;
            return;
        end
    end
    
    % if we get to this point, then the arrays have the same size
    result = true;
    
end