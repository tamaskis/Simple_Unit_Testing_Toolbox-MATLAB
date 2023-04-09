%==========================================================================
%
% floorn  Round down (toward negative infinity) to n digits.
%
%   y = floorn(x,n)
%
% See also ceil, floor, round, roundn, ceiln.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-07-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   x       - (double array of any size) number(s) to round down
%   n       - (1×1 double) number of digits to round to (matches convention
%             used by the built-in "round(x,n)" function)
%               --> n > 0: round down to n digits to right of decimal point
%               --> n = 0: round down to nearest integer
%               --> n < 0: round down to n digits to left of decimal point
%
% -------
% OUTPUT:
% -------
%   y       - (double array of same size as "x") elements of x rounded down 
%             to nearest multiple of 10^n.
%
%==========================================================================
function y = floorn(x,n)
    t = 10.^n;
    y = floor(x.*t)./t;
end