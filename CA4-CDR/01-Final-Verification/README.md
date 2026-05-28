# Final Verification Package

## Required Files

| File | Description |
|:-----|:------------|
| `S1_final_log.csv` | Final S1 scenario log (all PASS) |
| `S2_final_log.csv` | Final S2 obstacle scenario log |
| `S3_final_log.csv` | Final S3 fault scenario log |
| `metrics.json` | Machine-readable metrics |
| `plots/` | 9 plots (3 per scenario) |

## Metrics.json Format
```json
{
  "S1": {"IAE": 0.025, "energy": 63.0, "time_s": 75.00},
  "S2": {"contacts": 0, "time_s": 85.00},
  "S3": {"max_v_fault": 0.30, "detection_time_s": 0.01}
}


i
