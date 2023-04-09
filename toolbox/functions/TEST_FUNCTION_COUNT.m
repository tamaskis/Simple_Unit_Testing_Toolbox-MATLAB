%==========================================================================
%
% TEST_FUNCTION_COUNT  Test if an algorithm operating on a function
% correctly counts the number of function evaluations.
%
%   TEST_FUNCTION_COUNT(f,g)
%   TEST_FUNCTION_COUNT(f,g,name,print,color)
%   output = TEST_FUNCTION_COUNT(__)
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
%   f       - (1×1 function_handle) function to be input into an algorithm
%   g       - (1×1 function_handle) function that runs f through an
%             algorithm and returns the number of times that f was 
%             evaluated (as reported by the algorithm)
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
function output = TEST_FUNCTION_COUNT(f,g,name,print,color)
    
    % -------------
    % Parse inputs.
    % -------------
    
    % defaults test name to empty string
    if (nargin < 3) || isempty(name)
        name = '';
    end
    
    % defaults "print" to true
    if (nargin < 4) || isempty(print)
        print = true;
    end
    
    % defaults "color" to true
    if (nargin < 5) || isempty(color)
        color = true;
    end
    
    % ---------
    % Run test.
    % ---------
    
    % turns f into a counted function
    [f,f_count_actual] = CountedFunction.count_function_calls(f);
    
    % calls g(f) and returns the number of times an algorithhm thinks that
    % f is called
    f_count = g(f);
    
    % test passes if both counts are the same
    passed = (f_count == f_count_actual());
    
    % -------------------
    % Diagnostic message.
    % -------------------
    
    if passed
        message = '';
    else
        message = ['Function count is incorrect:\n          • True ',...
            'number of function evaluations: ',...
            num2str(f_count_actual()),'\n          • ','Reported ',...
            'number of function evaluations: ',num2str(f_count)];
    end
    
    % -------------------------------
    % Parse outputs and print result.
    % -------------------------------
    
    output = produce_test_outputs(name,passed,message,print,color);
    
end