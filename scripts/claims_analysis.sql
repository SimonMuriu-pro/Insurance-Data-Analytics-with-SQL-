-- CLAIMS PERFORMANCE SCRIPT
-- Focus: insurance_claims and analysis by customer/policy/age/occupation

-- Claims by policy type
SELECT 
  p.PolicyType,
  COUNT(c.ClaimID) AS claim_count,
  SUM(c.ClaimAmount) AS total_claimed
FROM insurance_claims c
JOIN insurance_policies p ON c.PolicyID = p.PolicyID
GROUP BY p.PolicyType
ORDER BY claim_count DESC;

-- Claims by customer
SELECT 
  cu.CustomerID,
  cu.Name,
  COUNT(cl.ClaimID) AS claim_count,
  SUM(cl.ClaimAmount) AS total_claimed
FROM insurance_claims cl
JOIN insurance_policies po ON cl.PolicyID = po.PolicyID
JOIN insurance_customers cu ON po.CustomerID = cu.CustomerID
GROUP BY cu.CustomerID, cu.Name
ORDER BY claim_count DESC;

-- Claim status distribution
SELECT 
  ClaimStatus,
  COUNT(*) AS status_count
FROM insurance_claims
GROUP BY ClaimStatus
ORDER BY status_count DESC;

-- Status by policy type
SELECT 
  p.PolicyType,
  c.ClaimStatus,
  COUNT(*) AS status_count
FROM insurance_claims c
JOIN insurance_policies p ON c.PolicyID = p.PolicyID
GROUP BY p.PolicyType, c.ClaimStatus
ORDER BY p.PolicyType, status_count DESC;

-- Claims by age group
SELECT 
  CASE 
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 50 THEN '30–50'
    ELSE 'Over 50'
  END AS age_group,
  COUNT(cl.ClaimID) AS claim_count,
  SUM(cl.ClaimAmount) AS total_claimed
FROM insurance_claims cl
JOIN insurance_policies p ON cl.PolicyID = p.PolicyID
JOIN insurance_customers cu ON p.CustomerID = cu.CustomerID
GROUP BY age_group
ORDER BY claim_count DESC;

-- Claims by occupation
SELECT 
  cu.Occupation,
  COUNT(cl.ClaimID) AS claim_count,
  SUM(cl.ClaimAmount) AS total_claimed
FROM insurance_claims cl
JOIN insurance_policies p ON cl.PolicyID = p.PolicyID
JOIN insurance_customers cu ON p.CustomerID = cu.CustomerID
GROUP BY cu.Occupation
ORDER BY claim_count DESC;
