%==========================================================================
%
% TestEqual  Class defining a test that tests for array inequality to a
% certain number of decimal places.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-29
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestNotEqual < handle
    
    % -----------
    % Properties.
    % -----------
    
    properties
        X1      % (double array) double array #1
        X2      % (double array) double array #2
        n       % (1×1 double) decimal places of precision
        name    % (char) test name
        passed  % (1×1 double) determines if test passed
    end
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestEqual(X1,X2,n,name)
            % obj = TestEqual(X1,X2,n,name)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   X1      - (double array) double array #1
            %   X2      - (double array) double array #2
            %   n       - (OPTIONAL) (1×1 double) decimal places of 
            %             precision
            %   name    - (OPTIONAL) (char) test name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestEqual) unit test object
            %
            %--------------------------------------------------------------
            
            % sets decimal places of precision (defaults to 16, 
            % corresponding to 10⁻¹⁶)
            if (nargin < 3) || isempty (n)
                obj.n = 16;
            end
            
            % appends colon to test name if input, otherwise defaults test 
            % name to empty string
            if (nargin < 4) || isempty(name)
                obj.name = '';
            else
                obj.name = strcat(name,': ');
            end
            
            % stores double arrays
            obj.X1 = X1;
            obj.X2 = X2;
            
            % initializes "passed" to false (cannot pass test before it is
            % run)
            obj.passed = false;
            
        end
        
        function obj = run_test(obj)
            % TestEqual.run_test
            %
            % Runs the unit test.
            %--------------------------------------------------------------
            obj.passed = TEST_EQUAL(obj.X1,obj.X1,obj.n,obj.name);
        end
        
    end
    
end