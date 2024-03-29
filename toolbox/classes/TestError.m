%==========================================================================
%
% TestError  Unit test for confirming that a function throws an error.
%
% See also TestNoError, UnitTest.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-04-09
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
            %   name    - (char array) test name
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