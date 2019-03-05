% -----------------------------------------------------------
% File:         clPointPLS.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Class for cartesian point with angle from origin
% -----------------------------------------------------------

classdef clPointPLS   
    properties
        x
        y
        angle
        r
    end%properties
    
    methods
        function obj = clPointPLS(varargin)
            % Intialization of object
            if nargin == 3
                obj.x = varargin{1,1};
                obj.y = varargin{1,2};
                obj.angle = varargin{1,3};
            elseif nargin == 4
                obj.x = varargin{1,1};
                obj.y = varargin{1,2};
                obj.angle = varargin{1,3};
                obj.r = varargin{1,4};
            end%if
            
        end%function
    end%methods
end%classdef

