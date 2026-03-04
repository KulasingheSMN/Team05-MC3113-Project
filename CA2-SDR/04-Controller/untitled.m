% run_my_simulation.m
% Simple simulation to test controller and generate CSV

fprintf('Starting my own simulation...\n');

% Simulation parameters
dt = 0.01; % timestep
time = 0:dt:75; % 75 seconds
n_steps = length(time);

% Initialize arrays
e_line_history = zeros(n_steps, 1);
u_L_history = zeros(n_steps, 1);
u_R_history = zeros(n_steps, 1);
v_history = zeros(n_steps, 1);
omega_history = zeros(n_steps, 1);

% Create a simple sine wave for e_line (simulating line following)
for i = 1:n_steps
    t = time(i);
    % Simulate e_line as a sine wave (just for testing)
    e_line_history(i) = 0.1 * sin(0.1 * t);
end

% Run controller for each timestep
for i = 1:n_steps
    % Create input structure
    inputs.e_line = e_line_history(i);
    inputs.v = 0.6;
    inputs.omega = 0;
    inputs.obstacle_flag = 0;
    inputs.fault_flag = 0;
    
    % Call controller
    [u_L, u_R] = controller(inputs, dt);
    
    % Store results
    u_L_history(i) = u_L;
    u_R_history(i) = u_R;
    v_history(i) = 0.6; % constant velocity for simplicity
    omega_history(i) = (u_R - u_L) / 0.2; % rough omega calculation
end

% Create table and save as CSV
results = table(time', e_line_history, u_L_history, u_R_history, ...
                v_history, omega_history, ...
                'VariableNames', {'time', 'e_line', 'u_L', 'u_R', 'v', 'omega'});

writetable(results, 'S1_baseline_log.csv');
fprintf('Created S1_baseline_log.csv\n');

% Calculate metrics
IAE = sum(abs(e_line_history)) * dt;
Energy = sum(abs(u_L_history) + abs(u_R_history)) * dt;
final_time = time(end);

fprintf('IAE = %.4f m·s\n', IAE);
fprintf('Energy proxy = %.2f\n', Energy);
fprintf('Final time = %.2f s\n', final_time);
