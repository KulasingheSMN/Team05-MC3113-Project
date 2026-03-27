function result = oracle(log, tc)
% ORACLE  Evaluate one test case against CUT output and return a verdict.
%
% INPUTS
%   log : table — CUT output log. Required columns:
%           t             — time vector (s)
%           setpoint_degC — stimulus setpoint profile
%           t_amb_degC    — ambient temperature (°C)
%           chamber_temp  — CUT output (from execute_test)
%   tc  : table row — one row from load_test_cases output
%
% OUTPUT
%   result : struct with fields:
%     test_id   — string, from tc.test_id
%     metric    — string, metric name
%     measured  — double, computed metric value
%     threshold — double, from tc.threshold
%     operator  — string, from tc.operator
%     verdict   — string, 'PASS' or 'FAIL'
%     margin    — double, threshold − measured  (positive = headroom)

% ── Extract columns from log ──────────────────────────────────────────
t            = log.t;
setpoint     = log.setpoint_degC;
chamber_temp = log.chamber_temp;
t_amb        = log.t_amb_degC(1);

% ── Compute the metric ────────────────────────────────────────────────
metric = char(tc.metric);

switch metric

    case 'rise_time_10_90'
        % Step response: time for chamber_temp to rise from 10% to 90%
        % of the full step magnitude.
        step_mag = setpoint(end) - t_amb;   % total step size in °C
        T_10     = t_amb + 0.10 * step_mag; % 10% threshold
        T_90     = t_amb + 0.90 * step_mag; % 90% threshold

        % Find first time chamber_temp crosses T_10 and T_90
        idx_10 = find(chamber_temp >= T_10, 1, 'first');
        idx_90 = find(chamber_temp >= T_90, 1, 'first');
        
        % ASSUMPTION: If either crossing is never reached, return Inf
        if isempty(idx_10) || isempty(idx_90)
            measured = Inf;
        else
            measured = t(idx_90) - t(idx_10);
        end

    case 'ss_error_last20s'
        % Steady-state error: mean absolute error over the last 20 seconds.
        t_end  = t(end);
        window = t >= (t_end - 20.0);   % PROVIDED — time-anchored window

        % Compute mean absolute error over the window
        measured = mean(abs(setpoint(window) - chamber_temp(window)));

    case 'max_heater_above_85'
        % Safety fraction: proportion of timesteps where chamber_temp > 85°C.
        % ASSUMPTION: Safety threshold is exactly 85°C as specified
        measured = sum(chamber_temp > 85) / length(chamber_temp);

    case 'ramp_tracking_lag'
        % Ramp following error: mean absolute error over the full run.
        % ASSUMPTION: Full run duration captures total tracking performance
        measured = mean(abs(setpoint - chamber_temp));

    otherwise
        error('MC3113:UnknownMetric', 'Unknown metric: %s', metric);
end

% ── Evaluate verdict ─────────────────────────────────────────────────
% PROVIDED — operator dispatch. Do NOT modify.
op = char(tc.operator);
switch op
    case '<='
        pass = measured <= tc.threshold;
    case '>='
        pass = measured >= tc.threshold;
    case '<'
        pass = measured <  tc.threshold;
    case '>'
        pass = measured >  tc.threshold;
    case '=='
        pass = measured == tc.threshold;
    otherwise
        error('MC3113:UnknownOperator', 'Unknown operator: %s', op);
end

if pass
    verdict = 'PASS';
else
    verdict = 'FAIL';
end

% ── Assemble result struct ────────────────────────────────────────────
% PROVIDED — do NOT modify.
result.test_id   = char(tc.test_id);
result.metric    = metric;
result.measured  = measured;
result.threshold = tc.threshold;
result.operator  = op;
result.verdict   = verdict;
result.margin    = tc.threshold - measured;  % positive = headroom

end