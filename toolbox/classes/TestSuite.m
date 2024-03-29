%==========================================================================
%
% TestSuite  Class defining a test suite.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-04-09
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestSuite < handle
    
    % -----------
    % Properties.
    % -----------
    
    properties
        tests       % (1×N heterogeneous UnitTest) collection of unit tests
        name        % (char array) test suite name
        N           % (1×1 double) number of tests comprising test suite
        terminate   % (1×1 logical) if true, test suite terminates after first failed test
        color       % (1×1 logical) if true, test results are printed in color
    end
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestSuite(name,terminate,color)
            % obj = TestSuite(name,terminate,color)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   name        - (OPTIONAL) (char array) test suite name 
            %                 (defaults to empty string)
            %   terminate   - (OPTIONAL) (1×1 logical) true if test suite 
            %                 should be terminated after first failed unit 
            %                 test, false if all tests should be run 
            %                 regardless of any failed tests (defaults to 
            %                 false)
            %   color       - (OPTIONAL) (1×1 logical) true if test results
            %                 should be printed in color, false otherwise
            %                 (defaults to true)
            %
            % -------
            % OUTPUT:
            % -------
            %   obj         - (1×1 TestSuite) TestSuite object
            %
            %--------------------------------------------------------------
            
            % initializes tests
            obj.tests = UnitTest.empty;
            
            % sets test suite name (defaults to empty string)
            if (nargin < 1) || isempty(name)
                obj.name = '';
            else
                obj.name = name;
            end
            
            % sets test suite termination (defaults to false)
            if (nargin < 2) || isempty(terminate)
                obj.terminate = false;
            else
                obj.terminate = terminate;
            end
            
            % sets if results printed in color (defaults to true)
            if (nargin < 3) || isempty(color)
                obj.color = true;
            else
                obj.color = color;
            end
            
            % initializes number of tests
            obj.N = 0;
            
        end
        
        function obj = add_test(obj,test)
            % TestSuite.add_test(test)
            %
            % Adds a test to the test suite.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   test    - (1×1 UnitTest) test to add to test suite
            %   type    - (char array) 'equal' or 'not equal'
            %
            %--------------------------------------------------------------
            
            % increments number of tests in test suite
            obj.N = obj.N+1;
            
            % adds test to test suite
            obj.tests(obj.N) = test;
            
        end
        
        function obj = run(obj)
            % TestSuite.run
            %
            % Runs all tests in the test suite.
            %--------------------------------------------------------------
            
            % prints blank line
            fprintf('\n');
            
            % initializes counter to count the number of passed tests
            n_passed = 0;
            
            % number of characters in longest name
            longest_name = 0;
            
            % runs all tests
            for i = 1:obj.N
                
                % runs ith test
                n_passed = obj.tests(i).run(n_passed,i,obj.color);
                
                % terminates test suite
                if obj.terminate && ~obj.tests(i).passed
                    fprintf(['\nTEST SUITE TERMINATED EARLY DUE TO ',...
                        'FAILED UNIT TEST.\n\n'])
                    return;
                end
                
                % updates longest name
                longest_name = max([longest_name,...
                    length(obj.tests(i).name)]);
                
            end
            
            % pass rate (%)
            pass_rate = round((n_passed/obj.N)*100);
            
            % line length for result printout
            line_length = max([longest_name+5,120]);
            
            % repeated ='s and -'s
            equal_str = repmat('=',[1,line_length]);
            dash_str = repmat('-',[1,line_length]);
            
            % prints summary
            fprintf(['\n',equal_str,'\n','SUMMARY: ',obj.name,'\n',...
                dash_str,'\n\n']);
            fprintf(['  Pass Rate: ',num2str(pass_rate),'%%\n']);
            fprintf(['   • total tests: ',num2str(obj.N),'\n']);
            fprintf(['   • passed tests: ',num2str(n_passed),'\n']);
            fprintf(['   • failed tests: ',num2str(obj.N-n_passed),'\n']);
            if n_passed < obj.N
                fprintf('\n');
                fprintf('  Failed Tests:\n');
                for i = 1:obj.N
                    if ~obj.tests(i).passed
                        fprintf(['   • ',obj.tests(i).name,'\n']);
                    end
                end
            end
            fprintf(['\n',equal_str,'\n']);
            
        end
        
    end
    
end