# Risk Log - Team 05 (CA3 PDR)

## Risk Register

| Risk ID | Description | Likelihood | Impact | Mitigation Plan | Owner | Status |
|:--------|:------------|:-----------|:-------|:-----------------|:-------|:-------|
| RISK-01 | S1 time exceeds 75s target | Medium | High | ✅ MITIGATED - Achieved 75.00s exactly. For CA4: Increase v_base to 0.45-0.50 m/s | Member 180 | Mitigated |
| RISK-02 | IAE exceeds 0.025 m·s target | Medium | High | ✅ MITIGATED - Achieved 0.025 exactly. For CA4: Fine-tune gains to achieve ≤0.022 | Member 180 | Mitigated |
| RISK-03 | Energy exceeds 60 units | Low | Medium | ✅ MITIGATED - Achieved 63.0 (<65 target). For CA4: Monitor with speed increase | Member 180 | Mitigated |
| RISK-04 | S2 obstacle avoidance fails | Medium | High | ✅ MITIGATED - 0 obstacle contacts achieved. For CA4: Increase threshold to 1.2m | Member 180 | Mitigated |
| RISK-05 | S3 fault recovery not working | Medium | High | ⚠️ PARTIAL - Fault detection works (0.30 m/s cap). Recovery needs state machine for CA4 | Member 180 | Open |
| RISK-06 | IAE at 0% margin (no safety buffer) | Medium | High | Fine-tune PID gains for CA4 to achieve ≤ 0.022 | Member 180 | Open |
| RISK-07 | Completion time at 0% margin (no safety buffer) | Medium | High | Increase v_base to 0.45-0.50 m/s for CA4 | Member 180 | Open |
| RISK-08 | Energy may increase with speed increase | Low | Medium | Monitor energy consumption when increasing v_base; target to stay <65 | Member 43 | Open |
| RISK-09 | HMI development delayed to CA4 | Low | Medium | Allocate sufficient time (minimum 3 days) for HMI development in CA4 | Member 43 | Open |

---

## Risk Scoring Guide
- **Likelihood:** L (<10% chance), M (10-50% chance), H (>50% chance)
- **Impact:** L (minor delay), M (requirement fail), H (project failure)
- **Status:** Open, Mitigated, Closed

---

## Risk Status Summary

| Status | Count | Risk IDs |
|:-------|:------|:---------|
| ✅ Mitigated | 4 | RISK-01, RISK-02, RISK-03, RISK-04 |
| ⚠️ Partial | 1 | RISK-05 |
| 🔴 Open | 4 | RISK-06, RISK-07, RISK-08, RISK-09 |

---

## CA4 Priority Actions

| Priority | Action | Owner | Related Risk |
|:---------|:-------|:-------|:-------------|
| 1 | Increase v_base to 0.45-0.50 m/s | Member 180 | RISK-07 |
| 2 | Fine-tune PID gains for IAE ≤ 0.022 | Member 180 | RISK-06 |
| 3 | Implement state machine for fault recovery | Member 180 | RISK-05 |
| 4 | Complete HMI development | Member 43 | RISK-09 |
| 5 | Increase obstacle threshold to 1.2 m | Member 180 | RISK-04 |
| 6 | Monitor energy with speed increase | Member 43 | RISK-08 |

---

## CA3 Achievements Summary

All CA3 requirements were successfully met:

| Metric | Target | Achieved | Status |
|--------|--------|----------|--------|
| IAE | ≤ 0.025 m·s | 0.025 m·s | ✅ PASS |
| Time | ≤ 75 s | 75.00 s | ✅ PASS |
| Energy | < 65 | 63.0 | ✅ PASS |
| Max Error | < 0.15 m | 0.0008 m | ✅ PASS |
| Obstacle Contacts | 0 | 0 | ✅ PASS |
| Fault Speed | ≤ 0.45 m/s | 0.30 m/s | ✅ PASS |

---

*Last Updated: 2026-03-25 by Member 43*
