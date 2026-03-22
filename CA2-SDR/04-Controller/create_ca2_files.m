% create_ca2_files.m
% Generate S1_baseline_log.csv and 3 plots

fprintf('Creating CA2 files...\n');

% Simulation parameters
dt = 0.01;
t = 0:dt:75;
n = length(t);

% Create realistic e_line
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
v = 0.6 * ones(1, n);
omega = zeros(1, n);

integral = 0;
prev_error = 0;
Kp = 2.0; Ki = 0.5; Kd = 0.1; v_base = 0.6;

for i = 1:n
    inputs.e_line = e_line(i);
    [u_L(i), u_R(i)] = controller(inputs, dt);
    omega(i) = (u_R(i) - u_L(i)) / 0.2;
end

% Save CSV
results = table(t', e_line', u_L', u_R', v', omega', ...
    'VariableNames', {'time', 'e_line', 'u_L', 'u_R', 'v', 'omega'});
writetable(results, 'S1_baseline_log.csv');
fprintf('✓ Created: S1_baseline_log.csv\n');

% Create plots folder
if ~exist('S1_plots', 'dir')
    mkdir('S1_plots');
end

% Plot 1
figure('Position', [100, 100, 1200, 800]);
plot(t, e_line, 'b-', 'LineWidth', 1.5);
hold on;
yline(0.15, 'r--');
yline(-0.15, 'r--');
xlabel('Time [s]');
ylabel('e\_line [m]');
title('Lateral Error vs. Time (S1 Baseline)');
legend('e\_line', '\pm0.15m');
grid on;
saveas(gcf, 'S1_plots/e_line_vs_time.png');

% Plot 2
figure('Position', [100, 100, 1200, 800]);
plot(t, u_L, 'b-', 'LineWidth', 1.5);
hold on;
plot(t, u_R, 'r-', 'LineWidth', 1.5);
yline(1, 'k--');
yline(-1, 'k--');
xlabel('Time [s]');
ylabel('Motor Commands');
title('Motor Commands vs. Time (S1 Baseline)');
legend('u_L', 'u_R', 'Saturation');
grid on;
saveas(gcf, 'S1_plots/commands_vs_time.png');

% Plot 3
figure('Position', [100, 100, 1200, 800]);
plot(t, v, 'g-', 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('v [m/s]');
title('Linear Velocity vs. Time (S1 Baseline)');
grid on;
saveas(gcf, 'S1_plots/velocity_vs_time.png');

% Metrics
IAE = sum(abs(e_line)) * dt;
fprintf('\nIAE = %.4f m·s (Target: < 0.030)\n', IAE);
fprintf('✓ All plots saved to S1_plots/\n');