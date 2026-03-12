# Requirements Specification - Team 05
## ISO 9241-210: Human-Centred Design for Interactive Systems

## Functional Requirements

### R-TRACK-01
**Requirement:** The robot shall maintain lateral tracking error within tolerance during S1 nominal scenario.
**Acceptance Criterion:** |e_line| < 0.15 m for all t ∈ [0,75] s
**Justification:** ISO 12100 Clause 5.2: Predictable motion requirement for safe operation. ISO 9241-210 Clause 5.2: Understanding the operational context defines this core functional need.

### R-TRACK-02
**Requirement:** The robot shall minimize cumulative tracking error over the full S1 scenario.
**Acceptance Criterion:** IAE < 0.030 m·s
**Justification:** Performance optimization derived from user need for precision. ISO 9241-210 Clause 5.3: Translating the high-level user goal of "accurate tracking" into a measurable technical target.

### R-OBS-01
**Requirement:** The robot shall avoid collision with static obstacles during S2 scenario.
**Acceptance Criterion:** Number of obstacle contacts = 0
**Justification:** ISO 12100: Fundamental safety requirement. ISO 9241-210 Clause 5.2: The context includes unexpected obstacles, so the system must handle them.

### R-OBS-02
**Requirement:** The robot shall complete the S2 scenario after obstacle avoidance maneuver.
**Acceptance Criterion:** Scenario completed without manual intervention
**Justification:** Functional continuity - the system must recover. ISO 9241-210 Clause 5.6: The design must be evaluated on its ability to handle complete scenarios, not just isolated functions.

### R-SAFE-01
**Requirement:** The robot shall limit speed during sensor fault condition.
**Acceptance Criterion:** v ≤ 0.45 m/s when fault_flag = 1
**Justification:** IEC 61508: Safe state requirement. ISO 9241-210 Clause 5.6: Safety is a key usability outcome - the system must behave predictably even in fault conditions.

## Non-Functional Requirements

### R-PERF-01
**Requirement:** The robot shall complete S1 scenario within specified time limit.
**Acceptance Criterion:** t_final ≤ 75 s
**Justification:** ISO 9241-210 Clause 5.3: User efficiency requirement - the task should complete in a reasonable time.

### R-ENERGY-01
**Requirement:** The controller shall minimize control energy usage.
**Acceptance Criterion:** Energy proxy < 65
**Justification:** Sustainability consideration. ISO 9241-210 Clause 5.2: Part of the broader context includes environmental impact.

### R-ROBUST-01
**Requirement:** The controller shall detect and respond to temporary sensor dropout.
**Acceptance Criterion:** Fault detected within 1 control cycle
**Justification:** ISO 9241-210 Clause 5.6: Reliability directly impacts user trust and system usability. A system that fails silently is not user-centered.

### R-HMI-01
**Requirement:** The HMI shall display real-time telemetry (e_line, v, ω, flags) during simulation.
**Acceptance Criterion:** All variables update at ≥10 Hz, clearly labeled
**Justification:** ISO 9241-210 Clause 5.3: Direct translation of user need for "clear feedback" into a measurable requirement. Clause 5.2: Understanding the user's need to monitor system state in real-time.

## Summary Count
- **Total Functional Requirements (FR):** 5
- **Total Non-Functional Requirements (NFR):** 4
- **Total Requirements:** 9

## Standards Reference
- **Primary Standard:** ISO 9241-210:2019 - Ergonomics of human-system interaction
- **Secondary Standards:** ISO 12100, IEC 61508

## Document Control
- **Version:** 1.1
- **Date:** 2026-03-12
- **Author:** Team 05
- **CA1 Standard Applied:** ISO 

# Create the requirements.md file
cat > requirements.md << 'EOF'
# Requirements Specification - Team 05
## ISO 9241-210: Human-Centred Design for Interactive Systems

## Functional Requirements

### R-TRACK-01
**Requirement:** The robot shall maintain lateral tracking error within tolerance during S1 nominal scenario.
**Acceptance Criterion:** |e_line| < 0.15 m for all t ∈ [0,75] s
**Justification:** ISO 12100 Clause 5.2: Predictable motion requirement for safe operation. ISO 9241-210 Clause 5.2: Understanding the operational context defines this core functional need.

### R-TRACK-02
**Requirement:** The robot shall minimize cumulative tracking error over the full S1 scenario.
**Acceptance Criterion:** IAE < 0.030 m·s
**Justification:** Performance optimization derived from user need for precision. ISO 9241-210 Clause 5.3: Translating the high-level user goal of "accurate tracking" into a measurable technical target.

### R-OBS-01
**Requirement:** The robot shall avoid collision with static obstacles during S2 scenario.
**Acceptance Criterion:** Number of obstacle contacts = 0
**Justification:** ISO 12100: Fundamental safety requirement. ISO 9241-210 Clause 5.2: The context includes unexpected obstacles, so the system must handle them.

### R-OBS-02
**Requirement:** The robot shall complete the S2 scenario after obstacle avoidance maneuver.
**Acceptance Criterion:** Scenario completed without manual intervention
**Justification:** Functional continuity - the system must recover. ISO 9241-210 Clause 5.6: The design must be evaluated on its ability to handle complete scenarios, not just isolated functions.

### R-SAFE-01
**Requirement:** The robot shall limit speed during sensor fault condition.
**Acceptance Criterion:** v ≤ 0.45 m/s when fault_flag = 1
**Justification:** IEC 61508: Safe state requirement. ISO 9241-210 Clause 5.6: Safety is a key usability outcome - the system must behave predictably even in fault conditions.

## Non-Functional Requirements

### R-PERF-01
**Requirement:** The robot shall complete S1 scenario within specified time limit.
**Acceptance Criterion:** t_final ≤ 75 s
**Justification:** ISO 9241-210 Clause 5.3: User efficiency requirement - the task should complete in a reasonable time.

### R-ENERGY-01
**Requirement:** The controller shall minimize control energy usage.
**Acceptance Criterion:** Energy proxy < 65
**Justification:** Sustainability consideration. ISO 9241-210 Clause 5.2: Part of the broader context includes environmental impact.

### R-ROBUST-01
**Requirement:** The controller shall detect and respond to temporary sensor dropout.
**Acceptance Criterion:** Fault detected within 1 control cycle
**Justification:** ISO 9241-210 Clause 5.6: Reliability directly impacts user trust and system usability. A system that fails silently is not user-centered.

### R-HMI-01
**Requirement:** The HMI shall display real-time telemetry (e_line, v, ω, flags) during simulation.
**Acceptance Criterion:** All variables update at ≥10 Hz, clearly labeled
**Justification:** ISO 9241-210 Clause 5.3: Direct translation of user need for "clear feedback" into a measurable requirement. Clause 5.2: Understanding the user's need to monitor system state in real-time.

## Summary Count
- **Total Functional Requirements (FR):** 5
- **Total Non-Functional Requirements (NFR):** 4
- **Total Requirements:** 9

## Standards Reference
- **Primary Standard:** ISO 9241-210:2019 - Ergonomics of human-system interaction
- **Secondary Standards:** ISO 12100, IEC 61508

## Document Control
- **Version:** 1.1
- **Date:** 2026-03-12
- **Author:** Team 05
- **CA1 Standard Applied:** ISO 9241-210
