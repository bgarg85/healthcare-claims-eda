# Healthcare Claims EDA (HC01 Project)

Exploratory Data Analysis of synthetic healthcare claims data using **SQL + Python**.  
This project is part of my **CUP Master Plan (Phase 0)** and serves as the foundation for advanced analytics in healthcare and insurance.

---

## 📂 Project Structure
```
healthcare-claims-eda/
├── data/          # Input datasets (claims, members, providers)
├── sql/           # SQL queries (01_basics.sql, joins, cleaning scripts)
├── notebooks/     # Jupyter notebooks (EDA, visualizations)
├── docs/          # Data dictionary, screenshots, supporting docs
├── README.md      # Project overview
└── LICENSE        # MIT open-source license
```

---

## 📊 Dataset Overview
- **claims.csv** → claim_id, member_id, provider_id, claim_date, billed_amount, paid_amount, status, plan_type, etc.  
- **members.csv** → member_id, gender, DOB, state, plan_type, enrollment_date.  
- **providers.csv** → provider_id, provider_name, specialty, state, network_flag.  

---

## ⚙️ Technical Stack
- **Database**: SQLite (queries in `/sql`)  
- **EDA Tools**: Python (pandas, matplotlib, seaborn)  
- **Version Control**: Git & GitHub  

---

## 🚀 How to Reproduce
1. Clone the repo:
   ```bash
   git clone https://github.com/bgarg85/healthcare-claims-eda.git
   cd healthcare-claims-eda
   ```
2. Load the SQL scripts in SQLite:
   ```sql
   .read sql/01_basics.sql
   ```
3. Run Python notebooks (coming soon) for EDA and visuals.

---

## 📌 Blogs & Writeups
- [Why I’m Learning SQL + Python with Healthcare Data]([https://www.linkedin.com/posts/bhanu-garg](https://www.linkedin.com/posts/bhanu-garg-25699614_healthcaredata-sql-python-activity-7366199184254836736-Qd5m?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAL-LuIB6PLVnQ3cZdiy4U7LLEZrDb3CPV4))  
- Blog 1: From CSV to Insight — My First Healthcare Claims EDA in Python (coming soon)  
- HC01 Showcase Blog: Exploratory Analysis of Healthcare Claims Data (coming soon)  

---

## 📜 License
This project is licensed under the [MIT License](LICENSE)
