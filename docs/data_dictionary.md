# 📘 Data Dictionary — HC01 Healthcare Claims EDA

This document describes the structure and meaning of each dataset used in the HC01 Phase 0 EDA.

---

## Claims Table

| Column              | Type       | Description |
|---------------------|------------|-------------|
| claim_id            | string     | Unique identifier for the claim |
| member_id           | string     | Foreign key linking to the member who filed the claim |
| provider_id         | string     | Foreign key linking to the provider who serviced the claim |
| claim_date          | date       | Date claim was filed or processed |
| claim_type          | string     | Type of claim (e.g., Medical, Pharmacy, Dental) |
| diagnosis_code      | string     | ICD code for diagnosis associated with the claim |
| procedure_code      | integer    | CPT/HCPCS code for the procedure performed |
| place_of_service    | string     | Location where service was provided (e.g., inpatient, outpatient) |
| billed_amount       | float      | Total amount billed by provider |
| allowed_amount      | float      | Negotiated/contracted amount insurer allows |
| paid_amount         | float      | Final amount paid to provider |
| status              | string     | Claim status (e.g., Paid, Denied, Pending) |
| plan_type           | string     | Type of insurance plan (e.g., HMO, PPO) |
| network_flag        | string     | In-network vs out-of-network flag |
| ndc_code            | string     | National Drug Code (if pharmacy claim) |
| drg_code            | float      | Diagnosis Related Group code (for inpatient claims) |
| copay               | float      | Patient copay amount applied |
| coinsurance         | float      | Patient coinsurance applied |
| deductible_applied  | float      | Deductible amount applied to the claim |
| member_state        | string     | Member’s state at time of claim |

---

## Members Table

| Column          | Type   | Description |
|-----------------|--------|-------------|
| member_id       | string | Unique identifier for the member |
| first_name      | string | Member first name |
| last_name       | string | Member last name |
| dob             | date   | Member’s date of birth |
| gender          | string | Gender of the member |
| state           | string | State of residence |
| plan_type       | string | Type of insurance plan |
| enrollment_date | date   | Date the member enrolled in the plan |

---

## Providers Table

| Column        | Type   | Description |
|---------------|--------|-------------|
| provider_id   | string | Unique identifier for the provider |
| provider_name | string | Name of the healthcare provider |
| specialty     | string | Provider’s medical specialty (e.g., Cardiology, General Practice) |
| state         | string | State of practice |
| network_flag  | string | In-network vs out-of-network flag |
