%==========================================================================
%
% TIME_EVALUATION  Time the evaluation of a function.
%
%   TIME_EVALUATION(f,args)
%   TIME_EVALUATION(__,n_eval,print)
%   time = TIME_EVALUATION(__)
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-12-29
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) function handle
%   args    - (cell array) input arguments to functions
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
    
    % defaults number of function evaluations to 1000
    if (nargin < 3) || isempty(n_eval)
        n_eval = 1000;
    end
    
    % defaults "print" to true if not input
    if (nargin < 4) || isempty(print)
        print = true;
    end
    
    % times function
    tic;
    for i = 1:n_eval
        f(args{:});
    end
    time = toc/n_eval;
    
    % prints result
    if print
        fprintf(['Average function evaluation time: ',num2str(time),' s']);
    end
    
end