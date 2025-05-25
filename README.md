<h1> 🚀 Insurance Data Analytics with SQL </h1>


<h2>1. 📄 Description</h2>
This project simulates real-world insurance analytics, extracting insights that could help insurers reduce risk, boost profitability, and improve customer experience. It showcases SQL’s power in answering high-impact business questions across policy, claims, payments, and feedback data

<h2>2. 🎯 Objectives</h2>
<b>1. Customer Profiling </b>

-	Count customers by gender and occupation
-	Sort active and inactive customers
-	Count of active and inactive customers 
-	Active and inactive customers by gender and age group 

<b>2. Policy Insights </b>

-	Determine the popularity and lifecycle of different policy types.
-	Policy lifecycle- average duration of policies by type
-	customers whose policies ended without renewal
-	Count of active policies per customer 

<b>3. Claims Performance</b>

-	Analyze claim frequency, volume, and monetary impact by policy type or customer.
- Claims frequency and total claimed amount by policy type
- Claim frequency and total claimed amount by customer
-	Investigate claim status distribution (approved, pending, denied).
-	Claim status distribution 
-  Claims status distribution by policy type
-	Understand which customer segments file the most claims.
-	Claims by age group
- Claims by occupation
 	
<b>4. Revenue Analysis</b>

-	Calculate total revenue from policy payments.
-	Identify top-paying customers.
-	Revenue by payment method
-	Seasonality analysis.
  
<b>5. Customer Feedback Trends</b>

-	Average satisfaction score
-	Average satisfaction score by occupation
-	Identify and count common complaints or praise (themes).
-	Categorize feedback comments into themes (positive, negative, neutral)
-	Correlate feedback with claims or policy types to see which areas need improvement.
-	Feedback based on policy type
-	feedback based on claim status

<h2>3. 📥 Database Setup</h2>
<b>A PostgreSQL database named insuranceDB was created using pgAdmin. The tables — insurance_customers, insurance_policies, insurance_claims, insurance_payments, and insurance_feedback — were then created with appropriate primary and foreign keys. </b>

Data was subsequently loaded into these tables using pgAdmin’s import feature, ensuring all CSV datasets were correctly imported and linked.


<h2>4. 🧪 Exploratory Data Analysis (EDA) </h2>

<b>Before analysis, a comprehensive EDA was conducted to assess data quality, understand distributions, and identify potential issues in the dataset. This included:</b>
<b>
-	Row counts and data completeness checks
-	Null value detection across all key columns
-	Distribution analysis (e.g., age groups, income, policy types)
-	Relationship checks (e.g., policy-customer linkage, claim frequency)
-	Summary statistics for payments and claims
-	Feedback comment exploration and satisfaction scoring
</b>
<b>See eda.sql for the complete script.</b>

<b>This step ensured the dataset was clean, logically sound, and suitable for downstream analysis.</b>

<b>The dataset appeared clean and reliable for downstream analytics.</b>


<h2>5. 🛠️ Tech Stack / Tools</h2>

- SQL (PostgreSQL)
- pgAdmin 4
- Git & GitHub for version control


<h2>6. 📂 Folder/Script Structure</h2>

- `customer_analysis.sql` — Customer segmentation and activity insights
- `policy_insights.sql` — Policy popularity, renewals, and types
- `claims_analysis.sql` — Frequency, amounts, and patterns of insurance claims
- `payments_analysis.sql` — Revenue trends and customer payment behavior
- `feedback_analysis.sql` — Sentiment analysis from customer feedback


<h2>7. 🧪 How to Run the Scripts</h2>

<b>1. Load the data into a PostgreSQL database (sample CSVs not included in this repo).</b>

<b>2. Open pgAdmin and connect to your database.</b>

<b>3. Run each SQL script independently in pgAdmin or your preferred SQL tool.</b>

<b>4. Review query outputs.</b>  


<h2>8. 📊 Insights Summary.</h2>

<b>The following are some of the insights derived from the analysis.</b> 

- Health policies lead in terms of claims
- unsatisfactory resolution and poor response time scores highest feedback received
- A significant percentage of claims are rejected, showing a possibility of fraudulent claims  
- Negative feedback is most correlated with pending claim statuses.
- credit and debit are the most prevalent payment methods

<h2>9. 📚 Future Improvements / TODO </h2>

- Automate query scheduling with dbt or Airflow
- Integrate with Power BI dashboards for interactive visuals
- Add predictive modeling on claims approval likelihood

<h2>10. 👤 Author / Contact </h2>

<b>Simon Muriu</b> 
<b>Data Analyst</b>  
[LinkedIn](https://www.linkedin.com/in/simon-muriu-0a1310251/) | 
[Email](mailto:smuriu06@gmail.com)


<!--
 ```diff
- text in red
+ text in green
! text in orange
# text in gray
@@ text in purple (and bold)@@
```
--!>
