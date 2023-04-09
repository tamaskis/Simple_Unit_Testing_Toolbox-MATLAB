%==========================================================================
%
% TEST_NOT_EQUAL  Test if two double arrays are NOT equal up to a desired 
% number of decimal places.
%
%   TEST_NOT_EQUAL(X1,X2)
%   TEST_NOT_EQUAL(X1,X2,n)
%   TEST_NOT_EQUAL(__,name,print,color)
%   output = TEST_NOT_EQUAL(__)
%
% See also TEST_EQUAL.
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
%   n       - (OPTIONAL) (1×1 double) decimal places of precision (defaults
%             to 16)
%   name    - (OPTIONAL) (char array) test name (defaults to empty string)
%   print   - (OPTIONAL) (1×1 logical) true if test result should be
%             printed to Command Window, false otherwise (defaults to true)
%   color   - (OPTIONAL) (1×1 logical) true if test result should be
%             printed in color, false otherwise (defaults to true)
%
% -------
% OUTPUT:
% -------
%   output  - (1×1 struct) test outputs
%       • passed  - (1×1 logical) true if test passed, false otherwise
%       • result  - (char array) test result
%       • message - (char array) additional diagnostic message
%
%==========================================================================
function output = TEST_NOT_EQUAL(X1,X2,n,name,print,color)
    
    % -------------
    % Parse inputs.
    % -------------
    
    % sets decimal places of precision (defaults to 16, corresponding to 
    % 10⁻¹⁶)
    if (nargin < 3) || isempty(n)
        n = 16;
    end
    
    % defaults test name to empty string
    if (nargin < 4) || isempty(name)
        name = '';
    end
    
    % defaults "print" to true
    if (nargin < 5) || isempty(print)
        print = true;
    end
    
    % defaults "color" to true
    if (nargin < 6) || isempty(color)
        color = true;
    end
    
    % ---------
    % Run test.
    % ---------
    
    % if the two arrays do not have the same size, they cannot be equal
    if ~compare_sizes(X1,X2)
        output.passed = true;
        output.result = 'Passed.';
        output.message = '';
        if print, fprintf([name,output.result,'\n']); end
        return;
    end
    
    % determines minimum number of decimal places of equality
    n_equal = decimal_places_of_equality(X1,X2);
    
    % determines if test passed (at least one elementwise inequality
    % exists with respect to the specified precision)
    passed = (n_equal < n);
    
    % -------------------
    % Diagnostic message.
    % -------------------
    
    % determines data type of input
    if length(X1(:)) == 1
        data_type_1 = 'Values';
        data_type_2 = 'values';
    else
        data_type_1 = 'Arrays';
        data_type_2 = 'arrays';
    end
    
    % diagnostic message
    if passed && (n_equal == 0)
        message = '';
    elseif passed && (n_equal > 0)
        message = ['WARNING: This test tested for inequality, but the ',...
            data_type_2,' ARE equal to ',num2str(n_equal),...
            ' decimal places.'];
    elseif ~passed && (n_equal > 0) && (n_equal < n)
        message = [data_type_1,' are equal to ',num2str(n_equal),...
            ' decimal places.\n    >>>> ',data_type_1,...
            ' are NOT equal to ',num2str(n),' decimal places.'];
    else
        if n_equal == 100
            message = [data_type_1,' are equal to at least ',...
                num2str(n_equal),' decimal places.'];
        else
            message = [data_type_1,' are equal to ',num2str(n_equal),...
                ' decimal places.'];
        end
    end
    
    % -------------------------------
    % Parse outputs and print result.
    % -------------------------------
    
    output = produce_test_outputs(name,passed,message,print,color);
    
end