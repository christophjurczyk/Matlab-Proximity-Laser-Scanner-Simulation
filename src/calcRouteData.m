% -----------------------------------------------------------
% File:         calcRouteData.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Function to route coordinates in the route grid
% -----------------------------------------------------------

function rte_data = calcRouteData(rte_points, sim_grid)
    rte_data = clPointPLS;
    for line = 1:length(rte_points)-1
       % Calculate number of points between two points with sim_grid
       n_points = fix(sqrt((rte_points(line+1,1)-rte_points(line,1))^2 + (rte_points(line+1,2)-rte_points(line,2))^2)/sim_grid);
       % Calculate angle between points
       angle = tan((rte_points(line+1,1)-rte_points(line,1))/(rte_points(line+1,2)-rte_points(line,2)));
       % Calculate subpoints due to sim_grid between two points
       for n = 1:n_points-1
           dist = (n-1)*sim_grid;
           x = dist*sin(angle) + rte_points(line,1);
           y = dist*cos(angle) + rte_points(line,2);
           
           if isempty(rte_data(1).x)
               % overwrite first dummy points
               rte_data(1) = clPointPLS(x,y,-rad2deg(angle));
           else
               rte_data(end+1) = clPointPLS(x,y,-rad2deg(angle));
           end%if
       end%for
    end%for
end%function

