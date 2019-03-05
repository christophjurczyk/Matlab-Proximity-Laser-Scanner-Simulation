% -----------------------------------------------------------
% File:         clPoint.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Class for cartesian point
% -----------------------------------------------------------

classdef clPoint   
    properties
        x
        y
    end%properties
    
    methods
        function obj = clPoint(varargin)
            % Intialization of object
            if nargin == 2
                obj.x = varargin{1,1};
                obj.y = varargin{1,2};
            end%if
            
        end%function
    end%methods
end%classdef

