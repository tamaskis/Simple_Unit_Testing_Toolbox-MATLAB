%==========================================================================
%
% TEST_EQUAL  Determines if the actual result matches the expected result,
% to within some maximum error.
%
%   TEST_EQUAL(actual,expected)
%   TEST_EQUAL(actual,expected,max_err)
%
% See also TEST_UNEQUAL.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-06
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   actual      - (double array) actual result (what your function found)
%   expected    - (double array) expected result (testing against this)
%   max_err     - (OPTIONAL) (1×1 double) maximum error (defaults to 10⁻¹⁰)
%                   --> uses relative error if expected result is nonzero
%                   --> uses absolute error if expected result is zero
%
% -----
% NOTE:
% -----
%                            |(actual) - (expected)|
%           relative error = -----------------------
%                                   expected
%
%           absolute error = |(actual) - (expected)|
%
%==========================================================================
function TEST_EQUAL(actual,expected,max_err)
    
    % sets maximum error (defaults to 10^-10)
    if nargin < 3
        max_err = 1e-10;
    end
    
    % reshapes both arrays to column vectors
    expected = expected(:);
    actual = actual(:);
    
    % preallocates array to store errors
    err = zeros(size(actual));
    
    % calculates error for each element
    for i = 1:length(actual)
        
        % calculates error as relative error if expected result is nonzero
        if expected(i) ~= 0
            err(i) = abs((actual(i)-expected(i))/expected(i));
            
        % calculates error as absolute error if expected result is zero
        else
            err(i) = abs(actual(i)-expected(i));
        end
        
    end
    
    % tests equality (error should be less than or equal to maximum error)
    for i = 1:length(err)
        assert(err(i) <= max_err);
    end
    
end