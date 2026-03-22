% create_ca3_plots.m
% Create 6 plots for CA3 verification

if ~exist('plots', 'dir')
    mkdir('plots');
end

fprintf('Creating CA3 verification plots...\n');

% Plot 1-2: S1 Plots
if exist('S1_verified_log.csv', 'file')
    data1 = readtable('S1_verified_log.csv');
    
    figure('Position', [100, 100, 1200, 800]);
    subplot(2,1,1);
    plot(data1.time, data1.e_line, 'b-', 'LineWidth', 1.5);
    yline(0.15, 'r--'); yline(-0.15, 'r--');
    ylabel('e\_line [m]'); title('S1: Lateral Error');
    grid on;
    
    subplot(2,1,2);
    plot(data1.time, data1.u_L, 'b-', data1.time, data1.u_R, 'r-', 'LineWidth', 1.5);
    yline(1, 'k--'); yline(-1, 'k--');
    xlabel('Time [s]'); ylabel('Motor Commands');
    legend('u_L', 'u_R'); grid on;
    saveas(gcf, 'plots/S1_verification.png');
end

% Plot 3-4: S2 Plots
if exist('S2_preliminary_log.csv', 'file')
    data2 = readtable('S2_preliminary_log.csv');
    
    figure('Position', [100, 100, 1200, 800]);
    plot(data2.time, data2.e_line, 'b-', 'LineWidth', 1.5);
    xlabel('Time [s]'); ylabel('e\_line [m]');
    title('S2: Lateral Error During Obstacle'); grid on;
    saveas(gcf, 'plots/S2_lateral_error.png');
    
    figure('Position', [100, 100, 1200, 800]);
    if ismember('contact_flag', data2.Properties.VariableNames)
        plot(data2.time, data2.contact_flag, 'r-', 'LineWidth', 1.5);
        ylabel('Contact Flag'); xlabel('Time [s]');
        title('S2: Obstacle Contacts'); grid on;
        saveas(gcf, 'plots/S2_contacts.png');
    end
end

% Plot 5-6: S3 Plots
if exist('S3_preliminary_log.csv', 'file')
    data3 = readtable('S3_preliminary_log.csv');
    
    figure('Position', [100, 100, 1200, 800]);
    plot(data3.time, data3.v, 'g-', 'LineWidth', 1.5);
    hold on;
    yline(0.45, 'r--', 'LineWidth', 1.5);
    xlabel('Time [s]'); ylabel('v [m/s]');
    title('S3: Speed Profile During Fault');
    legend('Velocity', 'Speed Cap (0.45 m/s)'); grid on;
    saveas(gcf, 'plots/S3_speed.png');
    
    figure('Position', [100, 100, 1200, 800]);
    if ismember('fault_flag', data3.Properties.VariableNames)
        yyaxis left;
        plot(data3.time, data3.v, 'b-');
        ylabel('v [m/s]');
        yyaxis right;
        plot(data3.time, data3.fault_flag, 'r-');
        ylabel('fault\_flag');
        xlabel('Time [s]');
        title('S3: Fault Detection and Speed Response');
        grid on;
        saveas(gcf, 'plots/S3_fault_response.png');
    end
end

fprintf('✓ All plots saved to plots/ folder\n');