%==========================================================================
%
% decimal_places_of_equality  Determines the number of decimal places
% (up to 100) to which equality exists between two arrays.
%
%   n_equal = decimal_places_of_equality(X1,X2)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-01-07
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
%   n_equal - (1×1 double) decimal places of equality
%
%==========================================================================
function n_equal = decimal_places_of_equality(X1,X2)
    
    % reshapes both arrays to column vectors
    X1 = X1(:);
    X2 = X2(:);
    
    % number of array elements
    N = length(X1);
    
    % array that stores decimals of precision for each element (starts of
    % assuming 100 decimal places of precision)
    n_array = 100*ones(N,1);
    
    % loops through each array element, testing for equality at desired
    % precision or checking up to which precision equality exists
    for i = 1:N
        while (n_array(i) > 0) &&...
                (round(X1(i),n_array(i)) ~= round(X2(i),n_array(i)))
            n_array(i) = n_array(i)-1;
        end
    end
    
    % determines minimum number of decimal places of equality (i.e. decimal
    % places of equality for the entire array)
    n_equal = min(n_array);
    
end