%==========================================================================
%
% TEST_ERROR  Test if an error is successfully thrown.
%
%   TEST_ERROR(f)
%   TEST_ERROR(f,args)
%   TEST_ERROR(__,name,print)
%   outputs = TEST_ERROR(__)
%
% See also TEST_NO_ERROR.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-11-05
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
%   args    - (OPTIONAL) (cell array) input arguments to f (no default
%             value needed)
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
%   --> A function handle can only have one return value. However, we can
%       still assign function handles to functions that have multiple
%       return values (in that case, the function handle will just return
%       the first return value). Since this test is geared towards ensuring
%       that a function correctly throws errors when subject to specific
%       inputs, we do not care about any return values.
%
%==========================================================================
function outputs = TEST_ERROR(f,args,name,print)
    
    % defaults test name to empty string
    if (nargin < 3) || isempty(name)
        name = '';
    end
    
    % defaults "print" to true if not input
    if (nargin < 4) || isempty(print)
        print = true;
    end
    
    % determines if f has any input arguments
    f_has_inputs = (nargin >= 2) && ~isempty(args);
    
    % assumes error is not thrown
    error_thrown = false;
    
    % if error is in fact thrown, "error_thrown" is updated accordingly
    try
        if f_has_inputs
            f(args{:});
        else
            f;
        end
    catch
        error_thrown = true;
    end
    
    % test passed if error was thrown
    passed = error_thrown;
    
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
        message = 'Function did not throw an error.';
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