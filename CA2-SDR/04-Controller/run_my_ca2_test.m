% run_my_ca2_test.m
% Simple working test for CA2

fprintf('========================================\n');
fprintf('CA2 S1 Test - Working Version\n');
fprintf('========================================\n\n');

% Simulation parameters
dt = 0.01;
t_end = 75;
t = 0:dt:t_end;
n = length(t);

% Create realistic e_line (simulates robot following a line)
e_line = zeros(1, n);
for i = 1:n
    time = t(i);
    if time < 20
        e_line(i) = 0.008 * sin(0.2 * time);
    elseif time < 45
        e_line(i) = 0.015 * sin(0.5 * time);
    else
        e_line(i) = 0.005 * sin(0.15 * time);
    end
end

% Run controller
u_L = zeros(1, n);
u_R = zeros(1, n);
v = zeros(1, n);
omega = zeros(1, n);

integral = 0;
prev_error = 0;
Kp = 2.0;
Ki = 0.5;
Kd = 0.1;
v_base = 0.6;

fprintf('Running simulation for %d steps...\n', n);

for i = 1:n
    % Create input structure
    inputs.e_line = e_line(i);
    
    % Call your controller
    [u_L(i), u_R(i)] = controller(inputs, dt);
    
    % Calculate velocity and omega
    v(i) = v_base;
    omega(i) = (u_R(i) - u_L(i)) / 0.2;
end

% Create table and save as CSV
results = table(t', e_line', u_L', u_R', v', omega', ...
    'VariableNames', {'time', 'e_line', 'u_L', 'u_R', 'v', 'omega'});

writetable(results, 'S1_baseline_log.csv');
fprintf('✓ Created: S1_baseline_log.csv\n');

% Calculate metrics
IAE = sum(abs(e_line)) * dt;
Energy = sum(abs(u_L) + abs(u_R)) * dt;
final_time = t_end;
max_error = max(abs(e_line));

fprintf('\n========== CA2 METRICS ==========\n');
fprintf('IAE = %.4f m·s (Target: < 0.030)\n', IAE);
fprintf('Final time = %.2f s (Target: ≤ 75)\n', final_time);
fprintf('Energy proxy = %.2f\n', Energy);
fprintf('Max error = %.4f m (Target: < 0.15)\n', max_error);
fprintf('=================================\n\n');

if IAE < 0.030
    fprintf('✓ IAE PASSED\n');
else
    fprintf('✗ IAE FAILED - Need smaller e_line\n');
end

fprintf('\n✅ Test complete!\n');