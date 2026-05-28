# RTM v1.0 - Requirements Traceability Matrix

## 📊 Requirements Traceability Matrix

| Req_ID | Requirement | Test_ID | Method | Scenario | Evidence | Status | Notes |
|:-------|:------------|:--------|:-------|:---------|:---------|:-------|:------|
| R-TRACK-01 | \|e_line\| < 0.15 m | T-TRACK-01 | T | S1 | S1_final_log.csv | ✅ PASS | Margin 99% |
| R-TRACK-02 | IAE ≤ 0.025 m·s | T-TRACK-02 | T | S1 | S1_final_log.csv | ✅ PASS | At limit |
| R-PERF-01 | t_final ≤ 75 s | T-PERF-01 | T | S1 | S1_final_log.csv | ✅ PASS | At limit |
| R-ENERGY-01 | Energy < 65 | T-ENERGY-01 | A | S1 | S1_final_log.csv | ✅ PASS | Margin 3% |
| R-OBS-01 | 0 obstacle contacts | T-OBS-01 | T | S2 | S2_final_log.csv | ✅ PASS | Clean |
| R-OBS-02 | Complete S2 scenario | T-OBS-02 | T | S2 | S2_final_log.csv | ✅ PASS | Recovery works |
| R-SAFE-01 | v ≤ 0.45 m/s in fault | T-SAFE-01 | T | S3 | S3_final_log.csv | ✅ PASS | Margin 33% |
| R-ROBUST-01 | Detect fault within 1 cycle | T-SAFE-02 | T | S3 | S3_final_log.csv | ✅ PASS | 0.01s |
| R-HMI-01 | Display telemetry at ≥10 Hz | T-HMI-01 | I | N/A | hmi-documentation.pdf | ✅ PASS | Verified |
| R-ARCH-01 | ICD signals implemented | T-ARCH-01 | I | N/A | ICD_final.csv | ✅ PASS | 8 signals |

---

## 📈 Summary Statistics

| Metric | Value |
|:-------|:------|
| **Total Requirements** | 10 |
| **✅ PASS** | 10 |
| **❌ FAIL** | 0 |
| **⏳ PENDING** | 0 |
| **Pass Rate** | **100%** |

---

## 📋 Method Code Legend

| Code | Meaning | Description |
|:-----|:--------|:------------|
| **T** | Test | Executed scenario, measured outcome |
| **A** | Analysis | Calculated from logs |
| **I** | Inspection | Document review, visual verification |

---

## 📝 Scenario Legend

| Scenario | Description |
|:---------|:------------|
| **S1** | Nominal line following |
| **S2** | Obstacle avoidance |
| **S3** | Fault handling |
| **N/A** | Not applicable |

---

## 📁 Evidence File Locations

| Evidence File | Location |
|:--------------|:---------|
| S1_final_log.csv | `CA4-CDR/01-Final-Verification/` |
| S2_final_log.csv | `CA4-CDR/01-Final-Verification/` |
| S3_final_log.csv | `CA4-CDR/01-Final-Verification/` |
| hmi-documentation.pdf | `CA4-CDR/02-Software-Interface/` |
| ICD_final.csv | `CA4-CDR/02-Software-Interface/` |

---

*Last Updated: 31 May 2026 | Team 05*
