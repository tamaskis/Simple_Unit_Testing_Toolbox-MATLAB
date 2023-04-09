%==========================================================================
%
% UnitTest  Class defining a unit test.
%
% See also TestEqual, TestNotEqual, TestError, TestNoError, TestSpeed.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-04-09
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] https://stackoverflow.com/questions/19900418/how-do-i-create-an-array-of-abstract-class-objects-in-matlab
%   [2] https://www.mathworks.com/help/matlab/matlab_oop/heterogeneous-arrays.html
%
%==========================================================================

classdef UnitTest < handle & matlab.mixin.Heterogeneous
    
    % -----------
    % Properties.
    % -----------
    
    properties
        UNIT_TEST   % (1×1 function_handle) function handle assigned to unit test function
        test_args   % (cell array) input arguments to unit test function
        name        % (char array) test name
        passed      % (1×1 logical) true if test passed, false otherwise
    end
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = UnitTest(UNIT_TEST,test_args,name)
            % obj = UnitTest(UNIT_TEST,test_args,name)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   UNIT_TEST   - (1×1 function_handle) unit test function
            %   test_args   - (cell array) unit test function inputs
            %   name        - (char array) test name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj         - (1×1 UnitTest) UnitTest object
            %
            %--------------------------------------------------------------
            
            % stores inputs
            obj.UNIT_TEST = UNIT_TEST;
            obj.test_args = test_args;
            obj.name = name;
            
            % "passed" initialized to false (test cannot have passed before
            % it is run)
            obj.passed = false;
            
        end
        
        function n_passed = run(obj,n_passed,n_run,color)
            % n_passed = UnitTest.run(n_passed,n_run,color)
            %
            % Runs the unit test and prints the results to the Command
            % Window.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   n_passed    - (1×1 double) number of tests that have passed
            %                 so far
            %   n_run       - (1×1 double) number of tests that have been
            %                 run so far
            %   color       - (1×1 logical) true if test result should be
            %                 printed in color, false otherwise
            %
            % -------
            % OUTPUT:
            % -------
            %   n_passed    - (1×1 double) updated number of tests that
            %                 have passed so far
            %
            %--------------------------------------------------------------
            
            % runs test
            output = obj.UNIT_TEST(obj.test_args{:},obj.name);
            
            % extracts outputs
            obj.passed = output.passed;
            result = output.result;
            message = output.message;
            
            % increments number of passed tests results if test passed
            if obj.passed, n_passed = n_passed + 1; end
            
            % determines if (# passed) / (# run) ratio should be printed
            ratio = (nargin == 3) && ~isempty(n_passed) &&...
                ~isempty(n_run);
            
            % name string
            if isempty(obj.name)
                name_str = '';
            else
                name_str = [obj.name,': '];
            end
            
            % printout string
            print_str = [name_str,result];
            if ratio
                print_str = [print_str,' (',num2str(n_passed),'/',...
                    num2str(n_run),')'];
            end
            if ~isempty(message)
                print_str = [print_str,'\n    >>>> ',message];
            end
            print_str = [print_str,'\n'];
            
            % prints test results in color (using cprintf)
            if color
                
                % determines style for printing results
                if obj.passed
                    style = 'Comments';
                else
                    style = 'Errors';
                end
                
                % prints test results
                cprintf(style,print_str);
                
            % prints test results in black (using fprintf)
            else
                fprintf(print_str);
            end
            
        end
        
    end
    
end