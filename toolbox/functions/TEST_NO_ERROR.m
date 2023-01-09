%==========================================================================
%
% TEST_NO_ERROR  Test to ensure an error is NOT thrown.
%
%   TEST_NO_ERROR(f)
%   TEST_NO_ERROR(f,args)
%   TEST_NO_ERROR(__,name,print)
%   output = TEST_NO_ERROR(__)
%
% See also TEST_ERROR.
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
%   f       - (1×1 function_handle) function handle assigned to function
%             you want to test
%   args    - (OPTIONAL) (cell array) input arguments to f (defaults to
%             empty cell array)
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
%   --> A function handle can only have one return value. However, we can
%       still assign function handles to functions that have multiple
%       return values (in that case, the function handle will just return
%       the first return value). Since this test is geared towards ensuring
%       that a function does not an error when subject to specific inputs, 
%       we do not care about any return values.
%
%==========================================================================
function output = TEST_NO_ERROR(f,args,name,print)
    
    % defaults input arguments to empty cell array
    if (nargin < 2) || isempty(args)
        args = {};
    end
    
    % defaults test name to empty string
    if (nargin < 3) || isempty(name)
        name = '';
    end
    
    % defaults "print" to true if not input
    if (nargin < 4) || isempty(print)
        print = true;
    end
    
    % determines if error is thrown
    try
        f(args{:});
        error_thrown = false;
        error_str = '';
    catch error
        error_thrown = true;
        error_str = error.message;
    end
    
    % test passed if error was not thrown
    passed = ~error_thrown;
    
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
        message = ['Function threw the following error: ',error_str];
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
    output.passed = passed;
    output.result = result;
    output.message = message;
    
end