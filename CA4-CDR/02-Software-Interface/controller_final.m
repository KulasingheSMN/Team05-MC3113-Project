function [u_L, u_R] = controller_final(e_line, dt, state, obstacle_flag)
% CONTROLLER_FINAL_CA4 - Team 05
% Bronze tier target: IAE ≤ 2.0 m·s

% Default obstacle_flag if not provided
if nargin < 4
    obstacle_flag = 0;
end

% CA4 Gains (Bronze tier)
Kp = 2.0;      % Proportional gain
Ki = 0.5;      % Integral gain
Kd = 0.1;      % Derivative gain
v_base = 0.65; % Base speed for S1

% S2 Obstacle mode parameters
OBSTACLE_SPEED = 0.35;      % Slow down when obstacle detected
OBSTACLE_STEERING_BIAS = 0.3; % Lateral bias to steer around

% Anti-windup limits
INTEGRAL_MAX = 0.5;
INTEGRAL_MIN = -0.5;

% Fault handling
FAULT_SPEED = 0.35;
RECOVERY_TIME = 2.0;

persistent integral prev_error fault_active fault_time
if isempty(integral)
    integral = 0; prev_error = 0; fault_active = 0; fault_time = 0;
end

% ========== S2 OBSTACLE HANDLING ==========
if obstacle_flag == 1
    % Obstacle detected - enter obstacle avoidance mode
    v_current = OBSTACLE_SPEED;
    % Add steering bias to go around obstacle
    u_steer_bias = OBSTACLE_STEERING_BIAS;
else
    v_current = v_base;
    u_steer_bias = 0;
end

% ========== FAULT DETECTION & RECOVERY ==========
if isnan(e_line) || abs(e_line) > 1.0
    if fault_active == 0, fault_active = 1; end
    e_control = prev_error;
    fault_time = fault_time + dt;
else
    if fault_active == 1 && fault_time >= RECOVERY_TIME
        fault_active = 0; fault_time = 0;
    end
    e_control = e_line;
end

% Override speed during fault
if fault_active == 1
    v_current = FAULT_SPEED;
end

% ========== PID CALCULATION ==========
integral = integral + e_control * dt;
integral = max(INTEGRAL_MIN, min(INTEGRAL_MAX, integral));

P = Kp * e_control;
I = Ki * integral;
if dt > 0
    D = Kd * (e_control - prev_error) / dt;
else
    D = 0;
end

u_steer = P + I + D + u_steer_bias;  % Add obstacle bias

% ========== DIFFERENTIAL DRIVE ==========
u_L = v_current - u_steer;
u_R = v_current + u_steer;

% Saturation
u_L = max(-1, min(1, u_L));
u_R = max(-1, min(1, u_R));

prev_error = e_control;

end