% -----------------------------------------------------------
% File:         clObstacle.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Class for obstacles
%
%   Box:
%   clObstacle('box',x1,y1,x2,y2)
%
%          x...........x <- x2|y2
%          .           .
%          .           .
% x1|y1 -> x...........x
%
%   Cylinder:
%   clObstacle('cylinder',x1,y1,r)
%
%   P=(x1|y1) and r=radius
%               *           
%         * * * * * * *     
%       * * * * * * * * *   
%       * * * * * * * * *   
%       * * * * * * * * *   
%     * * * * * P----r--->* 
%       * * * * * * * * *   
%       * * * * * * * * *   
%       * * * * * * * * *   
%         * * * * * * *     
%               *           
% -----------------------------------------------------------

classdef clObstacle
    properties
        type
        P1
        P2
        radius
        color = [1 0 0 0.1];
    end%properties
    
    methods
        function obj = clObstacle(varargin)
            obj.type = varargin{1,1};
            if strcmp(obj.type,'box')
                if nargin == 3
                    % Expected input: 2x clPoint
                    obj.P1 = varargin{1,2};
                    obj.P2 = varargin{1,3};
                    if(~isa(obj.P1,'clPoint') || ~isa(obj.P2,'clPoint'))
                        error('Please chek class type of P1 and P2!')
                    end%for
                elseif nargin == 5
                    % Expected input: x1, y1, x2, y2
                    obj.P1 = clPoint(varargin{1,2}, varargin{1,3});
                    obj.P2 = clPoint(varargin{1,4}, varargin{1,5});
                end%if
                
            elseif strcmp(obj.type,'cylinder')
                if nargin == 3
                    % Expected input: 2x clPoint
                    obj.P1 = varargin{1,2};
                    obj.radius = varargin{1,3};
                    if(~isa(obj.P1,'clPoint'))
                        error('Please chek class type of P1 and P2!')
                    end%for
                elseif nargin == 4
                    obj.P1 = clPoint(varargin{1,2}, varargin{1,3});
                    obj.radius = varargin{1,4};
                end%if
            else
                % empty initialization
                return;
            end%if
            

        end%function
        
        % Function to draw obstacle in plot
        function draw(obj)              
            if strcmp(obj.type,'box')            
                rectangle('Position',...
                          [obj.P1.x obj.P1.y...
                           abs(obj.P2.x-obj.P1.x) abs(obj.P2.y-obj.P1.y)],...
                           'FaceColor',obj.color)
            elseif strcmp(obj.type,'cylinder')  
                pos = [obj.P1.x-obj.radius obj.P1.y-obj.radius 2*obj.radius 2*obj.radius]; 
                rectangle('Position',pos,'Curvature',[1 1],'FaceColor',obj.color)
            else
                error('No type declared!')
            end%if
        end%function
        
        % Function to check if Point is in box
        function result = checkPoint(obj, point)
            result = false;            
            
            if strcmp(obj.type,'box')            
                if((point.x >= obj.P1.x) && (point.x < obj.P2.x))
                    if((point.y >= obj.P1.y) && (point.y < obj.P2.y))
                        % point in box
                        result = true;
                    end%if
                end%if
            elseif strcmp(obj.type,'cylinder')  
                distance = sqrt((obj.P1.x-point.x)^2 + (obj.P1.y-point.y)^2);            
                if(distance < obj.radius)
                        result = true;
                end%if
            else
                error('No type declared!')
            end%if
   
        end%function
  
        
    end%methods
end%classdef