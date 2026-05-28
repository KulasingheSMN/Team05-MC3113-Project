# Safety Evidence

## Required Files

| File | Description | Status |
|:-----|:------------|:-------|
| `safety-evidence.pdf` | S3 speed cap verification | ⏳ PENDING |
| `fault-injection-procedure.pdf` | Test procedure | ⏳ PENDING |

## Safety Requirements

| Req ID | Requirement | Target | Status |
|:-------|:------------|:-------|:-------|
| R-SAFE-01 | Speed cap during fault | v ≤ 0.45 m/s | ⏳ TO VERIFY |
| R-ROBUST-01 | Fault detection time | < 1 cycle | ⏳ TO VERIFY |

## Expected Verification Results

| Metric | Target | Expected | Margin |
|:-------|:-------|:---------|:-------|
| Max fault speed | ≤ 0.45 m/s | 0.30 m/s | 33% |
| Detection time | < 1 cycle | 0.01 s | PASS |

## Standards Compliance

**IEC 61508 Cl. 7.4.2.3 - Safe State Requirement**
- Hazard: Sensor failure → loss of tracking
- Safe state: Reduced speed (≤ 0.45 m/s)
- Detection: < 1 control cycle
- Validation: Fault injection testing

## Fault Injection Procedure

1. Inject sensor fault (e_line = NaN) at t = 40s
2. Verify fault_flag = 1 within 1 cycle
3. Verify speed reduced to ≤ 0.45 m/s
4. Clear fault after 25s
5. Verify system recovers

## Delivery Date
**30 May 2026** (Member 43)

---
*Owner: Member 43*
