--INSURANCE_CUSTOMERS TABLE
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
