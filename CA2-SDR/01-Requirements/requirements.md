# Requirements Specification - Team 05
## ISO 9241-210: Human-Centred Design for Interactive Systems

## Functional Requirements

### R-TRACK-01
**Requirement:** The robot shall maintain lateral tracking error within tolerance during S1 nominal scenario.
**Acceptance Criterion:** |e_line| < 0.15 m for all t ∈ [0,75] s
**Justification:** Per ISO 12100 Cl. 5.2: Predictable motion requirement for safe operation. Per ISO 9241-210 Cl. 5.2: Understanding the operational context defines this core functional need.

### R-TRACK-02
**Requirement:** The robot shall minimize cumulative tracking error over the full S1 scenario.
**Acceptance Criterion:** IAE ≤ 0.025 m·s
**Justification:** Per ISO 9241-210 Cl. 5.3: Translating the high-level user goal of "accurate tracking" into a measurable technical target. Per ISO/IEC 25010 Cl. 7.2.1: Performance efficiency requirement for tracking accuracy.

### R-OBS-01
**Requirement:** The robot shall avoid collision with static obstacles during S2 scenario.
**Acceptance Criterion:** Number of obstacle contacts = 0
**Justification:** Per ISO 12100 Cl. 5.4: Risk reduction through protective measures. Per ISO 9241-210 Cl. 5.2: The context includes unexpected obstacles, so the system must handle them.

### R-OBS-02
**Requirement:** The robot shall complete the S2 scenario after obstacle avoidance maneuver.
**Acceptance Criterion:** Scenario completed without manual intervention
**Justification:** Per ISO 9241-210 Cl. 5.6: The design must be evaluated on its ability to handle complete scenarios, not just isolated functions. Per ISO/IEC 25010 Cl. 7.3.1: Recoverability requirement for system continuity.

### R-SAFE-01
**Requirement:** The robot shall limit speed during sensor fault condition.
**Acceptance Criterion:** v ≤ 0.45 m/s when fault_flag = 1
**Justification:** Per IEC 61508 Cl. 7.4.2.3: Safe state requirement for fault conditions. Per ISO 9241-210 Cl. 5.6: Safety is a key usability outcome - the system must behave predictably even in fault conditions.

## Non-Functional Requirements

### R-PERF-01
**Requirement:** The robot shall complete S1 scenario within specified time limit.
**Acceptance Criterion:** t_final ≤ 75 s
**Justification:** Per ISO 9241-210 Cl. 5.3: User efficiency requirement - the task should complete in a reasonable time. Per ISO/IEC 25010 Cl. 7.2.5: Time behaviour performance requirement.

### R-ENERGY-01
**Requirement:** The controller shall minimize control energy usage.
**Acceptance Criterion:** Energy proxy ≤ 60
**Justification:** Per ISO 14040 Cl. 4.3.1: Life cycle impact assessment - energy consumption is a key environmental indicator. Per ISO 9241-210 Cl. 5.2: Part of the broader context includes environmental impact.

### R-ROBUST-01
**Requirement:** The controller shall detect and respond to temporary sensor dropout.
**Acceptance Criterion:** Fault detected within 1 control cycle
**Justification:** Per ISO 9241-210 Cl. 5.6: Reliability directly impacts user trust and system usability. Per ISO/IEC 25010 Cl. 7.2.2: Fault tolerance requirement - a system that fails silently is not user-centered.

### R-HMI-01
**Requirement:** The HMI shall display real-time telemetry (e_line, v, ω, flags) during simulation.
**Acceptance Criterion:** All variables update at ≥10 Hz, clearly labeled
**Justification:** Per ISO 9241-210 Cl. 5.3: Direct translation of user need for "clear feedback" into a measurable requirement. Per ISO 9241-210 Cl. 5.2: Understanding the user's need to monitor system state in real-time.

## Summary Count
- **Total Functional Requirements (FR):** 5
- **Total Non-Functional Requirements (NFR):** 4
- **Total Requirements:** 9

## Standards Reference
| Standard | Clause | Application |
|:---------|:-------|:------------|
| ISO 9241-210:2019 | Cl. 5.2, 5.3, 5.6 | Human-centred design (Primary CA1 Standard) |
| ISO 12100 | Cl. 5.2, 5.4 | Safety of machinery |
| IEC 61508 | Cl. 7.4.2.3 | Functional safety |
| ISO 14040 | Cl. 4.3.1 | Life cycle assessment |
| ISO/IEC 25010 | Cl. 7.2.1, 7.2.2, 7.2.5, 7.3.1 | System and software quality requirements |

## Document Control
- **Version:** 1.2
- **Date:** 2026-03-20
- **Author:** Team 05
- **CA1 Standard Applied:** ISO 9241-210 (Cl. 5.2, 5.3, 5.6)
