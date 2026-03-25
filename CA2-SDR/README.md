# CA2 SDR Submission - Team 05

## Team Information
- **Team Number:** 05
- **Members:**
  - D/ENG/24/0043/MC (Section 1.1 - Requirements & RTM)
  - D/ENG/24/0046/MC (Section 1.2 - Architecture)
  - D/ENG/24/0053/MC (Section 1.3 - DfX)
  - D/ENG/24/0180/MC (Section 1.4 - Controller Implementation)
- **CA1 Standard:** ISO 9241-210 - Human-Centred Design for Interactive Systems

## Deliverables Checklist
- [x] Requirements document (requirements.pdf, requirements.md)
- [x] Architecture diagrams (BDD.png, IBD.png, ICD.csv)
- [x] DfX rationale (dfx-rationale.pdf)
- [x] Controller code (controller.m)
- [x] S1 baseline log (S1_baseline_log.csv)
- [x] S1 plots (3 PNG files in S1_plots/)
- [x] RTM v0.1 (rtm_v0.1.csv)

## How to Run Controller

### Prerequisites
- MATLAB R2020b or later
- Digital twin repo: https://github.com/asithakal/MC3113-LineFollower-AY25.git

### Execution Steps
1. Clone this team repo
2. Open MATLAB, navigate to `CA2-SDR/04-Controller/`
3. Add digital twin to path
4. Run test script
5. Outputs:
   - S1 log saved to `S1_baseline_log.csv`
   - Plots saved to `S1_plots/`
   - Metrics printed to console

## Key Metrics (S1 Baseline)

| Metric | Target | Achieved | Status |
|--------|--------|----------|--------|
| IAE | < 0.030 m·s | 2.1222 m·s | Fail |
| Max \|e_line\| | < 0.15 m | 0.14 m | Pass |
| Final time | ≤ 75 s | 78.3 s | Fail (+4.4%) |
| Energy proxy | (no target) | 74.0 | - (baseline) |

## Known Issues

1. **S1 time exceeds target by 3.3 s:**
   - Cause: Base speed (v_base = 0.32 m/s) too conservative
   - Proposed fix: Increase to 0.65 m/s for CA3, validate no overshoot

2. **IAE far exceeds 0.030 m·s:**
   - Cause: Gains not optimized, no integral action (Ki=0)
   - Proposed fix: Complete 12 iterations of tuning, add integral saturation

3. **S2/S3 tests pending:**
   - Will be completed in CA3 after incorporating CA2 feedback

## Design Decisions

- **Controller type:** PID selected over state-space (Pugh matrix score: 8.35 vs. 7.65)
- **Tuning method:** Systematic iteration (14 iterations in CA2)
- **Gains:** Kp = -0.6, Ki = 0, Kd = -0.80, v_base = 0.32 (CA2 final)
- **Standard Applied:** ISO 9241-210 (Human-Centred Design)

## Changelog

- 2026-03-12: Requirements document drafted (9 requirements defined with ISO 9241-210)
- 2026-03-12: BDD/IBD finalized in Gaphor, ICD exported
- 2026-03-12: PID controller implemented, S1 log generated (14 iterations)
- 2026-03-12: DfX rationale with Pugh matrix and LCA screening
- 2026-03-12: RTM v0.1 populated with 9 requirements
- 2026-03-12: Plots generated, README completed
- 2026-03-12: Submission branch `submissions/CA2` created
