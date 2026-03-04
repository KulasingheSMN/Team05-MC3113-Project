% controller.m
% CA2 Controller Simulation for Line Following Robot
% Generates plots and S1 log file

clear
clc

%% Simulation parameters
dt = 0.01;
t = 0:dt:75;

%% PID gains
Kp = 2.0;
Ki = 0.5;
Kd = 0.1;

%% Simulated line tracking error
e_line = 0.1*sin(0.1*t);

%% Initialize variables
integral = 0;
prev_error = 0;

uL = zeros(size(t));
uR = zeros(size(t));
v  = zeros(size(t));

% initial velocity
v(1) = 0.5;

%% Controller loop
for i = 2:length(t)

    error = e_line(i);

    % PID calculations
    integral = integral + error*dt;
    derivative = (error - prev_error)/dt;

    control = Kp*error + Ki*integral + Kd*derivative;

    % actuator saturation
    uL(i) = max(min(control,1),-1);
    uR(i) = max(min(-control,1),-1);

    % simple velocity model
    v(i) = 0.5 + 0.2*(uL(i)+uR(i));

    prev_error = error;

end

%% Compute IAE
IAE = trapz(t,abs(e_line));
disp(['IAE = ',num2str(IAE)])

%% Plot 1: Tracking Error
figure
plot(t,e_line,'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Lateral Error (m)')
title('S1 Tracking Error')
grid on

%% Plot 2: Motor Commands
figure
plot(t,uL,'LineWidth',1.5)
hold on
plot(t,uR,'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Command')
legend('u_L','u_R')
title('Motor Commands')
grid on

%% Plot 3: Robot Velocity
figure
plot(t,v,'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Robot Velocity')
grid on

%% Save S1 log file
data = table(t',e_line',uL',uR',v',...
    'VariableNames',{'time','e_line','uL','uR','velocity'});

writetable(data,'S1_baseline_log.csv');

disp('S1_baseline_log.csv generated successfully')