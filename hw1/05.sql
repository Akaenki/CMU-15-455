SELECT COUNT(case_id), substr(strftime('%Y',filing_date),1,3) || '0s'
FROM cases WHERE filing_date NOT LIKE ''
GROUP BY substr(strftime('%Y',filing_date),1,3)
ORDER BY COUNT(case_id) DESC
LIMIT 3; 