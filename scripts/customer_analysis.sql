-- CUSTOMER ANALYSIS SCRIPT
-- Count of customers by gender 
SELECT Gender, COUNT(*)
FROM insurance_customers
GROUP BY Gender;

-- Count customers by gender and occupation
SELECT Gender, Occupation, COUNT(*) AS num_customers, AVG(AnnualIncome) AS avg_income
FROM insurance_customers
GROUP BY Gender, Occupation
ORDER BY Gender, Occupation;

-- Active vs inactive customers
SELECT 
    c.CustomerID,
    c.Name,
    CASE 
        WHEN COUNT(pol.PolicyID) FILTER (
            WHERE CURRENT_DATE BETWEEN pol.PolicyStartDate AND pol.PolicyEndDate
        ) > 0 THEN 'Active'
        ELSE 'Inactive'
    END AS CustomerStatus
FROM insurance_customers c
LEFT JOIN insurance_policies pol ON c.CustomerID = pol.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY CustomerStatus DESC;

--Count of active and inactive customers 
WITH customer_status AS (
  SELECT 
    c.CustomerID,
    CASE 
      WHEN COUNT(pol.PolicyID) FILTER (
        WHERE CURRENT_DATE BETWEEN pol.PolicyStartDate AND pol.PolicyEndDate
      ) > 0 THEN 'Active'
      ELSE 'Inactive'
    END AS CustomerStatus
  FROM insurance_customers c
  LEFT JOIN insurance_policies pol ON c.CustomerID = pol.CustomerID
  GROUP BY c.CustomerID
)
SELECT CustomerStatus, COUNT(*) AS customer_count
FROM customer_status
GROUP BY CustomerStatus
ORDER BY customer_count DESC;

--Active vs inactive customers by gender and age group

WITH customer_status AS (
  SELECT 
    c.CustomerID,
    CASE 
      WHEN COUNT(pol.PolicyID) FILTER (
        WHERE CURRENT_DATE BETWEEN pol.PolicyStartDate AND pol.PolicyEndDate
      ) > 0 THEN 'Active'
      ELSE 'Inactive'
    END AS CustomerStatus,
    CASE 
      WHEN c.Age < 30 THEN 'Under 30'
      WHEN c.Age BETWEEN 30 AND 50 THEN '30–50'
      ELSE 'Over 50'
    END AS age_group,
    c.Gender
  FROM insurance_customers c
  LEFT JOIN insurance_policies pol ON c.CustomerID = pol.CustomerID
  GROUP BY c.CustomerID, c.Age, c.Gender
)
SELECT 
  age_group,
  Gender,
  CustomerStatus,
  COUNT(*) AS customer_count
FROM customer_status
GROUP BY age_group, Gender, CustomerStatus
ORDER BY age_group, Gender, CustomerStatus DESC;


