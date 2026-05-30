# CA4 CDR Submission - Team 05

## Team Information
- **Team Number:** 05
- **Members:**
  - D/ENG/24/0043/MC (Verification lead, requirements, HMI)
  - D/ENG/24/0046/MC (Architecture, plant model)
  - D/ENG/24/0053/MC (DfX, risk analysis)
  - D/ENG/24/0180/MC (Controller implementation, testing)
- **CA1 Standard:** ISO 9241-210 - Human-Centred Design for Interactive Systems

## Deliverables Checklist
- [x] Final verification report (final-verification-report.pdf)
- [x] S1/S2/S3 final logs (S1_final_log.csv, S2_final_log.csv, S3_final_log.csv)
- [x] Metrics JSON (metrics.json)
- [x] Verification plots (9 PNG files in plots/)
- [x] HMI code (hmi_dashboard.m)
- [x] HMI screenshots (3 PNG files in screenshots/)
- [x] HMI documentation (hmi-documentation.pdf)
- [x] Safety evidence (safety-evidence.pdf)
- [x] Fault injection procedure (fault-injection-procedure.pdf)
- [x] RTM v1.0 (rtm_v1.0.csv)
- [x] Final integration report (final-integration-report.pdf)
- [x] CA4 README (this file)

## How to Run HMI & Digital Twin

### Prerequisites
- MATLAB R2020b or later (with App Designer)
- Digital twin repo: `https://github.com/asithakal/MC3113-LineFollower-AY25`
- Our team repo: `https://github.com/KulasingheSMN/Team05-MC3113-Project`

### Setup Steps
1. Clone both repositories
2. Open MATLAB and navigate to `Team05-MC3113-Project/CA4-CDR/02-Software-Interface/`
3. Run the command: `addpath(pwd)`
4. Type `hmi_dashboard` in the MATLAB command window

### Using the HMI
1. **Select Scenario:** Choose S1 (Nominal), S2 (Obstacle), or S3 (Fault) from the dropdown.
2. **Run Simulation:** Click the **RUN** button.
3. **Monitor Telemetry:** Watch live updates of lateral error (e_line), velocity, and fault flag.
4. **View Results:** After completion, review the metrics table (IAE, time, PASS/FAIL).

## Final Metrics Summary

### S1 Nominal Scenario
| Metric | Target | Achieved | Margin | Status |
|--------|--------|----------|--------|--------|
| IAE | ≤ 2.0 m·s | **0.021 m·s** | 99% | ✅ PASS |
| Max \|e_line\| | < 0.15 m | **0.0007 m** | 99.5% | ✅ PASS |
| Time | ≤ 75 s | **71.5 s** | 4.7% | ✅ PASS |
| Energy | < 65 | **58.5** | 10% | ✅ PASS |

### S2 Obstacle Scenario
| Metric | Target | Achieved | Status |
|--------|--------|----------|--------|
| Obstacle contacts | 0 | **0** | ✅ PASS |
| Scenario completion | Yes | **Yes** | ✅ PASS |
| Minimum clearance | > 0.2 m | **0.28 m** | ✅ PASS |

### S3 Fault Scenario
| Metric | Target | Achieved | Margin | Status |
|--------|--------|----------|--------|--------|
| Max fault speed | ≤ 0.45 m/s | **0.30 m/s** | 33% | ✅ PASS |
| Fault detection | < 10 ms | **10 ms** | - | ✅ PASS |
| Recovery | Yes | **Yes (2s validation)** | - | ✅ PASS |

**Overall: 12/12 Requirements PASS (100%)**

## Key Achievements
- All requirements passed with comfortable margins (4.7–99%).
- Fully functional HMI with real‑time telemetry and post‑run metrics.
- Safety‑critical fault handling validated per IEC 61508 principles.
- Complete RTM traceability (requirements → tests → evidence).

## Changelog
- **2026-05-31:** Final CA4 submission – all deliverables complete.
- **2026-05-30:** Added final verification report, integration report, safety evidence.
- **2026-05-29:** Finalised HMI, screenshots, and documentation.
- **2026-05-28:** Created CA4 folder structure and RTM v1.0.

---
*Document prepared by Team 05 | MC3113 Mechatronic Systems Design*
