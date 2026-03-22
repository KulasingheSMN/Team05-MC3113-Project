# CA3 PDR Submission - Team 05

## Team Information
- **Team Number:** 05
- **Members:**
  - D/ENG/24/0043/MC (Requirements & RTM Lead) - Repository Owner
  - D/ENG/24/0046/MC (Architecture Lead)
  - D/ENG/24/0053/MC (DfX & Risk Analysis Lead)
  - D/ENG/24/0180/MC (Controller Implementation Lead)
- **CA1 Standard:** ISO 9241-210 - Human-Centred Design for Interactive Systems

## Verification Summary

### S1 Results (All PASS)

| Metric | Target | Achieved | Margin | Status |
|--------|--------|----------|--------|--------|
| IAE | ≤ 0.025 m·s | 0.025 m·s | 0% | ✅ PASS |
| Max Lateral Error | < 0.15 m | 0.0008 m | 99% | ✅ PASS |
| Completion Time | ≤ 75 s | 75.00 s | 0% | ✅ PASS |
| Energy Consumption | < 65 | 63.0 | 3% | ✅ PASS |

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

## RTM v0.8 Status

| Req ID | Requirement | Status |
|--------|-------------|--------|
| R-TRACK-01 | Lateral error < 0.15 m | ✅ PASS |
| R-TRACK-02 | IAE ≤ 0.025 m·s | ✅ PASS |
| R-PERF-01 | Completion time ≤ 75 s | ✅ PASS |
| R-ENERGY-01 | Energy consumption < 65 | ✅ PASS |
| R-OBS-01 | Zero obstacle contacts | ✅ PASS |
| R-OBS-02 | Complete S2 scenario | ✅ PASS |
| R-SAFE-01 | Speed ≤ 0.45 m/s in fault | ✅ PASS |
| R-ROBUST-01 | Detect fault within 1 cycle | ✅ PASS |
| R-HMI-01 | Display telemetry at ≥10 Hz | ⏳ Pending |

**Total Requirements:** 9
**Pass:** 8
**Pending:** 1 (HMI for CA4)
**Coverage:** 100% for S1/S2/S3

## CA2 → CA3 Improvements

| Metric | CA2 | CA3 | Improvement |
|--------|-----|-----|-------------|
| IAE | 2.1222 | 0.025 | **98.8%** ⬇️ |
| Completion Time | >120 s | 75.00 s | **37.5%** ⬇️ |
| Energy | 74.0 | 63.0 | **14.9%** ⬇️ |
| Max Error | >0.30 m | 0.0008 m | **99.7%** ⬇️ |

## Critical Observations

- **IAE and Completion Time are at 0% margin** - operating exactly at limits
- Conservative tuning (v_base = 0.42 m/s) prioritized energy over speed
- **For CA4:** Increase v_base to 0.45-0.50 m/s and fine-tune gains

## Known Issues for CA4
1. IAE at limit (0% margin) - need to achieve ≤ 0.022
2. Completion Time at limit (0% margin) - need to achieve < 72 s
3. HMI development pending
4. Fault recovery can be improved with state machine

## Deliverables Checklist
- [x] Verification Report
- [x] S1 Verified Log
- [x] S2 Preliminary Log
- [x] S3 Preliminary Log
- [x] RTM v0.8
- [x] Risk Log
- [ ] Controller Updated (controller_updated.m)
- [ ] Plant Model Documentation

## Changelog
- 2026-03-12: Created CA3 folder structure
- 2026-03-12: RTM v0.8 template created
- 2026-03-22: Added verification logs from Member 180
- 2026-03-22: Updated RTM with PASS results
- 2026-03-22: Updated README with final metrics
