%==========================================================================
%
% decimal_places_of_equality  Determines the number of decimal places (up
% to 100) to which equality exists between two arrays.
%
%   n_equal = decimal_places_of_equality(X1,X2)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-04-09
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
% -----
% NOTE:
% -----
%   • We assume that NaN values are equal, i.e. NaN = NaN.
%
%==========================================================================
function n_equal = decimal_places_of_equality(X1,X2)
    
    % initial number of decimal places of equality to check for (starts off
    % assuming 100 decimal places of precision)
    n0 = 100;
    
    % reshapes both arrays to column vectors
    X1 = X1(:);
    X2 = X2(:);
    
    % number of array elements
    N = length(X1);
    
    % array that stores decimals of precision for each element
    n_array = n0*ones(N,1);
    
    % loops through each array element, testing for equality at desired
    % precision or checking up to which precision equality exists
    %   • note that we ignore NaN values; we assumes NaN = NaN
    for i = 1:N
        if ~(isnan(X1(i)) && isnan(X2(i)))
            
            % tracks the three different measures of decimal places of 
            % precision
            n_array_round = 100;
            n_array_floor = 100;
            n_array_ceil = 100;
            
            % checks precision via round operation
            while (n_array_round > 0) && (round(X1(i),n_array_round) ~=...
                    round(X2(i),n_array_round))
                n_array_round = n_array_round-1;
            end
            
            % checks precision via floor operation
            while (n_array_floor > 0) && (floorn(X1(i),n_array_floor) ~=...
                    floorn(X2(i),n_array_floor))
                n_array_floor = n_array_floor-1;
            end
            
            % checks precision via ceil operation
            while (n_array_ceil > 0) && (ceiln(X1(i),n_array_ceil) ~=...
                    ceiln(X2(i),n_array_ceil))
                n_array_ceil = n_array_ceil-1;
            end
            
            % the three different operations can yield three different
            % precisions; we take the maximum of these
            n_array(i) = max([n_array_round,n_array_floor,n_array_ceil]);
            
        end
    end
    
    % determines minimum number of decimal places of equality (i.e. decimal
    % places of equality for the entire array)
    n_equal = min(n_array);
    
end