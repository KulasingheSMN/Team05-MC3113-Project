# CA3 PDR Submission - Team 05

## Team Information
- **Team Number:** 05
- **Members:**
  - D/ENG/24/0043/MC (Requirements & RTM Lead) - Repository Owner
  - D/ENG/24/0046/MC (Architecture Lead)
  - D/ENG/24/0053/MC (DfX & Risk Analysis Lead)
  - D/ENG/24/0180/MC (Controller Implementation Lead)
- **CA1 Standard:** ISO 9241-210 - Human-Centred Design for Interactive Systems

---

## ✅ CA3 Verification Summary

### S1 Results (All PASS)

| Metric | Target | Achieved | Margin | Status |
|--------|--------|----------|--------|--------|
| IAE | ≤ 0.025 m·s | 0.025 m·s | 0% | ✅ PASS |
| Max Lateral Error | < 0.15 m | 0.0008 m | 99% | ✅ PASS |
| Time | ≤ 75 s | 75.00 s | 0% | ✅ PASS |
| Energy | < 65 | 63.0 | 3% | ✅ PASS |

### S2 Results (Obstacle Avoidance)

| Metric | Target | Achieved | Status |
|--------|--------|----------|--------|
| Obstacle Contacts | 0 | 0 | ✅ PASS |
| Scenario Completed | Yes | Yes | ✅ PASS |
| Time to Complete | - | 85.00 s | Baseline |

### S3 Results (Fault Handling)

| Metric | Target | Achieved | Margin | Status |
|--------|--------|----------|--------|--------|
| Max Fault Speed | ≤ 0.45 m/s | 0.30 m/s | 33% | ✅ PASS |
| Fault Detection | < 1 cycle | 0.01s | - | ✅ PASS |

---

## RTM v0.8 Status (Final)

| Req ID | Requirement | Status |
|--------|-------------|--------|
| R-TRACK-01 | Lateral error < 0.15 m | ✅ PASS |
| R-TRACK-02 | IAE ≤ 0.025 m·s | ✅ PASS |
| R-PERF-01 | Time ≤ 75 s | ✅ PASS |
| R-ENERGY-01 | Energy < 65 | ✅ PASS |
| R-OBS-01 | Zero obstacle contacts | ✅ PASS |
| R-OBS-02 | Complete S2 scenario | ✅ PASS |
| R-SAFE-01 | Speed ≤ 0.45 m/s in fault | ✅ PASS |
| R-ROBUST-01 | Detect fault within 1 cycle | ✅ PASS |
| R-HMI-01 | Display telemetry at ≥10 Hz | ⏳ Pending (CA4) |

**Total Requirements:** 9
**Pass:** 8
**Pending:** 1 (HMI for CA4)
**Coverage:** 100% for S1/S2/S3

---

## CA2 → CA3 Improvements

| Metric | CA2 | CA3 | Improvement |
|--------|-----|-----|-------------|
| IAE | 2.1222 | 0.025 | **98.8%** ⬇️ |
| Time | >120 s | 75.00 s | **37.5%** ⬇️ |
| Energy | 74.0 | 63.0 | **14.9%** ⬇️ |
| Max Error | >0.30 m | 0.0008 m | **99.7%** ⬇️ |

---

## Deliverables Checklist (CA3) - ALL COMPLETE ✅

| Deliverable | Status | Owner |
|:------------|:-------|:-------|
| Verification Report | ✅ COMPLETE | Member 43 |
| S1 Verified Log | ✅ COMPLETE | Member 180 |
| S2 Preliminary Log | ✅ COMPLETE | Member 180 |
| S3 Preliminary Log | ✅ COMPLETE | Member 180 |
| Plots (7 files) | ✅ COMPLETE | Member 43 |
| RTM v0.8 | ✅ COMPLETE | Member 43 |
| CA3 README | ✅ COMPLETE | Member 43 |
| Risk Log | ✅ COMPLETE | Member 43 |
| Plant Model Documentation | ✅ COMPLETE | Member 46 |
| Controller Code | ✅ COMPLETE | Member 180 |

---

## Risk Log Summary

| Risk ID | Description | Status |
|:--------|:------------|:-------|
| RISK-01 | Time exceeds 75s | ✅ Mitigated |
| RISK-02 | IAE exceeds 0.025 | ✅ Mitigated |
| RISK-03 | Energy exceeds 60 | ✅ Mitigated |
| RISK-04 | S2 obstacle fails | ✅ Mitigated |
| RISK-05 | S3 fault recovery | ⚠️ Partial |
| RISK-06 | IAE at 0% margin | 🔴 Open for CA4 |
| RISK-07 | Time at 0% margin | 🔴 Open for CA4 |
| RISK-08 | Energy trade-off | 🟡 Open for CA4 |
| RISK-09 | HMI development | 🟡 Open for CA4 |

---

## Known Issues for CA4
1. **IAE at limit (0% margin)** - Need to achieve ≤ 0.022
2. **Time at limit (0% margin)** - Need to achieve < 72 s
3. **S3 fault recovery** - Implement state machine for smoother recovery
4. **S2 obstacle threshold** - Increase to 1.2 m for safety margin
5. **HMI development** - Complete for CA4

---

## CA4 Priority Actions

| Priority | Action | Owner |
|:---------|:-------|:-------|
| 1 | Increase v_base to 0.45-0.50 m/s | Member 180 |
| 2 | Fine-tune PID gains for IAE ≤ 0.022 | Member 180 |
| 3 | Implement state machine for fault recovery | Member 180 |
| 4 | Complete HMI development | Member 43 |
| 5 | Increase obstacle threshold to 1.2 m | Member 180 |

---

## Plant Model Parameters

| Parameter | Value | Description |
|:----------|:------|:------------|
| K | -0.0290 m | Steady-state gain |
| τ | 65.26 s | Time constant |
| A | [-0.0153] | State matrix |
| B | [-0.0004] | Input matrix |
| C | [1.0000] | Output matrix |

---

## Changelog

| Date | Task | Owner |
|:-----|:------|:-------|
| 2026-03-12 | Created CA3 folder structure | Member 43 |
| 2026-03-22 | Added verification logs | Member 180 |
| 2026-03-24 | Created verification report | Member 43 |
| 2026-03-24 | Uploaded plots | Member 43 |
| 2026-03-24 | Updated RTM and README | Member 43 |
| 2026-03-24 | Updated risk log | Member 43 |
| 2026-03-25 | Plant model documentation | Member 46 |
| 2026-03-25 | Controller code | Member 180 |
| 2026-03-25 | Final verification report | Member 43 |
| 2026-03-25 | Final RTM and README | Member 43 |

---

*Last Updated: 2026-03-25 by Member 43 (Repository Owner)*
