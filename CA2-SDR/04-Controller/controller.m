function [u_L, u_R] = controller(inputs, dt, state)
% PID Controller for Line-Follower Robot
% Team 05 - MC3113 CA2
% Author: A. M. P. D. B. Adhikari

% Extract e_line from input structure
if isstruct(inputs)
    if isfield(inputs, 'e_line')
        e_line = inputs.e_line;
    else
        e_line = 0;
    end
else
    e_line = inputs;
end

% Set default dt
if nargin < 2 || isempty(dt)
    dt = 0.01;
end

% PID state
persistent integral prev_error
if isempty(integral)
    integral = 0;
    prev_error = 0;
end

% PID Gains
Kp = 2.0;
Ki = 0.5;
Kd = 0.1;
v_base = 0.6;

% PID calculations
P = Kp * e_line;
integral = integral + e_line * dt;
I = Ki * integral;

if dt > 0
    D = Kd * (e_line - prev_error) / dt;
else
    D = 0;
end

u_steer = P + I + D;
u_L = v_base - u_steer;
u_R = v_base + u_steer;

% Saturation
u_L = max(-1.0, min(1.0, u_L));
u_R = max(-1.0, min(1.0, u_R));

prev_error = e_line;

end