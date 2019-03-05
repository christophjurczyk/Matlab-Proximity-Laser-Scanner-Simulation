% -----------------------------------------------------------
% File:         plsDataPlot.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Function to plot PLS data 
% -----------------------------------------------------------

function plsDataPlot(PLSdataArray, pls_x, pls_y, pls_angle)
    x = [];
    y = [];
    
    for n = 1:length(PLSdataArray)
        x(end+1) = PLSdataArray(n).x;
        y(end+1) = PLSdataArray(n).y;
    end%for
    
    
    plot(x,y,'b+-')
    plot([PLSdataArray(1).x PLSdataArray(end).x],[PLSdataArray(1).y PLSdataArray(end).y],'b-')
    plot(pls_x, pls_y , 'b*')
    x = -0.5*sin(deg2rad(pls_angle));
    y = 0.5*cos(deg2rad(pls_angle));
    quiver(pls_x,pls_y,x,y,0,'g','LineWidth',2,'MaxHeadSize',3)
end%function