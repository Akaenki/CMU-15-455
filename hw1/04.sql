SELECT case_id, filing_date FROM cases
WHERE filing_date BETWEEN '1950-01-01' AND '1959-12-31'
ORDER BY DATE(filing_date)
LIMIT 3;