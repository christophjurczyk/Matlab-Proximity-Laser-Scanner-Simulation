% -----------------------------------------------------------
% File:         calcPLSdata.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Function to calculate PLS measurements with map data
% -----------------------------------------------------------

function PLSdataArray = calcPLSdata(PLSdataArray, pls_x, pls_y, obstacles, sim_grid, max_dist)
    for n = 1:length(PLSdataArray)
        angle = PLSdataArray(n).angle;
        for dist = 0:sim_grid:max_dist
            x = dist*cos(deg2rad(angle)) + pls_x;
            y = dist*sin(deg2rad(angle)) + pls_y;
            %plot(x,y,'r*') % Plot checked point for debugging
            P_check = clPoint(x,y);

            result = checkPinBoxes(P_check, obstacles);

            if result
                PLSdataArray(n) = clPointPLS(x,y,angle,dist);
                break;
            end%if

        end%for
    end%for
end%function