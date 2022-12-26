%==========================================================================
%
% TestEqual  Unit test for array equality to a certain number of decimal 
% places.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-11-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestSpeed < UnitTest
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestSpeed(f_fast,f_slow,args,name,n)
            % obj = TestSpeed(f_fast,f_slow,args,name,n)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f_fast  - (1×1 function_handle) function handle for faster 
            %             function
            %   f_slow  - (1×1 function_handle) function handle for slower
            %             function
            %   args    - (cell array) input arguments to functions
            %   name    - (char) test name
            %   n       - (OPTIONAL) (1×1 double) number of times to 
            %             evaluate functions when determining average 
            %             evaluation time (defaults to 1000)
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestEqual) TestEqual object
            %
            %--------------------------------------------------------------
            
            % defaults number of function evaluations to 1000
            if (nargin < 5) || isempty (n)
                n = 1000;
            end
            
            % initializes TestSpeed object (subclass of UnitTest)
            obj@UnitTest({f_fast,f_slow,args,n},name,'speed');
            
        end
        
    end
    
end