--Create Tables
CREATE TABLE insurance_customers (
    customerID       INT PRIMARY KEY,
    Name             VARCHAR(100),
    Age              INT,
    Gender           VARCHAR(10),
    Address          TEXT,
    Contact          VARCHAR(20),
    Occupation       VARCHAR(50),
    AnnualIncome     NUMERIC,
    Tenure           INT
);
CREATE TABLE insurance_policies (
    PolicyID         INT PRIMARY KEY,
    CustomerID       INT REFERENCES insurance_customers(CustomerID),
    PolicyType       VARCHAR(50),
    PremiumAmount    NUMERIC,
    PolicyStartDate  DATE,
    policyEndDate    DATE,
    coverageAmount   Numeric
);

CREATE TABLE insurance_claims (
    ClaimID      INT PRIMARY KEY,
    PolicyID     INT REFERENCES insurance_policies(PolicyID),
    ClaimDate    DATE,
    ClaimAmount  NUMERIC,
    ClaimStatus  VARCHAR(20),
    Reason        TEXT
);

CREATE TABLE insurance_payment (
    PaymentID     INT PRIMARY KEY,
    PolicyID      INT REFERENCES insurance_policies(PolicyID),
    PaymentDate   DATE,
    PaymentAmount NUMERIC,
    Method         VARCHAR(30)
);

CREATE TABLE insurance_feedback (
    FeedbackID     INT PRIMARY KEY,
    CustomerID     INT REFERENCES insurance_customers(CustomerID),
    Satisfaction   INT,
    Comments       TEXT
);

-- COPY DATA FROM CSV FILES
--Data loaded in the tables using python or local upload 


-- Quick table overview
SELECT * FROM insurance_customers LIMIT 5;
SELECT * FROM insurance_policies LIMIT 5;
SELECT * FROM insurance_claims LIMIT 5;
SELECT * FROM insurance_feedback LIMIT 5;
SELECT * FROM insurance_payments LIMIT 5;



