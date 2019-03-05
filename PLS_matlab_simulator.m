% -----------------------------------------------------------
% File:         PLS_matlab_simulator.m
% Author:       Christoph Jurczyk
% Date:         05.03.2019
% Description:  Main file for PLS simulation
% -----------------------------------------------------------

%% ----------------------------------------------------------
% Clear workspace
clearvars
% Add subfolder with classes and functions
addpath('src')
%  ----------------------------------------------------------

%% ----------------------------------------------------------
% PLS parameters
pls_res = 1; % resolution in deg
pls_dof = 180; % degree of freedome in deg
pls_n = pls_dof / pls_res; % number of measurements
pls_max_dist = 5; % maximum distance of measurement in m
pls_x = 0; % start x-postion in m
pls_y = 0; % start y-postion in m
pls_angle = 0; % start angle in deg

% Resolution of simulation polar line
sim_grid = 5e-2; % grid size for PLS data measurement in m
sim_grid_rte = 0.15; % grid size for route path in m

% Simulation settings
auto_scaling = false; % auto scaling of plot during simulation
xlim_value = [-2.75 2.75]; % for manual scaling
ylim_value = [0 15]; % for manual scaling
%  ----------------------------------------------------------


%% ----------------------------------------------------------
% Initialize Map 
% Add some obstacles to the map
obstacles        = clObstacle('box',1,2,1.5,3); % box
obstacles(end+1) = clObstacle('box',-2,8.2,-1.5,9); % box
obstacles(end+1) = clObstacle('box',-2,11,-1.75,11.5); % box
obstacles(end+1) = clObstacle('cylinder',-1.5,6,0.5); % cylinder
obstacles(end+1) = clObstacle('box',2.5,0,2.75,15); % wall
obstacles(end+1) = clObstacle('box',-2.75,0,-2.5,15); % wall


% Intialize Route
% Route points: x, y
rte_points = [
	0,		0;
	0, 		4;
	1,      8;
	1,      10;
];
rte_data = calcRouteData(rte_points, sim_grid_rte);

% Set plot range
if auto_scaling == true
    xlim_value = [min(rte_points(:,1))-pls_max_dist max(rte_points(:,1)) + pls_max_dist];
    ylim_value = [min(rte_points(:,2)) max(rte_points(:,2)) + pls_max_dist];
end%if

% Set last run time for fps indicator
last_runtime = nan;
%  ----------------------------------------------------------

%% ----------------------------------------------------------
% Compute simulation
for n = 1:length(rte_data)
    % Start fps measurement
    tic
    % Initialize Plot
    clf
    hold on
    grid
    axis equal
    xlim(xlim_value);
    ylim(ylim_value);
    title(sprintf('fps = %.2f',1/last_runtime))

    % Set PLS coordinates from route
    pls_x = rte_data(n).x;
    pls_y = rte_data(n).y;
    pls_angle = rte_data(n).angle;
    
    % Plot obstacles
    plotObstacles(obstacles)

    % Initialize PLSdataArray with max distance points
    PLSdataArray = initPoints(pls_n, pls_res, pls_x, pls_y, pls_angle, pls_max_dist);

    % Check colidation of PLS beam
    PLSdataArray = calcPLSdata(PLSdataArray, pls_x, pls_y, obstacles, sim_grid, pls_max_dist);

    % Plot PLS data
    plsDataPlot(PLSdataArray, pls_x, pls_y, pls_angle);
    
    % Wait for plot
    pause(eps)
    
    % Save last time for fps
    last_runtime = toc;    
end%for
%  ----------------------------------------------------------