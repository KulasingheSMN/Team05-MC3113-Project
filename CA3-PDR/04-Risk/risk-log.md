# Risk Log - Team 05 (CA3 PDR)

## Risk Register

| Risk ID | Description | Likelihood | Impact | Mitigation Plan | Owner | Status |
|:--------|:------------|:-----------|:-------|:-----------------|:-------|:-------|
| RISK-01 | S1 time exceeds 75s target | ~~Medium~~ **Low** | High | ✅ **MITIGATED** - Achieved 75.00s exactly. For CA4: Increase v_base to 0.45-0.50 m/s to add margin | Member 180 | **Mitigated** |
| RISK-02 | IAE exceeds 0.025 m·s target | ~~Medium~~ **Low** | High | ✅ **MITIGATED** - Achieved 0.025 exactly. For CA4: Fine-tune gains to achieve ≤0.022 | Member 180 | **Mitigated** |
| RISK-03 | Energy exceeds 60 units | ~~Low~~ **Low** | Medium | ✅ **MITIGATED** - Achieved 63.0 (<65 target). For CA4: Monitor with speed increase | Member 180 | **Mitigated** |
| RISK-04 | S2 obstacle avoidance fails | ~~Medium~~ **Low** | High | ✅ **MITIGATED** - 0 obstacle contacts achieved. For CA4: Increase threshold to 1.2m | Member 180 | **Mitigated** |
| RISK-05 | S3 fault recovery not working | Medium | High | ⚠️ **PARTIAL** - Fault detection works (0.30 m/s cap). Recovery needs state machine for CA4 | Member 180 | **Open** |
| RISK-06 | RTM not updated with results | ~~Low~~ **Low** | Medium | ✅ **MITIGATED** - RTM v0.8 updated with all PASS results | Member 43 | **Closed** |
| RISK-07 | Team member delays | Low | Medium | ⚠️ **ONGOING** - Member 46 and 53 files still pending. Continue daily check-ins | Member 43 | **Open** |

## New Risks Identified from CA3 Results

| Risk ID | Description | Likelihood | Impact | Mitigation Plan | Owner | Status |
|:--------|:------------|:-----------|:-------|:-----------------|:-------|:-------|
| RISK-08 | IAE and Time at 0% margin (no safety buffer) | Medium | High | Increase v_base to 0.45-0.50 m/s and fine-tune PID gains for CA4 | Member 180 | Open |
| RISK-09 | Energy may increase with speed increase | Low | Medium | Monitor energy consumption when increasing v_base; target to stay <65 | Member 43 | Open |
| RISK-10 | HMI development delayed to CA4 | Low | Medium | Allocate sufficient time (minimum 3 days) for HMI development in CA4 | Member 43 | Open |

## Risk Mitigation Status (as of March 24)

### Resolved Risks (CA3 Targets Met)
- ✅ **RISK-01**: Time target met (75.00s)
- ✅ **RISK-02**: IAE target met (0.025)
- ✅ **RISK-03**: Energy target met (63.0)
- ✅ **RISK-04**: Obstacle avoidance successful (0 contacts)
- ✅ **RISK-06**: RTM updated with results

### Partially Resolved
- ⚠️ **RISK-05**: Fault detection works, recovery pending for CA4
- ⚠️ **RISK-07**: Member delays - Member 46 and 53 files pending

### Open for CA4
- 🔴 **RISK-08**: Need to add safety margins for IAE and Time
- 🟡 **RISK-09**: Energy trade-off with speed increase
- 🟡 **RISK-10**: HMI development for CA4

## CA4 Priority Actions

| Priority | Action | Owner |
|:---------|:-------|:-------|
| 1 | Increase v_base to 0.45-0.50 m/s to add time margin | Member 180 |
| 2 | Fine-tune PID gains to achieve IAE ≤ 0.022 | Member 180 |
| 3 | Implement state machine for S3 fault recovery | Member 180 |
| 4 | Increase obstacle detection threshold to 1.2 m | Member 180 |
| 5 | Complete HMI development | Member 43 |
| 6 | Finalize plant model documentation | Member 46 |
| 7 | Finalize DfX rationale | Member 53 |

## Risk Scoring Guide
- **Likelihood:** L (<10% chance), M (10-50% chance), H (>50% chance)
- **Impact:** L (minor delay), M (requirement fail), H (project failure)
- **Status:** Open, Mitigated, Closed

---
*Last Updated: 2026-03-24 by Member 43*
