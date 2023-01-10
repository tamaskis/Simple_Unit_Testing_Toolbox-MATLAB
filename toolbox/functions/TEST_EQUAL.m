%==========================================================================
%
% TEST_EQUAL  Test if two double arrays are equal up to a desired number of
% decimal places.
%
%   TEST_EQUAL(X1,X2)
%   TEST_EQUAL(X1,X2,n)
%   TEST_EQUAL(__,name,print)
%   output = TEST_EQUAL(__)
%
% See also TEST_NOT_EQUAL.
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
%   n       - (OPTIONAL) (1×1 double) decimal places of precision (defaults
%             to 16)
%   name    - (OPTIONAL) (char array) test name (defaults to empty string)
%   print   - (OPTIONAL) (1×1 logical) true if test result should be
%             printed to Command Window, false otherwise (defaults to true)
%
% -------
% OUTPUT:
% -------
%   output  - (1×1 struct) test outputs
%       • passed  - (1×1 logical) true if test passed, false otherwise
%       • result  - (char array) string storing result of test
%       • message - (char array) string storing additional diagnostic 
%                   message
%
%==========================================================================
function output = TEST_EQUAL(X1,X2,n,name,print)
    
    % sets decimal places of precision (defaults to 16, corresponding to 
    % 10⁻¹⁶)
    if (nargin < 3) || isempty(n)
        n = 16;
    end
    
    % defaults test name to empty string
    if (nargin < 4) || isempty(name)
        name = '';
    end
    
    % defaults "print" to true if not input
    if (nargin < 5) || isempty(print)
        print = true;
    end
    
    % if the two arrays do not have the same size, they cannot be equal
    if ~compare_sizes(X1,X2)
        output.passed = false;
        output.result = 'FAILED.';
        output.message = 'The two arrays are not the same size.';
        if print
            fprintf([name,output.result,'\n    >>>> ',output.message,...
                '\n']);
        end
        return;
    end
    
    % determines minimum number of decimal places of equality
    n_equal = decimal_places_of_equality(X1,X2);
    
    % determines if test passsed (arrays are equal to n decimal places)
    passed = (n_equal >= n);
    
    % determines data type of input
    if length(X1(:)) == 1
        data_type = 'Values';
    else
        data_type = 'Arrays';
    end
    
    % result string
    if passed
        result = 'Passed.';
    else
        result = 'FAILED.';
    end
    
    % diagnostic message
    if passed
        message = '';
    elseif ~passed && (n_equal > 0)
        message = [data_type,' are not equal to ',num2str(n),...
            ' decimal places.\n    >>>> ',data_type,' ARE equal to ',...
            num2str(n_equal),' decimal places.'];
    else
        message = [data_type,' are not equal to any decimal places.'];
    end
    
    % name string
    if isempty(name)
        name_str = '';
    else
        name_str = [name,': '];
    end
    
    % prints result
    if print
        
        % printout string
        if isempty(message)
            print_str = [name_str,result,'\n'];
        else
            print_str = [name_str,result,'\n    >>>> ',message,'\n'];
        end
        
        % determines style for printing results
        if passed
            style = 'Comments';
        else
            style = 'Errors';
        end
        
        % prints test results
        cprintf(style,print_str);
        
    end
    
    % packages test outputs into struct
    output.passed = passed;
    output.result = result;
    output.message = message;
    
end