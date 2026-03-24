function [u_L, u_R] = controller_updated(inputs, dt, state)

% Extract e_line
if isstruct(inputs)
    e_line = inputs.e_line;
else
    e_line = inputs;
end

if nargin < 2 || isempty(dt)
    dt = 0.01;
end

% PID GAINS - IMPORTANT!
Kp = 2.0;
Ki = 0.5;
Kd = 0.1;
v_base = 0.42;

persistent integral prev_error
if isempty(integral)
    integral = 0;
    prev_error = 0;
end

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

u_L = max(-1, min(1, u_L));
u_R = max(-1, min(1, u_R));

prev_error = e_line;

end