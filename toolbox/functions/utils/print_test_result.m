%==========================================================================
%
% print_test_result  Prints a test result to the command window.
%
%   print_test_result(name,result,message)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-01-14
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% DEPENDENCIES:
%   • (OPTIONAL) cprintf (https://www.mathworks.com/matlabcentral/fileexchange/24093-cprintf-display-formatted-colored-text-in-command-window)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   name    - (char array) test name
%   result  - (char array) test result
%   message - (char array) additional diagnostic message
%   color   - (OPTIONAL) (1×1 logical) true if test result should be
%             printed in color, false otherwise (defaults to true)
%
%==========================================================================
function print_test_result(name,result,message,color)
    
    % -------------
    % Parse inputs.
    % -------------
    
    % updates name string
    if isempty(name)
        name = '';
    else
        name = [name,': '];
    end
    
    % printout string
    if isempty(message)
        print_str = [name,result,'\n'];
    else
        print_str = [name,result,'\n    >>>> ',message,'\n'];
    end
    
    % prints test results using cprintf
    if color
        
        % determines style for printing results
        if passed
            style = 'Comments';
        else
            style = 'Errors';
        end
        
        % prints test results
        cprintf(style,print_str);
        
    % prints test results using fprintf
    else
        fprintf(print_str);
    end
    
end