% -----------------------------------------------------------
% File:         initPoints.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Function to initialize PLS points with max distance points
% -----------------------------------------------------------

function PLSdataArray = initPoints(pls_n, pls_res, pls_x, pls_y, pls_angle, max_dist)
    PLSdataArray(1:pls_n) = clPointPLS;
    for n = 1:length(PLSdataArray)
        angle = (n-1) * pls_res + pls_angle;
        x = max_dist*cos(deg2rad(angle)) + pls_x;
        y = max_dist*sin(deg2rad(angle)) + pls_y;
        PLSdataArray(n) = clPointPLS(x,y,angle);
    end%for
end%function