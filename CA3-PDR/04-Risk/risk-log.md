# Risk Log - Team 05 (CA3 PDR)

## Risk Register

| Risk ID | Description | Likelihood | Impact | Mitigation Plan | Owner | Status |
|---------|-------------|------------|--------|-----------------|-------|--------|
| RISK-01 | S1 time exceeds 75s target | Medium | High | Increase v_base to 0.65 m/s, test multiple runs | Member 80 | Open |
| RISK-02 | IAE exceeds 0.025 m·s target | Medium | High | Add anti-windup, fine-tune PID gains (Kp, Ki, Kd) | Member 80 | Open |
| RISK-03 | Energy exceeds 60 units | Low | Medium | Optimize control effort, reduce unnecessary corrections | Member 80 | Open |
| RISK-04 | S2 obstacle avoidance fails | Medium | High | Reduce speed during obstacle, increase detection range to 1.2m | Member 80 | Open |
| RISK-05 | S3 fault recovery not working | Medium | High | Implement state machine for recovery in CA4 | Member 80 | Open |
| RISK-06 | RTM not updated with results | Low | Medium | Update RTM immediately after receiving test results | Member 43 | Open |
| RISK-07 | Team member delays | Low | Medium | Daily check-ins, clear deadlines | Member 43 | Open |

## Risk Scoring Guide
- **Likelihood:** L (<10% chance), M (10-50% chance), H (>50% chance)
- **Impact:** L (minor delay), M (requirement fail), H (project failure)
- **Status:** Open, Mitigated, Closed

## Risk Mitigation Status (as of March 12)
- All risks currently OPEN
- Will be updated as CA3 progresses
