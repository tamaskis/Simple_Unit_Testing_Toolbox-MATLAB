%==========================================================================
%
% TestNoError  Unit test for confirming that a function does not throw an 
% error.
%
% See also UnitTest, TestEqual, TestNotEqual, TestError, TestSpeed.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-12-29
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestNoError < UnitTest
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestNoError(f,args,name)
            % obj = TestNoError(f,args,name)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (1×1 function_handle) function handle assigned to 
            %             function you want to test
            %   args    - (cell array) input arguments to f
            %   name    - (char) test name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestNoError) TestNoError object
            %
            %--------------------------------------------------------------
            
            % function handle for TEST_NO_ERROR function
            UNIT_TEST = @(f,args,name) TEST_NO_ERROR(f,args,name,false);
            
            % initializes TestNoError object (subclass of UnitTest)
            obj@UnitTest(UNIT_TEST,{f,args},name);
            
        end
        
    end
    
end