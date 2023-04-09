%==========================================================================
%
% doc_SUTT  Opens the documentation for the Simple Unit Testing Toolbox.
%
%   doc_SUTT
%   doc_SUTT name
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
%   name   - (char) name of the function or class
%
%==========================================================================
function doc_SUTT(name)
    
    % opens index if no function name specified
    if nargin == 0
        web('html_SUTT/index.html');
        
    % opens specified function documentation
    else
        web(['html_SUTT/',name,'_doc.html']);
        
    end
    
end