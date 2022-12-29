%==========================================================================
%
% TEST_SPEED  Test if one function is faster to evaluate than another.
%
%   TEST_SPEED(f_slow,f_fast,args)
%   TEST_SPEED(__,n_eval,name,print)
%   outputs = TEST_SPEED(__)
%
% See also TEST_TIME.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-12-28
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f_fast  - (1×1 function_handle) function handle for faster function
%   f_slow  - (1×1 function_handle) function handle for slower function
%   args    - (OPTIONAL) (cell array) input arguments to functions
%             (defaults to empty cell array)
%   n_eval  - (OPTIONAL) (1×1 double) number of times to evaluate functions
%             when determining average evaluation time (defaults to 1000)
%   name    - (OPTIONAL) (char) test name (defaults to empty string)
%   print   - (OPTIONAL) (1×1 logical) true if test result should be 
%             printed to Command Window, false otherwise (defaults to true)
%
% -------
% OUTPUT:
% -------
%   outputs - (1×1 struct) test outputs
%       • passed  - (1×1 logical) true if test passed, false otherwise
%       • result  - (char) string storing result of test
%       • message - (char) string storing additional diagnostic message if
%                   test failed
%
% -----
% NOTE:
% -----
%   --> f_fast and f_fast slow must have the same input/output behavior.
%
%==========================================================================
function outputs = TEST_SPEED(f_fast,f_slow,args,n_eval,name,print)
    
    % defaults input arguments to empty cell array
    if (nargin < 3)
        args = {};
    end
    
    % defaults number of function evaluations to 1000
    if (nargin < 4) || isempty(n_eval)
        n_eval = 1000;
    end
    
    % defaults test name to empty string
    if (nargin < 5) || isempty(name)
        name = '';
    end
    
    % defaults "print" to true if not input
    if (nargin < 6) || isempty(print)
        print = true;
    end
    
    % times functions
    time_fast = TIME_EVALUATION(f_fast,args,n_eval,false);
    time_slow = TIME_EVALUATION(f_slow,args,n_eval,false);
    
    % test passed if "faster" function was indeed faster
    passed = (time_fast < time_slow);
    
    % result string
    if passed
        result = 'Passed.';
    else
        result = 'FAILED.';
    end
    
    % diagnostic message
    if passed
        message = '';
    else
        message = 'Function that was supposed to be faster was '+...
            'actually slower.';
    end
    
    % name string
    if isempty(name)
        name_str = '';
    else
        name_str = [name,': '];
    end
    
    % prints result
    if print
        if isempty(message)
            fprintf([name_str,result,'\n']);
        else
            fprintf([name_str,result,'\n    >>>> ',message,'\n']);
        end
    end
    
    % packages test outputs into struct
    outputs.passed = passed;
    outputs.result = result;
    outputs.message = message;
    
end