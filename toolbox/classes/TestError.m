%==========================================================================
%
% TestError  Unit test for confirming that a function throws an error.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestError < UnitTest
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestError(f,args,name)
            % obj = TestError(f,args,name)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (function_handle) function handle assigned to 
            %             function you want to test
            %   args    - (OPTIONAL) (cell array) input arguments to f
            %   name    - (char) test name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestError) TestError object
            %
            %--------------------------------------------------------------
            
            % defaults input arguments to empty vector
            if (nargin < 2)
                args = [];
            end
            
            % function handle for TEST_ERROR function
            UNIT_TEST = @(f,args,name) TEST_ERROR(f,args,name,false);
            
            % initializes TestError object (subclass of UnitTest)
            obj@UnitTest(UNIT_TEST,{f,args},name);
            
        end
        
    end
    
end