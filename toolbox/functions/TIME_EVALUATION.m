%==========================================================================
%
% TIME_EVALUATION  Time the evaluation of a function.
%
%   TIME_EVALUATION(f)
%   TIME_EVALUATION(f,args)
%   TIME_EVALUATION(f,args,n_eval)
%   TIME_EVALUATION(__,print)
%   time = TIME_EVALUATION(__)
%
% See also TEST_SPEED.
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
%   f       - (1×1 function_handle) function handle assigned to function
%             you want to time
%   args    - (OPTIONAL) (cell array) input arguments to functions
%             (defaults to empty cell array)
%   n_eval  - (OPTIONAL) (1×1 double) number of times to evaluate functions
%             when determining average evaluation time (defaults to 1000)
%   print   - (OPTIONAL) (1×1 logical) true if function evaluation time
%             should be printed to Command Window, false otherwise
%             (defaults to true)
%
% -------
% OUTPUT:
% -------
%   time    - (1×1 double) average function evaluation time
%
%==========================================================================
function time = TIME_EVALUATION(f,args,n_eval,print)
    
    % -------------
    % Parse inputs.
    % -------------
    
    % defaults input arguments to empty cell array
    if (nargin < 2) || isempty(args)
        args = {};
    end
    
    % defaults number of function evaluations to 1000
    if (nargin < 3) || isempty(n_eval)
        n_eval = 1000;
    end
    
    % defaults "print" to true
    if (nargin < 4) || isempty(print)
        print = true;
    end
    
    % ----------------
    % Time evaluation.
    % ----------------
    
    tic;
    for i = 1:n_eval
        f(args{:});
    end
    time = toc/n_eval;
    
    % -------------
    % Print result.
    % -------------
    
    if print
        fprintf(['Average function evaluation time: ',num2str(time),...
            ' s\n']);
    end
    
end