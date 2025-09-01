# HC01 Project Progress Log  
📅 Last Updated: 2025-09-01


## Phase 0 — Setup & Foundations

### ✅ Progress So Far
- Created public GitHub repo **`healthcare-claims-eda`** with MIT license.  
- Added data files:  
  - `data/claims.csv`  
  - `data/members.csv`  
  - `data/providers.csv`  
- Added SQL basics file:  
  - `sql/01_basics.sql` (imported via GUI, saved and committed).  
- Added **`docs/CLI_Journal.md`** (tracks CLI commands + descriptions).  
- Updated **README.md** with project overview + LinkedIn blog link.  
- Configured Git locally (name/email, credential manager, PAT setup).  
- Resolved local deletion and sync issues:  
  - Used `git restore` for local file recovery.  
  - Fixed non–fast-forward errors with `git pull --rebase` before push.  
- Added developer notes file:  
  - `docs/CLI_Journal.md` (step-by-step CLI history).  

---

### 🚀 Next Steps
1. **Set up Python environment**  
   - Create venv inside repo.  
   - Install `jupyter pandas numpy matplotlib`.  

2. **Start first EDA notebook**  
   - Path: `notebooks/01_eda.ipynb`.  
   - Steps:  
     - Imports → Load CSVs → Parse dates / clean data.  
     - Derive `year_month` + `age_years`.  
     - Joins across claims/members/providers.  
     - Summary stats + key visuals (billed/paid distributions, monthly paid trend, top providers, denial rates, age bands).  

3. **Document learnings**  
   - Add `docs/data_dictionary.md` after EDA.  
   - Capture key insights & screenshots for README.  

4. **Blogs (Phase 0)**  
   - Publish Blog 1: *From CSV to Insight — My First Healthcare Claims EDA in Python*.  
   - Then publish HC01 Showcase Blog: *Exploratory Analysis of Healthcare Claims Data — My HC01 Project* (with related blogs cross-linked).  

---

### 📝 Notes
- Git config & credential setup stable.  
- Folder deletion issue resolved with restore.  
- All work synced to GitHub.  
- CLI Journal serves as command reference; this file = narrative log.  
