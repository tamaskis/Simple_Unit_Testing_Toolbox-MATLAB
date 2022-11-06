%==========================================================================
%
% UnitTest  Class defining a unit test.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-11-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef UnitTest < handle
    
    % -----------
    % Properties.
    % -----------
    
    properties
        test_args   % (cell array) inputs to testing function
        name        % (char) test name
        type        % (char) test type
        passed      % (1×1 logical) true if test passed, false otherwise
    end
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = UnitTest(test_args,name,type)
            % obj = UnitTest(X1,X2,name,type,n)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   test_args   - (cell array) inputs to testing function
            %   name        - (char) test name
            %   type        - (char) test type ('equal', 'not equal', 
            %                 'error', or 'no error')
            %
            % -------
            % OUTPUT:
            % -------
            %   obj         - (1×1 UnitTest) UnitTest object
            %
            %--------------------------------------------------------------
            
            % stores inputs
            obj.test_args = test_args;
            obj.name = name;
            obj.type = type;
            
            % "passed" initialized to false (test cannot have passed before
            % it was run)
            obj.passed = false;
            
        end
        
        function n_passed = run(obj,n_passed,n_run)
            % UnitTest.run
            %
            % Runs the test.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   n_passed    - (1×1 double) number of tests that have passed
            %                 thus far
            %   n_run       - (1×1 double) number of tests that have been
            %                 run thus far
            %
            % -------
            % OUTPUT:
            % -------
            %   n_passed    - (1×1 double) updated number of tests that
            %                 have passed thus far
            %
            %--------------------------------------------------------------
            
            % runs test
            if strcmpi(obj.type,'equal')
                [obj.passed,result,message] = TEST_EQUAL(...
                    obj.test_args{1},obj.test_args{2},obj.test_args{3},...
                    obj.name,false);
            elseif strcmpi(obj.type,'not equal')
                [obj.passed,result,message] = TEST_NOT_EQUAL(...
                    obj.test_args{1},obj.test_args{2},obj.test_args{3},...
                    obj.name,false);
            elseif strcmpi(obj.type,'error')
                [obj.passed,result,message] = TEST_ERROR(...
                    obj.test_args{1},obj.test_args{2},obj.name,false);
            elseif strcmpi(obj.type,'no error')
                [obj.passed,result,message] = TEST_NO_ERROR(...
                    obj.test_args{1},obj.test_args{2},obj.name,false);
            end
            
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
            
            % prints test results
            fprintf(print_str);
            
        end
        
    end
    
end