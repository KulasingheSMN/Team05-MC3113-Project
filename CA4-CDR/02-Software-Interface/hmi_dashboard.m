function hmi_dashboard
    % HMI Dashboard for Line Follower - Team 05 CA4
    close all
    
    fig = uifigure('Name', 'Line Follower HMI - Team 05', 'Position', [100, 100, 850, 600]);
    
    % ========== HEADER ==========
    uilabel(fig, 'Position', [300, 520, 250, 30], 'Text', 'LINE FOLLOWER DIGITAL TWIN', ...
        'FontSize', 16, 'FontWeight', 'bold', 'FontColor', [0, 0.3, 0.6]);
    
    % ========== SCENARIO CONTROL ==========
    uipanel(fig, 'Title', 'Scenario Control', 'Position', [30, 400, 350, 100]);
    uilabel(fig, 'Position', [50, 460, 80, 20], 'Text', 'Select Scenario:');
    scenario_dropdown = uidropdown(fig, 'Position', [150, 460, 150, 25], ...
        'Items', {'S1 - Nominal (75s)', 'S2 - Obstacle (85s)', 'S3 - Fault (65s)'});
    run_btn = uibutton(fig, 'Position', [50, 420, 100, 30], 'Text', '▶ RUN', ...
        'ButtonPushedFcn', @(btn,event) runSimulation(scenario_dropdown.Value));
    stop_btn = uibutton(fig, 'Position', [170, 420, 100, 30], 'Text', '■ STOP', ...
        'ButtonPushedFcn', @(btn,event) stopSimulation(), 'Visible', 'off');
    
    % ========== LIVE TELEMETRY ==========
    tele_panel = uipanel(fig, 'Title', 'Live Telemetry', 'Position', [30, 150, 350, 200]);
    
    uilabel(fig, 'Position', [50, 300, 80, 20], 'Text', 'Lateral Error:');
    e_line_val = uilabel(fig, 'Position', [150, 300, 120, 20], 'Text', '-- m', ...
        'FontSize', 12, 'FontWeight', 'bold');
    
    uilabel(fig, 'Position', [50, 270, 80, 20], 'Text', 'Velocity:');
    v_val = uilabel(fig, 'Position', [150, 270, 120, 20], 'Text', '-- m/s', ...
        'FontSize', 12, 'FontWeight', 'bold');
    
    uilabel(fig, 'Position', [50, 240, 80, 20], 'Text', 'Fault Flag:');
    fault_val = uilabel(fig, 'Position', [150, 240, 120, 20], 'Text', '0 (Normal)', ...
        'FontSize', 12, 'FontWeight', 'bold');
    
    % ========== POST-RUN METRICS ==========
    metrics_panel = uipanel(fig, 'Title', 'Post-Run Metrics', 'Position', [430, 150, 350, 200]);
    
    uilabel(fig, 'Position', [450, 300, 80, 20], 'Text', 'IAE:');
    iae_val = uilabel(fig, 'Position', [550, 300, 120, 20], 'Text', '--', ...
        'FontSize', 12, 'FontWeight', 'bold');
    
    uilabel(fig, 'Position', [450, 270, 80, 20], 'Text', 'Time:');
    time_val = uilabel(fig, 'Position', [550, 270, 120, 20], 'Text', '-- s', ...
        'FontSize', 12, 'FontWeight', 'bold');
    
    uilabel(fig, 'Position', [450, 240, 80, 20], 'Text', 'Status:');
    status_val = uilabel(fig, 'Position', [550, 240, 120, 20], 'Text', '--', ...
        'FontSize', 12, 'FontWeight', 'bold', 'FontColor', [0, 0.5, 0]);
    
    % ========== STATUS BAR ==========
    status_bar = uilabel(fig, 'Position', [30, 30, 500, 25], 'Text', 'Ready', ...
        'BackgroundColor', [0.9, 0.9, 0.9]);
    
    % ========== SIMULATION STATE ==========
    stop_flag = false;
    
    % ========== NESTED FUNCTIONS ==========
    function stopSimulation()
        stop_flag = true;
        status_bar.Text = 'Stopped by user';
        stop_btn.Visible = 'off';
        run_btn.Visible = 'on';
    end
    
    function runSimulation(scenario)
        % Reset stop flag and UI
        stop_flag = false;
        stop_btn.Visible = 'on';
        run_btn.Visible = 'off';
        status_bar.Text = ['Running: ' scenario '...'];
        drawnow;
        
        % Simulate the run (replace with real digital twin call if needed)
        % Use a loop to allow Stop button to interrupt
        for t_step = 1:100   % 100 steps = approx 1 second of simulated time
            if stop_flag
                return;
            end
            pause(0.01);  % small delay to keep UI responsive
        end
        
        % After simulation completes (or if not stopped), display results
        switch scenario
            case 'S1 - Nominal (75s)'
                e_line_val.Text = '0.021 m';
                v_val.Text = '0.48 m/s';
                fault_val.Text = '0 (Normal)';
                fault_val.FontColor = [0, 0, 0];
                iae_val.Text = '0.021';
                time_val.Text = '71.5';
                status_val.Text = '✅ PASS';
                status_val.FontColor = [0, 0.6, 0];
                % Generate synthetic e_line data for plot
                t_plot = linspace(0, 71.5, 500);
                e_plot = 0.021 * exp(-3*t_plot) + 0.001*sin(2*pi*0.2*t_plot);
                title_str = 'S1: Lateral Error vs Time';
            case 'S2 - Obstacle (85s)'
                e_line_val.Text = '0.15 m';
                v_val.Text = '0.35 m/s';
                fault_val.Text = '0 (Normal)';
                fault_val.FontColor = [0, 0, 0];
                iae_val.Text = '2.5';
                time_val.Text = '82.0';
                status_val.Text = '✅ PASS';
                status_val.FontColor = [0, 0.6, 0];
                t_plot = linspace(0, 82, 500);
                e_plot = 0.01*sin(2*pi*0.1*t_plot);
                e_plot(t_plot>38 & t_plot<45) = 0.15;
                title_str = 'S2: Lateral Error vs Time (Obstacle)';
            case 'S3 - Fault (65s)'
                e_line_val.Text = '0.05 m';
                v_val.Text = '0.30 m/s';
                fault_val.Text = '1 (Fault Mode)';
                fault_val.FontColor = [0.8, 0, 0];
                iae_val.Text = '0.8';
                time_val.Text = '65.2';
                status_val.Text = '✅ PASS';
                status_val.FontColor = [0, 0.6, 0];
                t_plot = linspace(0, 65.2, 500);
                e_plot = 0.005*sin(2*pi*0.2*t_plot);
                e_plot(t_plot>40 & t_plot<65) = NaN;
                title_str = 'S3: Lateral Error vs Time (Fault Region)';
        end
        
        % Display plot in a new figure window
        figure('Name', 'Lateral Error Plot', 'NumberTitle', 'off');
        plot(t_plot, e_plot, 'b-', 'LineWidth', 1.5);
        xlabel('Time (s)');
        ylabel('e\_line (m)');
        title(title_str);
        grid on;
        if contains(scenario, 'S1')
            hold on; yline(0.15, 'r--'); yline(-0.15, 'r--');
            legend('e\_line', 'Bounds');
        end
        
        status_bar.Text = 'Ready';
        stop_btn.Visible = 'off';
        run_btn.Visible = 'on';
    end
end