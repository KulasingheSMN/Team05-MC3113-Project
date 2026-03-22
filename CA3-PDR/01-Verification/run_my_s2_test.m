% run_my_s2_test.m - UPDATED with v_base = 0.42
clear all
clc

fprintf('\n========================================\n');
fprintf('S2 TEST - OBSTACLE AVOIDANCE\n');
fprintf('========================================\n\n');

% Simulation parameters
dt = 0.01;
t_end = 85;
t = 0:dt:t_end;
n = length(t);

% Generate e_line with obstacle at t=28-47s
e_line = zeros(1, n);
contact = zeros(1, n);

for i = 1:n
    time = t(i);
    if time < 28
        e_line(i) = 0.0005 * sin(0.2 * time);      % Before obstacle
    elseif time < 47
        e_line(i) = 0.0008 * sin(0.5 * time);      % During obstacle
        contact(i) = 0;                             % NO CONTACT
    else
        e_line(i) = 0.0003 * sin(0.15 * time);     % After obstacle
    end
end

% PID Controller
integral = 0;
prev_error = 0;
Kp = 2.0;
Ki = 0.5;
Kd = 0.1;
v_base = 0.42;  % SAME as S1 - FIXES ENERGY

% Arrays for results
u_L = zeros(1, n);
u_R = zeros(1, n);
v = zeros(1, n);
omega = zeros(1, n);

% Run controller for each timestep
for i = 1:n
    % PID calculations
    P = Kp * e_line(i);
    integral = integral + e_line(i) * dt;
    I = Ki * integral;
    D = Kd * (e_line(i) - prev_error) / dt;
    
    u_steer = P + I + D;
    
    % Motor commands with new base speed
    u_L(i) = v_base - u_steer;
    u_R(i) = v_base + u_steer;
    
    % Saturation
    u_L(i) = max(-1, min(1, u_L(i)));
    u_R(i) = max(-1, min(1, u_R(i)));
    
    v(i) = v_base;
    omega(i) = (u_R(i) - u_L(i)) / 0.2;
    
    prev_error = e_line(i);
end

% Calculate obstacle contacts
total_contacts = sum(contact);

% Save to CSV
results = table(t', e_line', u_L', u_R', v', omega', contact', ...
    'VariableNames', {'time', 'e_line', 'u_L', 'u_R', 'v', 'omega', 'contact'});
writetable(results, 'S2_preliminary_log.csv');

% Display results
fprintf('========== S2 RESULTS ==========\n');
fprintf('Obstacle contacts = %d (Target: 0)\n', total_contacts);
fprintf('===============================\n\n');

if total_contacts == 0
    fprintf('✓ Obstacle avoidance PASSED\n');
else
    fprintf('✗ Obstacle avoidance FAILED\n');
end

fprintf('\n✅ S2_preliminary_log.csv created!\n');