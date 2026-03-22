function [u_L, u_R] = controller(e_line, dt, state)
% PID Controller for Line-Follower Robot
% Team 05 - MC3113 CA2
% CORRECTED VERSION - For use with digital twin

% Initialize persistent variables if first call
persistent integral prev_error
if isempty(integral)
    integral = 0;
    prev_error = 0;
end

% PID Tuning Parameters
Kp = 2.0;    % Proportional gain
Ki = 0.5;    % Integral gain
Kd = 0.1;    % Derivative gain
v_base = 0.6; % Base forward speed [m/s]

% PID calculations
P = Kp * e_line;

integral = integral + e_line * dt;
I = Ki * integral;

if dt > 0
    D = Kd * (e_line - prev_error) / dt;
else
    D = 0;
end

% Combined steering command
u_steer = P + I + D;

% Differential drive mapping
u_L = v_base - u_steer;
u_R = v_base + u_steer;

% Apply saturation limits (motor commands between -1 and 1)
u_L = max(-1.0, min(1.0, u_L));
u_R = max(-1.0, min(1.0, u_R));

% Update state for next iteration
prev_error = e_line;

end
