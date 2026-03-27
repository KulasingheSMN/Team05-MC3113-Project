function cases = load_test_cases(filename)
% LOAD_TEST_CASES  Read and validate test_cases.csv
%
% INPUT : filename — path to CSV file
% OUTPUT: cases    — validated MATLAB table, Nx7
%
% Named errors this function must throw:
%   MC3113:FileNotFound    — file does not exist
%   MC3113:MissingColumn   — a required column is absent
%   MC3113:InvalidMetric   — metric string not in the valid set
%   MC3113:InvalidOperator — operator not in the valid set

VALID_METRICS   = ["rise_time_10_90", "ss_error_last20s", ...
                   "max_heater_above_85", "ramp_tracking_lag"];
VALID_OPERATORS = ["<=", ">=", "<", ">", "=="];
REQUIRED_COLS   = {'test_id','req_id','description', ...
                   'run_id','metric','operator','threshold'};

% ── TODO 1a — check file exists; throw MC3113:FileNotFound if not ────
if ~isfile(filename)
    error('MC3113:FileNotFound', 'File not found: %s', filename);
end

% ════════════════════════════════════════════════════════════════════
% PROVIDED — do NOT modify this block.
% Reads the CSV with correct column types and strips header whitespace.
opts = detectImportOptions(filename, "TextType", "string");
opts.VariableNames = strtrim(opts.VariableNames);
opts = setvartype(opts, {'run_id', 'threshold'}, 'double');
cases = readtable(filename, opts);
% END PROVIDED ════════════════════════════════════════════════════════

% ── TODO 1b — check all required columns are present ────────────────
for i = 1:length(REQUIRED_COLS)
    colName = REQUIRED_COLS{i};
    if ~ismember(colName, cases.Properties.VariableNames)
        error('MC3113:MissingColumn', 'Missing column: %s', colName);
    end
end

% ── TODO 1c — validate metric and operator strings row by row ────────
for r = 1:height(cases)
    metric_val = char(cases.metric(r));
    op_val = char(cases.operator(r));
    
    if ~ismember(metric_val, VALID_METRICS)
        error('MC3113:InvalidMetric', 'Invalid metric: %s', metric_val);
    end
    if ~ismember(op_val, VALID_OPERATORS)
        error('MC3113:InvalidOperator', 'Invalid operator: %s', op_val);
    end
end

end