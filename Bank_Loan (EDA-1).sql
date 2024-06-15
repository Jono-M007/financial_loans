-- What was the loan amount issued per year ?
SELECT YEAR(issue_d) AS year_of_issue, FORMAT(SUM(loan_amnt),2) AS total_loan_amount
FROM finance_1
GROUP BY year_of_issue
ORDER BY year_of_issue ASC;


-- Provide a breakdown of the revolving balance for the different credit grades.
SELECT grade , sub_grade , SUM(revol_bal) AS total_revol_bal
FROM finance_1 INNER JOIN finance_2
	ON (finance_1.id =  finance_2.id)
GROUP BY grade , sub_grade
ORDER BY grade , sub_grade;

-- What is the total payment amount based on the customer's verification status ?
SELECT verification_status , FORMAT(ROUND(SUM(total_pymnt),2),2) AS total_payment
FROM finance_1 INNER JOIN finance_2
	ON (finance_1.id =  finance_2.id)
GROUP BY verification_status;

-- What is the current loan status of the customer and where are they located ?
SELECT addr_state , last_credit_pull_d , loan_status
FROM finance_1 INNER JOIN finance_2
	ON (finance_1.id = finance_2.id)
GROUP BY addr_state , last_credit_pull_d , loan_status
ORDER BY last_credit_pull_d;

-- What was the homeownership status of the customers when they made their last payment ?
SELECT home_ownership, last_pymnt_d
FROM finance_1  INNER JOIN finance_2
	ON (finance_1.id = finance_2.id)
GROUP by home_ownership, last_pymnt_d;

-- In which state have we issued the most loans and what is the value of loans issued?
SELECT addr_state, COUNT(addr_state) AS number_of_loans_issued, FORMAT(SUM(loan_amnt),2) AS loan_amount_issued
FROM finance_1
GROUP BY addr_state;