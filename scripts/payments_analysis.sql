-- PAYMENTS ANALYSIS SCRIPT
-- Focus: insurance_payments and revenue trends

-- Total revenue
SELECT 
  SUM(PaymentAmount) AS total_revenue
FROM insurance_payments;

-- Top paying customers
SELECT 
  c.CustomerID,
  c.Name,
  SUM(p.PaymentAmount) AS total_paid
FROM insurance_payments p
JOIN insurance_policies pol ON p.PolicyID = pol.PolicyID
JOIN insurance_customers c ON pol.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY total_paid DESC
LIMIT 10;

-- Revenue by payment method
SELECT 
  PaymentMethod,
  SUM(PaymentAmount) AS total_revenue
FROM insurance_payments
GROUP BY PaymentMethod
ORDER BY total_revenue DESC;

-- Revenue by month/year (seasonality)
SELECT
  EXTRACT(MONTH FROM PaymentDate::date) AS month,
  EXTRACT(YEAR FROM PaymentDate::date) AS year,
  SUM(PaymentAmount) AS revenue
FROM insurance_payments
GROUP BY year, month
ORDER BY year, month;
