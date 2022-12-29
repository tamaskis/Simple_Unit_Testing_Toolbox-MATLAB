%==========================================================================
%
% TestSpeed  Unit test for confirming that one function is faster than
% another.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-11-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef (HandleCompatible = true) TestSpeed < UnitTest
    
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
            % -----
            % NOTE:
            % -----
            %   --> f_fast and f_fast slow must have the same input/output
            %       behavior.
            %
            %--------------------------------------------------------------
            
            % defaults number of function evaluations to 1000
            if (nargin < 5) || isempty (n)
                n = 1000;
            end
            
            % function handle for TEST_SPEED function
            UNIT_TEST = @(f_fast,f_slow,args,n,name) TEST_SPEED(f_fast,...
                f_slow,args,n,name,false);
            
            % initializes TestSpeed object (subclass of UnitTest)
            obj@UnitTest(UNIT_TEST,{f_fast,f_slow,args,n},name,'speed');
            
        end
        
    end
    
end