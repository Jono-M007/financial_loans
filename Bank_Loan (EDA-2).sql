-- Which loan term is the most popular ?
SELECT term, COUNT(term) as number_of_loans
FROM finance_1
GROUP BY term;

-- What was the total loan amount issued on each loan term ?
SELECT term , FORMAT(SUM(loan_amnt),2) AS total_loan_amount
FROM finance_1
GROUP BY term;

-- The maxmium and minimum loan issued
SELECT MAX(loan_amnt) AS max_loan_amount, MIN(loan_amnt)  AS min_loan_amount
FROM finance_1;

SELECT purpose , loan_amnt
FROM finance_1
WHERE loan_amnt = "500"
GROUP BY purpose;

SELECT purpose , loan_amnt
FROM finance_1
WHERE loan_amnt = "35000"
GROUP BY purpose;

-- Average size of the loan
SELECT AVG(loan_amnt) AS avg_loan_amount
FROM finance_1;

-- Average size of the loan per loan term 
SELECT term , FORMAT(AVG(loan_amnt),2) AS avg_loan_amount
FROM finance_1
GROUP BY term;

-- What are the reasons that people take out loans and provide the total amount issued per those reasons ?
 SELECT DISTINCT(purpose), COUNT(purpose) AS number_of_loans , FORMAT(SUM(loan_amnt),2) AS total_loan_amount
 FROM finance_1
 GROUP BY purpose 
 ORDER BY number_of_loans ASC;
 
-- What is the income demographics of our customer base ?
SELECT MAX(annual_inc) AS min_annual_income , MIN(annual_inc) AS max_annual_income
FROM finance_1; 
 
 -- Is there a correlation between grade and income status