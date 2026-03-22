% create_correct_plots.m
% Create plots from CORRECT data

% Create plots folder if it doesn't exist
if ~exist('plots', 'dir')
    mkdir('plots');
end

%% S1 Plots
if exist('S1_verified_log.csv', 'file')
    data1 = readtable('S1_verified_log.csv');
    
    % Plot 1: Lateral Error
    figure('Position', [100, 100, 1200, 800]);
    plot(data1.time, data1.e_line, 'b-', 'LineWidth', 1.5);
    hold on;
    yline(0.15, 'r--', 'LineWidth', 1.5);
    yline(-0.15, 'r--', 'LineWidth', 1.5);
    xlabel('Time [s]', 'FontSize', 12);
    ylabel('e\_line [m]', 'FontSize', 12);
    title('S1: Lateral Error (Verified)', 'FontSize', 14);
    legend('e\_line', '\pm0.15m bound', 'Location', 'best');
    grid on;
    saveas(gcf, 'plots/S1_lateral_error.png');
    
    % Plot 2: Motor Commands
    figure('Position', [100, 100, 1200, 800]);
    plot(data1.time, data1.u_L, 'b-', 'LineWidth', 1.5);
    hold on;
    plot(data1.time, data1.u_R, 'r-', 'LineWidth', 1.5);
    yline(1.0, 'k--', 'LineWidth', 1);
    yline(-1.0, 'k--', 'LineWidth', 1);
    xlabel('Time [s]', 'FontSize', 12);
    ylabel('Motor Commands', 'FontSize', 12);
    title('S1: Motor Commands (Verified)', 'FontSize', 14);
    legend('u_L', 'u_R', 'Saturation', 'Location', 'best');
    grid on;
    saveas(gcf, 'plots/S1_motor_commands.png');
    
    fprintf('✓ S1 plots created\n');
end

%% S2 Plots
if exist('S2_preliminary_log.csv', 'file')
    data2 = readtable('S2_preliminary_log.csv');
    
    figure('Position', [100, 100, 1200, 800]);
    plot(data2.time, data2.e_line, 'b-', 'LineWidth', 1.5);
    xlabel('Time [s]', 'FontSize', 12);
    ylabel('e\_line [m]', 'FontSize', 12);
    title('S2: Lateral Error (Obstacle Scenario)', 'FontSize', 14);
    grid on;
    saveas(gcf, 'plots/S2_lateral_error.png');
    
    fprintf('✓ S2 plots created\n');
end

%% S3 Plots
if exist('S3_preliminary_log.csv', 'file')
    data3 = readtable('S3_preliminary_log.csv');
    
    figure('Position', [100, 100, 1200, 800]);
    plot(data3.time, data3.v, 'g-', 'LineWidth', 1.5);
    hold on;
    yline(0.45, 'r--', 'LineWidth', 1.5, 'Speed Cap (0.45 m/s)');
    
    % Highlight fault region
    if ismember('fault_flag', data3.Properties.VariableNames)
        fault_times = data3.time(data3.fault_flag == 1);
        if ~isempty(fault_times)
            patch([fault_times(1), fault_times(end), fault_times(end), fault_times(1)], ...
                  [0, 0, max(data3.v)*1.1, max(data3.v)*1.1], ...
                  'r', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
        end
    end
    
    xlabel('Time [s]', 'FontSize', 12);
    ylabel('v [m/s]', 'FontSize', 12);
    title('S3: Velocity Profile (Fault Scenario)', 'FontSize', 14);
    legend('Velocity', 'Speed Cap', 'Fault Period', 'Location', 'best');
    grid on;
    saveas(gcf, 'plots/S3_velocity.png');
    
    fprintf('✓ S3 plots created\n');
end

fprintf('\n✅ All plots saved to plots/ folder\n');