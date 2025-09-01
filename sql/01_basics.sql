-- HC01 Basics v2 (SQLite-safe) — validated for tables: claims, members, providers
-- This script adds a few data-quality checks, sensible indexes, and join-based summaries.

/* Optional performance hints */
PRAGMA foreign_keys = OFF;
PRAGMA case_sensitive_like = OFF;

-- 0) Quick schema peek (works in DB Browser: use the UI to inspect tables)
-- SELECT name, sql FROM sqlite_master WHERE type='table';

-- 0.1) Helpful indexes (skip if you already have them)
CREATE INDEX IF NOT EXISTS idx_claims_provider ON claims(provider_id);
CREATE INDEX IF NOT EXISTS idx_claims_member ON claims(member_id);
CREATE INDEX IF NOT EXISTS idx_claims_date ON claims(claim_date);
CREATE INDEX IF NOT EXISTS idx_claims_status ON claims(status);

-- 1) Row count
SELECT COUNT(*) AS row_count FROM claims;

-- 2) Distinct claim_type values
SELECT claim_type, COUNT(*) AS n
FROM claims
GROUP BY claim_type
ORDER BY n DESC;

-- 3) Basic paid claims in 2024 (dates must be ISO YYYY-MM-DD)
SELECT claim_id, claim_date, amount_paid
FROM claims
WHERE status = 'Paid'
  AND claim_date BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY claim_date;

-- 4) Top 10 highest billed claims
SELECT claim_id, member_id, provider_id, amount_billed
FROM claims
ORDER BY amount_billed DESC
LIMIT 10;

-- 5) Summary of amounts (overall)
SELECT ROUND(AVG(amount_billed), 2) AS avg_billed,
       ROUND(SUM(amount_paid), 2)   AS total_paid,
       ROUND(AVG(amount_paid), 2)   AS avg_paid
FROM claims;

-- 6) Average paid by network flag and place of service
SELECT network_flag,
       place_of_service,
       COUNT(*) AS n,
       ROUND(AVG(amount_paid), 2) AS avg_paid
FROM claims
GROUP BY network_flag, place_of_service
HAVING AVG(amount_paid) > 0
ORDER BY avg_paid DESC;

-- 7) Patient liability estimate (billed - paid); inspect a sample
SELECT claim_id, member_id, provider_id,
       amount_billed, amount_allowed, amount_paid,
       ROUND(amount_billed - amount_paid, 2) AS patient_liability_est
FROM claims
ORDER BY patient_liability_est DESC
LIMIT 20;

-- 8) Monthly paid trend
SELECT strftime('%Y-%m', claim_date) AS month,
       COUNT(*) AS n_claims,
       ROUND(SUM(amount_paid), 2) AS monthly_paid
FROM claims
GROUP BY month
ORDER BY month;

-- 9) Top 10 providers by total paid
SELECT provider_id,
       COUNT(*) AS n_claims,
       ROUND(SUM(amount_paid), 2) AS total_paid
FROM claims
GROUP BY provider_id
ORDER BY total_paid DESC
LIMIT 10;

-- 10) Join with providers for names/specialties
SELECT p.provider_name,
       p.specialty,
       ROUND(SUM(c.amount_paid), 2) AS total_paid
FROM claims c
JOIN providers p ON c.provider_id = p.provider_id
GROUP BY p.provider_name, p.specialty
ORDER BY total_paid DESC
LIMIT 10;

-- 11) Denial rate by provider
WITH totals AS (
  SELECT provider_id, COUNT(*) AS n
  FROM claims
  GROUP BY provider_id
),
denials AS (
  SELECT provider_id, COUNT(*) AS d
  FROM claims
  WHERE status = 'Denied'
  GROUP BY provider_id
)
SELECT t.provider_id,
       ROUND(COALESCE(d.d,0)*1.0 / t.n, 4) AS denial_rate
FROM totals t
LEFT JOIN denials d ON t.provider_id = d.provider_id
ORDER BY denial_rate DESC, t.provider_id;

-- 12) Member demographics join: avg paid by member state and gender
SELECT m.state AS member_state,
       m.gender,
       COUNT(*) AS n_claims,
       ROUND(AVG(c.amount_paid), 2) AS avg_paid
FROM claims c
JOIN members m ON c.member_id = m.member_id
GROUP BY m.state, m.gender
ORDER BY avg_paid DESC;

-- 13) Plan type cross-check (claims vs members); spot discrepancies
SELECT COALESCE(c.plan_type, 'UNKNOWN') AS claims_plan,
       COALESCE(m.plan_type, 'UNKNOWN') AS member_plan,
       COUNT(*) AS n
FROM claims c
LEFT JOIN members m ON c.member_id = m.member_id
GROUP BY COALESCE(c.plan_type, 'UNKNOWN'), COALESCE(m.plan_type, 'UNKNOWN')
ORDER BY n DESC;

-- 14) Data quality: NULL / blank counts per key columns
SELECT 'claim_id' AS column_name, SUM(CASE WHEN claim_id IS NULL OR TRIM(claim_id)='' THEN 1 ELSE 0 END) AS null_or_blank FROM claims
UNION ALL
SELECT 'member_id', SUM(CASE WHEN member_id IS NULL OR TRIM(member_id)='' THEN 1 ELSE 0 END) FROM claims
UNION ALL
SELECT 'provider_id', SUM(CASE WHEN provider_id IS NULL OR TRIM(provider_id)='' THEN 1 ELSE 0 END) FROM claims
UNION ALL
SELECT 'claim_date', SUM(CASE WHEN claim_date IS NULL OR TRIM(claim_date)='' THEN 1 ELSE 0 END) FROM claims
UNION ALL
SELECT 'amount_paid', SUM(CASE WHEN amount_paid IS NULL THEN 1 ELSE 0 END) FROM claims;

-- 15) Duplicate claim_id detection
WITH d AS (
  SELECT claim_id, COUNT(*) AS cnt
  FROM claims
  GROUP BY claim_id
  HAVING COUNT(*) > 1
)
SELECT c.*
FROM claims c
JOIN d ON c.claim_id = d.claim_id
ORDER BY c.claim_id;

-- End of HC01 basics v2
