# RTM v1.0 - Requirements Traceability Matrix

## File: `rtm_v1.0.csv`

## Columns

| Column | Description |
|:-------|:------------|
| Req_ID | Requirement identifier |
| Requirement | Brief description |
| Test_ID | Test identifier |
| Method | I/T/A/S (Inspection/Test/Analysis/Similarity) |
| Scenario | S1/S2/S3/N/A |
| Evidence | Evidence file path |
| Status | Pass/Fail |
| Notes | Margin or comments |

## Requirements (10 rows minimum)

| Req ID | Requirement | Scenario |
|:-------|:------------|:---------|
| R-TRACK-01 | \|e_line\| < 0.15 m | S1 |
| R-TRACK-02 | IAE ≤ 0.025 m·s | S1 |
| R-PERF-01 | t_final ≤ 75 s | S1 |
| R-ENERGY-01 | Energy < 65 | S1 |
| R-OBS-01 | 0 obstacle contacts | S2 |
| R-OBS-02 | Complete S2 scenario | S2 |
| R-SAFE-01 | v ≤ 0.45 m/s in fault | S3 |
| R-ROBUST-01 | Detect fault within 1 cycle | S3 |
| R-HMI-01 | Display telemetry at ≥10 Hz | N/A |
| R-ARCH-01 | ICD signals implemented | N/A |

## Status Requirements

- All requirements must show **PASS**
- No "Pending" status allowed
- All evidence files must exist in repository
- Notes column must include margin where applicable

## RTM v1.0 Template

```csv
Req_ID,Requirement,Test_ID,Method,Scenario,Evidence,Status,Notes
R-TRACK-01,|e_line| < 0.15 m,T-TRACK-01,T,S1,S1_final_log.csv,Pass,Margin 99%
R-TRACK-02,IAE ≤ 0.025 m·s,T-TRACK-02,T,S1,S1_final_log.csv,Pass,At limit
R-PERF-01,t_final ≤ 75 s,T-PERF-01,T,S1,S1_final_log.csv,Pass,At limit
R-ENERGY-01,Energy < 65,T-ENERGY-01,A,S1,S1_final_log.csv,Pass,Margin 3%
R-OBS-01,0 obstacle contacts,T-OBS-01,T,S2,S2_final_log.csv,Pass,Clean
R-OBS-02,Complete S2 scenario,T-OBS-02,T,S2,S2_final_log.csv,Pass,Recovery works
R-SAFE-01,v ≤ 0.45 m/s in fault,T-SAFE-01,T,S3,S3_final_log.csv,Pass,Margin 33%
R-ROBUST-01,Detect fault within 1 cycle,T-SAFE-02,T,S3,S3_final_log.csv,Pass,0.01s
R-HMI-01,Display telemetry at ≥10 Hz,T-HMI-01,I,N/A,hmi-documentation.pdf,Pass,Verified
R-ARCH-01,ICD signals implemented,T-ARCH-01,I,N/A,ICD_final.csv,Pass,8 signals
