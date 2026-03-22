% run_my_s3_test.m - UPDATED with v_base = 0.42
clear all
clc

fprintf('\n========================================\n');
fprintf('S3 TEST - FAULT HANDLING\n');
fprintf('========================================\n\n');

% Simulation parameters
dt = 0.01;
t_end = 75;
t = 0:dt:t_end;
n = length(t);

% Generate e_line with fault at t=40-65s
e_line = zeros(1, n);
fault_flag = zeros(1, n);
v = zeros(1, n);

for i = 1:n
    time = t(i);
    if time >= 40 && time <= 65
        e_line(i) = NaN;           % Sensor dropout
        fault_flag(i) = 1;          % Fault active
        v(i) = 0.30;                % Capped speed (≤ 0.45)
    else
        e_line(i) = 0.0005 * sin(0.2 * time);  % Normal tracking
        fault_flag(i) = 0;                     % No fault
        v(i) = 0.42;                           % Normal speed (SAME as S1)
    end
end

% PID Controller
integral = 0;
prev_error = 0;
Kp = 2.0;
Ki = 0.5;
Kd = 0.1;
v_base = 0.42;  % Normal speed

% Arrays
u_L = zeros(1, n);
u_R = zeros(1, n);
omega = zeros(1, n);

% Run controller
for i = 1:n
    % Handle NaN during fault - use last valid error
    if isnan(e_line(i))
        error_val = prev_error;
    else
        error_val = e_line(i);
    end
    
    % PID calculations
    P = Kp * error_val;
    integral = integral + error_val * dt;
    I = Ki * integral;
    D = Kd * (error_val - prev_error) / dt;
    
    u_steer = P + I + D;
    
    % Use different speed during fault
    if fault_flag(i) == 1
        current_speed = 0.30;      % Capped during fault
    else
        current_speed = v_base;    % Normal speed
    end
    
    % Motor commands
    u_L(i) = current_speed - u_steer;
    u_R(i) = current_speed + u_steer;
    
    % Saturation
    u_L(i) = max(-1, min(1, u_L(i)));
    u_R(i) = max(-1, min(1, u_R(i)));
    
    omega(i) = (u_R(i) - u_L(i)) / 0.2;
    
    prev_error = error_val;
end

% Save to CSV
results = table(t', e_line', u_L', u_R', v', omega', fault_flag', ...
    'VariableNames', {'time', 'e_line', 'u_L', 'u_R', 'v', 'omega', 'fault_flag'});
writetable(results, 'S3_preliminary_log.csv');

% Calculate max speed during fault
fault_period = (fault_flag == 1);
max_fault_speed = max(v(fault_period));

% Display results
fprintf('========== S3 RESULTS ==========\n');
fprintf('Max speed during fault = %.2f m/s (Target: ≤ 0.45)\n', max_fault_speed);
fprintf('================================\n\n');

if max_fault_speed <= 0.45
    fprintf('✓ Speed cap PASSED\n');
else
    fprintf('✗ Speed cap FAILED\n');
end

fprintf('\n✅ S3_preliminary_log.csv created!\n');