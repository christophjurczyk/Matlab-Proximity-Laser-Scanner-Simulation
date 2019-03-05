% -----------------------------------------------------------
% File:         checkPinBoxes.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Function to check if point is blocked by obstacle
% -----------------------------------------------------------

function colidation = checkPinBoxes(P_check, obstacles)
 colidation = false;
    for n = 1:length(obstacles)
        result = obstacles(n).checkPoint(P_check);
        if result == true
            colidation = true;
            break;
        end%if
    end%for  
end%for