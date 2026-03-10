function [u_L, u_R] = my_controller_step(inputs)
% PID controller for line-follower: Team05
% inputs.e_line : lateral error (m), positive = robot right of line
% inputs.v : forward speed (m/s)
% inputs.fault_flag : 0 or 1

persistent integral prev_error
if isempty(integral)
    integral = 0;
    prev_error = 0;
end

dt = 0.01;  % Fixed 100 Hz timestep - DO NOT CHANGE
Kp = -0.6
Ki = 0
Kd = -0.80
base = 0.32
e = inputs.e_line;

% Proportional term
P = Kp * e;

% Integral term with anti-windup saturation
integral = integral + e * dt;
integral = max(-0.5, min(0.5, integral));  % Anti-windup clamp
I = Ki * integral;

% Derivative term
D = Kd * (e - prev_error) / dt;
prev_error = e;

% Steering correction and differential drive
steer = P + I + D;
u_L = base - steer;
u_R = base + steer;

% ========== DO NOT MODIFY BELOW THIS LINE ==========
% S3 fault handling - KEEP THIS EXACTLY AS IS
if inputs.fault_flag == 1
    base_fault = 0.2;
    u_L = base_fault - steer;
    u_R = base_fault + steer;
end

% Saturate to physical limits
u_L = max(min(u_L, 1.0), -1.0);
u_R = max(min(u_R, 1.0), -1.0);

end
