%==========================================================================
%
% TEST_UNEQUAL  Determines if the actual result is different than the 
% expected result, above some minimum error.
%
%   TEST_UNEQUAL(actual,expected)
%   TEST_UNEQUAL(actual,expected,min_err)
%
% See also TEST_EQUAL.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-04-14
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
%   min_err     - (1×1 double) (OPTIONAL) minimum error (defaults to 10⁻¹⁰)
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
function TEST_UNEQUAL(actual,expected,min_err)
    
    % sets minimum error (defaults to 10^-10)
    if nargin < 3
        min_err = 1e-10;
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
            err(i) = abs((actual(i)-expected(i))./expected(i));

        % calculates error as absolute error if expected result is zero
        else
            err(i) = abs(actual(i)-expected(i));
        end

    end
    
    % tests if elements are unequal (error should be greater than minimum 
    % error)
    for i = 1:length(err)
        assert(err(i) > min_err);
    end

end