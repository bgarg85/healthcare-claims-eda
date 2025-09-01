# HC01 — CLI Journal & Runbook

A chronological log of all command‑line actions for the **healthcare-claims-eda** repo.  
Use this to (a) remember what you ran and why, (b) link steps to commits, and (c) turn this into material for **Blog 6: GitHub for Analysts**.

---

## How to use this file
- **Add one row per action** you take in the terminal (Git Bash / PowerShell).
- Keep commands **copy‑pastable**; no sensitive tokens.
- After a successful push, paste the **commit link** for traceability.
- If a command fails, log it under *Outcome* with the error and the fix.

---

## Quick legend
- **cwd** = current working directory (repo path)
- **→** indicates what the command does / why it was run

---

## Chronology

| Timestamp | CWD | Command | What it does / Why | Outcome | Commit/Link |
|---|---|---|---|---|---|
| 2025-09-01 22:26 | `C:\Users\bhanu\Documents\CUP Projects\Phase 0\HC01\git\healthcare-claims-eda` | `git config --global user.name "Bhanu Garg"` | Set your Git author name globally | ✅ Set | — |
| 2025-09-01 22:26 | `C:\Users\bhanu\Documents\CUP Projects\Phase 0\HC01\git\healthcare-claims-eda` | `git config --global user.email "YOUR_GITHUB_EMAIL"` | Set your Git author email globally (must match GitHub) | ✅ Set | — |
| 2025-09-01 22:26 | `C:\Users\bhanu\Documents\CUP Projects\Phase 0\HC01\git\healthcare-claims-eda` | `git config --global credential.helper manager` | Enable secure Windows Credential Manager for Git (stores PAT) | ✅ Enabled | — |
| 2025-09-01 22:26 | `C:\Users\bhanu\Documents\CUP Projects\Phase 0\HC01\git` | `git clone https://github.com/bgarg85/healthcare-claims-eda.git` | Clone remote repo to your machine | ✅ Cloned | — |
| 2025-09-01 22:26 | `...\healthcare-claims-eda` | `mkdir data sql notebooks docs` | Create standard repo folders | ✅ Created | — |
| 2025-09-01 22:26 | `...\healthcare-claims-eda` | `git add .` | Stage all new/changed files | ✅ Staged | — |
| 2025-09-01 22:26 | `...\healthcare-claims-eda` | `git commit -m "Add CSVs and SQL basics"` | Record staged changes in local repo | ✅ Committed | *(paste commit URL after push)* |
| 2025-09-01 22:26 | `...\healthcare-claims-eda` | `git push origin main` | Upload local commits to GitHub | ✅ Pushed | *(paste PR/commit URL)* |
| 2025-09-01 22:26 | `...\healthcare-claims-eda` | `py -m venv .venv` | Create isolated Python environment | ✅ Created | — |
| 2025-09-01 22:26 | `...\healthcare-claims-eda` | `.\.venv\Scripts\Activate` | Activate the virtual environment | ✅ Activated | — |
| 2025-09-01 22:26 | `...\healthcare-claims-eda` | `pip install jupyter pandas numpy matplotlib` | Install core deps for EDA | ✅ Installed | — |
| 2025-09-01 22:26 | `...\healthcare-claims-eda` | `jupyter notebook` | Launch notebooks in browser | ✅ Running | http://localhost:8888 |

> Tip: after pushing changes on GitHub, copy the **commit URL** (e.g., `https://github.com/bgarg85/healthcare-claims-eda/commit/<sha>`) and paste it into the table.

---

## Common commands (cheatsheet)
- `git status` → See what changed since last commit
- `git add <file>` → Stage a specific file
- `git add .` → Stage everything
- `git commit -m "message"` → Save staged changes
- `git push origin main` → Send commits to GitHub
- `git pull origin main` → Bring remote updates to local
- `git log --oneline --graph --decorate --all` → Pretty commit history
- `git checkout -b feature/blog-1` → Create & switch to a new branch
- `git switch main` → Switch back to main
- `git merge feature/blog-1` → Merge a branch into main

---

## Notes
- Keep this file in `docs/CLI_Journal.md` and commit it often.
- We’ll reuse this as an appendix for Blog 6 (*GitHub for Analysts*).
