%==========================================================================
%
% TEST_NOT_EQUAL  Raises an error if two double arrays are equal up to a 
% desired number of decimal places.
%
%   TEST_NOT_EQUAL(X1,X2)
%   TEST_NOT_EQUAL(X1,X2,n)
%
% See also TEST_EQUAL.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-16
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
%   n       - (OPTIONAL) (1×1 double) decimal places of precision
%
%==========================================================================
function TEST_NOT_EQUAL(X1,X2,n)
    
    % sets decimal places of precision (defaults to 16, corresponding to 
    % 10⁻¹⁶)
    if (nargin < 3) || isempty (n)
        n = 16;
    end
    
    % reshapes both arrays to column vectors
    X1 = X1(:);
    X2 = X2(:);
    
    % tracks number of inequalities
    m = 0;
    
    % tests equality for each element, counting number of ienqualities
    for i = 1:length(X1)
        try
            assert(round(X1(i),n) == round(X2(i),n));
        catch
            m = m+1;
        end
    end
    
    % raises error if the two arrays are equal
    if m == 0
        error("Arrays are equal.")
    end
    
end