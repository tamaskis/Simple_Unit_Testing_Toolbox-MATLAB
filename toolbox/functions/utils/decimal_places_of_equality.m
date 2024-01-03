%==========================================================================
%
% decimal_places_of_equality  Determines the number of decimal places (up
% to a specified maximum number of decimal places) to which equality exists
% between two arrays.
%
%   n_equal = decimal_places_of_equality(X1,X2,n_max)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2024-01-02
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
%   n_max   - (1×1 double) maximum number of decimal places to check for
%             equality
%
% -------
% OUTPUT:
% -------
%   n_equal - (1×1 double) decimal places of equality
%
% -----
% NOTE:
% -----
%   • We say that two numbers, X1 and X2, are equal to N decimal places if
%     | X1 - X2 | ≤ 10⁻ᴺ.
%   • We assume that NaN values are equal, i.e. NaN = NaN.
%
%==========================================================================
function n_equal = decimal_places_of_equality(X1,X2,n_max)
    
    % reshapes both arrays to column vectors
    X1 = X1(:);
    X2 = X2(:);
    
    % number of array elements
    N = length(X1);
    
    % array that stores decimals of precision for each element
    n_array = n_max*ones(N,1);
    
    % loops through each array element, testing for equality at desired
    % precision or checking up to which precision equality exists
    %   • note that we ignore NaN values; we assumes NaN = NaN
    for i = 1:N
        if isnan(X1(i)) && isnan(X2(i))
            continue
        elseif ~isnan(X1(i)) && ~isnan(X2(i))
            while (abs(X1(i)-X2(i)) > 10^(-n_array(i))) && (n_array(i) > 0)
                n_array(i) = n_array(i)-1;
            end
        else
            n_array(i) = 0;
        end
    end
    
    % determines minimum number of decimal places of equality (i.e. decimal
    % places of equality for the entire array)
    n_equal = min(n_array);
    
end