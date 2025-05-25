-- CUSTOMER FEEDBACK ANALYSIS SCRIPT
-- Focus: insurance_feedback and sentiment/theme-based analysis

-- Average satisfaction score
SELECT 
  AVG(Satisfactionscore) AS avg_satisfaction
FROM insurance_feedback;

-- Satisfaction by occupation
SELECT 
  c.Occupation,
  AVG(f.SatisfactionScore) AS avg_satisfaction
FROM insurance_feedback f
JOIN insurance_customers c ON f.CustomerID = c.CustomerID
GROUP BY c.Occupation
ORDER BY avg_satisfaction DESC;

-- Frequency of comments
SELECT Comments, COUNT(*) AS frequency
FROM insurance_feedback
GROUP BY Comments
ORDER BY frequency DESC;

-- Categorize comments into themes
SELECT 
  Comments,
  CASE
    WHEN Comments ILIKE '%good%' OR Comments ILIKE '%helpful%' THEN 'Positive'
    WHEN Comments ILIKE '%unsatisfactory%' OR Comments ILIKE '%poor%' OR Comments ILIKE '%bad%' THEN 'Negative'
    WHEN Comments ILIKE '%average%' THEN 'Neutral'
    ELSE 'Other'
  END AS feedback_theme,
  COUNT(*) AS frequency
FROM insurance_feedback
GROUP BY Comments, feedback_theme
ORDER BY frequency DESC;

-- Count of comments per theme
SELECT 
  CASE
    WHEN Comments ILIKE '%good%' OR Comments ILIKE '%helpful%' THEN 'Positive'
    WHEN Comments ILIKE '%unsatisfactory%' OR Comments ILIKE '%poor%' OR Comments ILIKE '%bad%' THEN 'Negative'
    WHEN Comments ILIKE '%average%' THEN 'Neutral'
    ELSE 'Other'
  END AS feedback_theme,
  COUNT(*) AS total_feedbacks
FROM insurance_feedback
GROUP BY feedback_theme
ORDER BY total_feedbacks DESC;

-- Feedback by policy type
SELECT 
    pol.PolicyType,
    fb.Comments,
    COUNT(*) AS feedback_count
FROM insurance_feedback fb
JOIN insurance_customers c ON fb.CustomerID = c.CustomerID
JOIN insurance_policies pol ON pol.CustomerID = c.CustomerID
GROUP BY pol.PolicyType, fb.Comments
ORDER BY pol.PolicyType, feedback_count DESC;

-- Feedback by claim status
SELECT
    cl.ClaimStatus,
    fb.Comments,
    COUNT(*) AS feedback_count
FROM insurance_feedback fb
JOIN insurance_customers c ON fb.CustomerID = c.CustomerID
JOIN insurance_claims cl ON cl.PolicyID IN (
    SELECT PolicyID FROM insurance_policies WHERE CustomerID = c.CustomerID
)
GROUP BY cl.ClaimStatus, fb.Comments
ORDER BY cl.ClaimStatus, feedback_count DESC;
