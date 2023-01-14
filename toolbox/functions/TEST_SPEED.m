%==========================================================================
%
% TEST_SPEED  Test if one function is faster to evaluate than another.
%
%   TEST_SPEED(f_fast,f_slow)
%   TEST_SPEED(f_fast,f_slow,args)
%   TEST_SPEED(f_fast,f_slow,args,n_eval)
%   TEST_SPEED(__,name,print)
%   output = TEST_SPEED(__)
%
% See also TIME_EVALUATION.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-01-14
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
% -----
% NOTE:
% -----
%   --> f_fast and f_fast slow must have the same input/output behavior.
%
%==========================================================================
function output = TEST_SPEED(f_fast,f_slow,args,n_eval,name,print)
    
    % defaults input arguments to empty cell array
    if (nargin < 3) || isempty(args)
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
        message = ['Average evaluation time for function specified as ',...
            'faster function: ',num2str(time_fast),' s\n    >>>> ',...
            'Average evaluation time for function specified as slower ',...
            'function: ',num2str(time_slow),' s'];
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