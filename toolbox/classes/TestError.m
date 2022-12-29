%==========================================================================
%
% TestError  Unit test for confirming that a function throws an error.
%
% See also UnitTest, TestEqual, TestNotEqual, TestNoError, TestSpeed.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-12-29
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
            %   f       - (1×1 function_handle) function handle assigned to 
            %             function you want to test
            %   args    - (cell array) input arguments to f (if f has no
            %             input arguments, then input args as {})
            %   name    - (char) test name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestError) TestError object
            %
            %--------------------------------------------------------------
            
            % function handle for TEST_ERROR function
            UNIT_TEST = @(f,args,name) TEST_ERROR(f,args,name,false);
            
            % initializes TestError object (subclass of UnitTest)
            obj@UnitTest(UNIT_TEST,{f,args},name);
            
        end
        
    end
    
end