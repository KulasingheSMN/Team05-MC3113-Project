# Requirements Specification – Team 05  
MC3113 – CA2 System Design Review  

---

## Functional Requirements

### R-TRACK-01  
**Requirement:** The robot shall maintain lateral tracking error within tolerance during S1 nominal scenario.  
**Acceptance Criterion:** |e_line| < 0.15 m for all t ∈ [0,75] s  
**Justification:** Predictable motion requirement (ISO 12100 Clause 5.2)

---

### R-TRACK-02  
**Requirement:** The robot shall minimize cumulative tracking error over the full S1 scenario.  
**Acceptance Criterion:** IAE < 0.030 m·s  
**Justification:** Performance optimization target for accurate line following

---

### R-OBS-01  
**Requirement:** The robot shall avoid collision with static obstacles during S2 scenario.  
**Acceptance Criterion:** Number of obstacle contacts = 0  
**Justification:** Safe obstacle avoidance requirement

---

### R-OBS-02  
**Requirement:** The robot shall complete the S2 scenario after obstacle avoidance maneuver.  
**Acceptance Criterion:** Scenario completed successfully without manual intervention  
**Justification:** Functional continuity requirement

---

### R-SAFE-01  
**Requirement:** The robot shall limit speed during sensor fault condition.  
**Acceptance Criterion:** v ≤ 0.45 m/s when fault_flag = 1  
**Justification:** IEC 61508 safe state requirement

---

## Non-Functional Requirements

### R-PERF-01  
**Requirement:** The robot shall complete S1 scenario within the specified time limit.  
**Acceptance Criterion:** t_final ≤ 75 s  
**Justification:** Performance efficiency target

---

### R-ENERGY-01  
**Requirement:** The controller shall minimize control energy usage.  
**Acceptance Criterion:** Energy proxy < 65  
**Justification:** Sustainability and efficiency consideration

---

### R-ROBUST-01  
**Requirement:** The controller shall detect and respond to temporary sensor dropout.  
**Acceptance Criterion:** Fault detected within 1 control cycle  
**Justification:** Reliability requirement
