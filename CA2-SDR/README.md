# CA2 SDR Submission - Team 05

## Team Information
- **Team Number:** 05
- **Members:**
  - D/ENG/24/0043/MC (Requirements & RTM Lead) - Repository Owner
  - D/ENG/24/0046/MC (Architecture Lead)
  - D/ENG/24/0053/MC (DfX Lead)
  - D/ENG/24/0180/MC (Controller Implementation Lead)
- **CA1 Standard:** ISO 9241-210 - Human-Centred Design for Interactive Systems

## Deliverables Checklist
- [x] Requirements document (requirements.pdf, requirements.md)
- [ ] Architecture diagrams (BDD.png, IBD.png, ICD.csv)
- [ ] DfX rationale (dfx-rationale.pdf)
- [ ] Controller code (controller.m)
- [ ] S1 baseline log (S1_baseline_log.csv)
- [ ] S1 plots (3 PNG files in S1_plots/)
- [x] RTM v0.1 (rtm_v0.1.csv)

## How to Run Controller

### Prerequisites
- MATLAB R2020b or later
- Digital twin repo: https://github.com/asithakal/MC3113-LineFollower-AY25.git

### Execution Steps
1. Clone this team repo
2. Open MATLAB, navigate to CA2-SDR/04-Controller/
3. Add digital twin to path
4. Run test script: test_s1_controller

## Key Metrics (S1 Baseline)
| Metric | Target | Achieved | Status |
|--------|--------|----------|--------|
| IAE | < 0.030 m·s | 2.1222 | ❌ Fail |
| Max |e_line| | < 0.15 m | 0.14 m | ✅ Pass |
| Final time | ≤ 75 s | 78.3 s | ❌ Fail |
| Energy proxy | (no target) | 74.0 | Baseline |

## RTM v0.1 Summary
- Total Requirements: 9
- Pass: 2
- Fail: 1
- Pending: 6

## Known Issues (To be fixed in CA3)
1. Time exceeds target: Increase v_base to 0.65
2. IAE far exceeds target: Complete tuning iterations, add anti-windup
3. S2/S3 tests pending: Will be completed in CA3

## Design Decisions
- Controller type: PID selected over state-space
- Gains: Kp = -0.6, Ki = 0, Kd = -0.80, v_base = 0.32 (CA2 final)
- Standard: ISO 9241-210 (Human-Centred Design)

## Changelog
- 2026-03-12: Requirements created (9 requirements)
- 2026-03-12: RTM v0.1 created
- 2026-03-12: README created

## GitHub Links
- Main: https://github.com/KulasingheSMN/Team05-MC3113-Project
- CA2 Submission: https://github.com/KulasingheSMN/Team05-MC3113-Project/tree/submissions/CA2
