%==========================================================================
%
% produce_test_outputs  Produces the outputs for a single test.
%
%   output = produce_test_outputs(name,passed,message,print,color)
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
%   name    - (char array) test name
%   result  - (char array) test result
%   message - (char array) additional diagnostic message
%   print   - (1×1 logical) true if test result should be printed to
%             Command Window, false otherwise
%   color   - (1×1 logical) true if test result should be printed in color,
%             false otherwise
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
function output = produce_test_outputs(name,passed,message,print,color)
    
    % result string
    if passed
        result = 'Passed.';
    else
        result = 'FAILED.';
    end
    
    % prints result
    if print
        print_test_result(name,passed,result,message,color);
    end
    
    % packages test outputs into struct
    output.passed = passed;
    output.result = result;
    output.message = message;
    
end