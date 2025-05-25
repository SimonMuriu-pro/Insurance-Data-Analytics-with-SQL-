-- POLICY ANALYSIS SCRIPT
-- Focus: insurance_policies and related insights

-- Policy popularity by type
SELECT PolicyType, COUNT(*) AS policy_count
FROM insurance_policies
GROUP BY PolicyType
ORDER BY policy_count DESC;

-- Average policy duration by type
SELECT 
    PolicyType,
    AVG(PolicyEndDate - PolicyStartDate) AS avg_duration_days
FROM insurance_policies
WHERE PolicyStartDate IS NOT NULL
  AND PolicyEndDate IS NOT NULL
  AND PolicyEndDate >= PolicyStartDate
GROUP BY PolicyType
ORDER BY avg_duration_days DESC;

-- Active vs expired policy count
SELECT
  CASE 
    WHEN CURRENT_DATE BETWEEN PolicyStartDate AND COALESCE(PolicyEndDate, CURRENT_DATE)
         THEN 'Active'
    ELSE 'Expired'
  END AS policy_status,
  COUNT(*) AS policy_count
FROM insurance_policies
WHERE PolicyStartDate IS NOT NULL
GROUP BY policy_status;

-- Active policies per customer
SELECT 
    c.CustomerID,
    c.Name,
    COUNT(pol.PolicyID) FILTER (
        WHERE CURRENT_DATE BETWEEN pol.PolicyStartDate AND pol.PolicyEndDate
    ) AS active_policy_count
FROM insurance_customers c
LEFT JOIN insurance_policies pol ON c.CustomerID = pol.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY active_policy_count DESC;

-- Customers whose policies ended without renewal
WITH last_policy AS (
  SELECT CustomerID,
         MAX(PolicyEndDate) AS last_end_date
  FROM insurance_policies
  GROUP BY CustomerID
)
SELECT c.CustomerID, c.Name, lp.last_end_date
FROM last_policy lp
JOIN insurance_customers c ON c.CustomerID = lp.CustomerID
WHERE lp.last_end_date < CURRENT_DATE;
