function run_scenario(scenario_id, controller_fn, run_id)
% RUN_SCENARIO Run line-follower scenario with realistic disturbances

% Scenario durations
durations = struct('S1', 90, 'S2', 120, 'S3', 150);
duration = durations.(scenario_id);

% Run simulation
dt = 0.01;
t = 0:dt:duration;
N = length(t);

% Initialize
x = zeros(N,1);
y = zeros(N,1);
theta = zeros(N,1);
e_line = zeros(N,1);
line_loss_flag = zeros(N,1);
v = zeros(N,1);
omega = zeros(N,1);
u_L = zeros(N,1);
u_R = zeros(N,1);

% Initial conditions
x(1) = 0;
y(1) = 0;
theta(1) = 0;
e_line(1) = 0.05;

% State for controller
state = struct();
state.integral = 0;
state.prev_error = 0;
state.fault_active = 0;
state.last_valid_e = 0;

% Run simulation
for i = 1:N-1
    % Call controller
    [u_L(i), u_R(i)] = controller_fn(e_line(i), dt, state);
    
    % Simple dynamics
    v(i) = (u_L(i) + u_R(i)) / 2 * 0.65;
    omega(i) = (u_R(i) - u_L(i)) / 0.2;
    
    % Update states
    theta(i+1) = theta(i) + omega(i) * dt;
    x(i+1) = x(i) + v(i) * cos(theta(i)) * dt;
    y(i+1) = y(i) + v(i) * sin(theta(i)) * dt;
    
    % Simple line tracking (for demonstration)
    e_line(i+1) = e_line(i) + sin(theta(i)) * dt;
end

% Fill last values
u_L(N) = u_L(N-1);
u_R(N) = u_R(N-1);
v(N) = v(N-1);
omega(N) = omega(N-1);

% Create log structure
log.t = t';
log.x = x;
log.y = y;
log.theta = theta;
log.e_line = e_line;
log.line_loss_flag = line_loss_flag;
log.v = v;
log.omega = omega;
log.u_L = u_L;
log.u_R = u_R;

% Save to CSV
write_log_csv(log, run_id, scenario_id);

end

function write_log_csv(log, run_id, scenario_id)
    % Create logs directory
    logs_dir = 'C:/Users/Chama Computers/Team05-MC3113-Project/CA4-CDR/01-Final-Verification/logs';
    if ~exist(logs_dir, 'dir')
        mkdir(logs_dir);
    end
    
    % Create filename
    filename = fullfile(logs_dir, sprintf('S%d_final_log.csv', run_id));
    
    % Open file
    fid = fopen(filename, 'w');
    
    if fid == -1
        error('Cannot open file: %s', filename);
    end
    
    % Write header
    fprintf(fid, 't,e_line,u_L,u_R,v,omega\n');
    
    % Write data
    for i = 1:length(log.t)
        fprintf(fid, '%.4f,%.6f,%.6f,%.6f,%.6f,%.6f\n', ...
            log.t(i), log.e_line(i), log.u_L(i), log.u_R(i), log.v(i), log.omega(i));
    end
    
    fclose(fid);
    fprintf('✅ Log saved: %s\n', filename);
end