%==========================================================================
%
% TestNotEqual  Unit test for array inequality to a certain number of 
% decimal places.
%
% See also TestEqual, UnitTest.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2023-04-09
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestNotEqual < UnitTest
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestNotEqual(X1,X2,name,n)
            % obj = TestNotEqual(X1,X2,name,n)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   X1      - (double array) double array #1
            %   X2      - (double array) double array #2
            %   name    - (char array) test name
            %   n       - (OPTIONAL) (1×1 double) decimal places of 
            %             precision (defaults to 16)
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestNotEqual) TestNotEqual object
            %
            %--------------------------------------------------------------
            
            % defaults decimal places of precision to 16 (corresponding to 
            % 10⁻¹⁶)
            if (nargin < 4) || isempty (n)
                n = 16;
            end
            
            % function handle for TEST_NOT_EQUAL function
            UNIT_TEST = @(X1,X2,n,name) TEST_NOT_EQUAL(X1,X2,n,name,false);
            
            % initializes TestNotEqual object (subclass of UnitTest)
            obj@UnitTest(UNIT_TEST,{X1,X2,n},name);
            
        end
        
    end
    
end