%==========================================================================
%
% CountedFunction  Class defining a counted function.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-12-20
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef CountedFunction < handle
    
    % -----------
    % Properties.
    % -----------
    
    properties
        f       % (1×1 function_handle) function handle
        count   % (1×1 double) number of function calls
    end
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = CountedFunction(f)
            % obj = CountedFunction(f)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (1×1 function_handle) function handle
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 CountedFunction) CountedFunction object
            %
            %--------------------------------------------------------------
            obj.f = f;
            obj.count = 0;
        end
        
        function f_eval = eval(obj,varargin)
            % CountedFunction.eval(varargin)
            %
            % Evaluates the function, incrementing the count of function
            % calls.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   varargin    - (any) input argument(s)
            %
            %--------------------------------------------------------------
            f_eval = obj.f(varargin{:});
            obj.count = obj.count+1;
        end
        
    end
    
    % ---------------
    % Static methods.
    % ---------------
    
    methods(Static)
        
        function [fc,count] = count_function_calls(f)
            % [fc,count] = CountedFunction.count_function_calls(f)
            %
            % Returns a function handle that evaluates a CountedFunction.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (1×1 function_handle) original function
            %
            % -------
            % OUTPUT:
            % -------
            %   fc      - (1×1 function_handle) same function that now 
            %             calls a CountedFunction internally so that we can
            %             track the number of times it's evaluated
            %
            %--------------------------------------------------------------
            counted_function = CountedFunction(f);
            fc = @(varargin) counted_function.eval(varargin{:});
            count = @counted_function.count;
        end
        
    end
    
end