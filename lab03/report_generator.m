function report_generator(cases, results, out_json, out_csv)
% REPORT_GENERATOR  Write lab03_report.json and lab03_coverage.csv.
%
% INPUTS
%   cases    : validated cases table (from load_test_cases)
%   results  : struct array of oracle results (one element per test case)
%   out_json : output filename string, e.g. 'lab03_report.json'
%   out_csv  : output filename string, e.g. 'lab03_coverage.csv'

n          = numel(results);
n_passed   = sum(strcmp({results.verdict}, 'PASS'));
n_failed   = n - n_passed;

% ── TODO 5a — build the per-result struct array for JSON ─────────────
% Build the results array for JSON
for k = 1:n
    row(k).test_id = results(k).test_id;
    row(k).req_id = char(cases.req_id(k));
    row(k).description = char(cases.description(k));
    row(k).metric = results(k).metric;
    row(k).measured = results(k).measured;
    row(k).threshold = results(k).threshold;
    row(k).operator = results(k).operator;
    row(k).verdict = results(k).verdict;
    row(k).margin = results(k).margin;
end

% ── TODO 5b — build the top-level report struct and encode to JSON ────
report.generated = string(datetime('now', 'Format', 'yyyy-MM-dd''T''HH:mm:ss'));
report.total_cases = n;
report.passed = n_passed;
report.failed = n_failed;
report.results = row;

json_str = jsonencode(report, 'PrettyPrint', true);
fid = fopen(out_json, 'w');
fprintf(fid, '%s\n', json_str);
fclose(fid);

% ── Write coverage CSV ────────────────────────────────────
% Build table from the results struct array
test_ids = cell(n, 1);
metrics = cell(n, 1);
verdicts = cell(n, 1);
margins = zeros(n, 1);
req_ids = cell(n, 1);
descriptions = cell(n, 1);

for k = 1:n
    test_ids{k} = results(k).test_id;
    metrics{k} = results(k).metric;
    verdicts{k} = results(k).verdict;
    margins(k) = results(k).margin;
    req_ids{k} = char(cases.req_id(k));
    descriptions{k} = char(cases.description(k));
end

cov_table = table(req_ids, descriptions, test_ids, metrics, verdicts, margins, ...
    'VariableNames', {'req_id', 'description', 'test_id', 'metric', 'verdict', 'margin'});
writetable(cov_table, out_csv);
fprintf('      Coverage CSV written: %d row(s).\n', height(cov_table));

end