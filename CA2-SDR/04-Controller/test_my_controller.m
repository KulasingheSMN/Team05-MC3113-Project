% test_my_controller.m
% Simple test script for controller

% Create a sample input structure
inputs.e_line = 0.05;
inputs.v = 0.6;
inputs.omega = 0;
inputs.obstacle_flag = 0;
inputs.fault_flag = 0;

% Test your controller
[u_L, u_R] = controller(inputs);

% Display results
fprintf('u_L = %f\n', u_L);
fprintf('u_R = %f\n', u_R);
