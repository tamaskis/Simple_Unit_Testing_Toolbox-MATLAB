%==========================================================================
%
% TestFunctionCount  Unit test for confirming that the reported number of
% function evaluations equals the true number of function evaluations.
%
% See also UnitTest.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-01-14
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestFunctionCount < UnitTest
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestFunctionCount(f,name)
            % obj = TestFunctionCount(f,args,name)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (1×1 function_handle) function to be input into 
            %             an algorithm
            %   g       - (1×1 function_handle) function that runs f 
            %             through an algorithm and returns the number of 
            %             times that f was evaluated (as reported by the 
            %             algorithm)
            %   name    - (char array) test name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestFunctionCount) TestFunctionCount object
            %
            %--------------------------------------------------------------
            
            % function handle for TEST_FUNCTION_COUNT function
            UNIT_TEST = @(f,g,name) TEST_FUNCTION_COUNT(f,g,name);
            
            % initializes TestFunctionCount object (subclass of UnitTest)
            obj@UnitTest(UNIT_TEST,{f,g},name);
            
        end
        
    end
    
end