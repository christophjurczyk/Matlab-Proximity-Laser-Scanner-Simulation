% -----------------------------------------------------------
% File:         plotObstacles.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Function to plot obstacles 
% -----------------------------------------------------------

function plotObstacles(boxes)
    for n = 1:length(boxes)
        boxes(n).draw
    end%for
end%function