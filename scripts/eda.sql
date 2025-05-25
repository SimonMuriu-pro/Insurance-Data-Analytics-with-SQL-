--1. INSURANCE_CUSTOMERS TABLE

-- Row count
SELECT COUNT(*) AS total_customers FROM insurance_customers;

-- Missing values
SELECT 
  COUNT(*) FILTER (WHERE Name IS NULL) AS missing_name,
  COUNT(*) FILTER (WHERE Age IS NULL) AS missing_age,
  COUNT(*) FILTER (WHERE Gender IS NULL) AS missing_gender,
  COUNT(*) FILTER (WHERE Occupation IS NULL) AS missing_occupation,
  COUNT(*) FILTER (WHERE AnnualIncome IS NULL) AS missing_income
FROM insurance_customers;

-- Age distribution
SELECT 
  CASE 
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 50 THEN '30–50'
    ELSE 'Over 50'
  END AS age_group,
  COUNT(*) AS count
FROM insurance_customers
GROUP BY age_group
ORDER BY count DESC;

-- Gender & Occupation breakdown
SELECT Gender, Occupation, COUNT(*) AS count
FROM insurance_customers
GROUP BY Gender, Occupation
ORDER BY Gender, count DESC;

--2.INSURANCE_POLICIES TABLE
-- Row count
SELECT COUNT(*) AS total_policies FROM insurance_policies;

-- Missing key fields
SELECT 
  COUNT(*) FILTER (WHERE PolicyStartDate IS NULL) AS missing_start_date,
  COUNT(*) FILTER (WHERE PolicyEndDate IS NULL) AS missing_end_date,
  COUNT(*) FILTER (WHERE PolicyType IS NULL) AS missing_policy_type
FROM insurance_policies;

-- Popular policy types
SELECT PolicyType, COUNT(*) AS policy_count
FROM insurance_policies
GROUP BY PolicyType
ORDER BY policy_count DESC;

-- Average duration
SELECT 
  PolicyType,
  AVG(PolicyEndDate - PolicyStartDate) AS avg_duration_days
FROM insurance_policies
WHERE PolicyStartDate IS NOT NULL AND PolicyEndDate IS NOT NULL
GROUP BY PolicyType;

-- 3.INSURANCE_CLAIMS TABLE 
-- Row count
SELECT COUNT(*) AS total_claims FROM insurance_claims;

-- NULL checks
SELECT 
  COUNT(*) FILTER (WHERE ClaimStatus IS NULL) AS missing_status,
  COUNT(*) FILTER (WHERE ClaimAmount IS NULL) AS missing_amount
FROM insurance_claims;

-- Claim status distribution
SELECT ClaimStatus, COUNT(*) AS count
FROM insurance_claims
GROUP BY ClaimStatus;

-- Claim amount summary
SELECT 
  MIN(ClaimAmount) AS min_claim,
  MAX(ClaimAmount) AS max_claim,
  AVG(ClaimAmount) AS avg_claim,
  SUM(ClaimAmount) AS total_claimed
FROM insurance_claims;

-- 4.INSURANCE_PAYMENTS TABLE
-- Row count
SELECT COUNT(*) AS total_payments FROM insurance_payments;

-- NULL check
SELECT 
  COUNT(*) FILTER (WHERE PaymentMethod IS NULL) AS missing_method,
  COUNT(*) FILTER (WHERE PaymentAmount IS NULL) AS missing_amount
FROM insurance_payments;

-- Payment method usage
SELECT PaymentMethod, COUNT(*) AS usage_count
FROM insurance_payments
GROUP BY PaymentMethod;

-- Revenue summary
SELECT 
  MIN(PaymentAmount) AS min_payment,
  MAX(PaymentAmount) AS max_payment,
  AVG(PaymentAmount) AS avg_payment,
  SUM(PaymentAmount) AS total_revenue
FROM insurance_payments;

--5.INSURANCE FEEDBACK TABLE 
-- Row count
SELECT COUNT(*) AS total_feedback FROM insurance_feedback;

-- NULL check
SELECT 
  COUNT(*) FILTER (WHERE SatisfactionScore IS NULL) AS missing_score,
  COUNT(*) FILTER (WHERE Comments IS NULL) AS missing_comments
FROM insurance_feedback;

-- Satisfaction score distribution
SELECT 
  SatisfactionScore,
  COUNT(*) AS count
FROM insurance_feedback
GROUP BY SatisfactionScore
ORDER BY SatisfactionScore DESC;

-- Most frequent feedback comments
SELECT Comments, COUNT(*) AS comment_count
FROM insurance_feedback
GROUP BY Comments
ORDER BY comment_count DESC;

