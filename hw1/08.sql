SELECT year, SUM(year-dob) * 1.0 / COUNT(year-dob) as age FROM
(SELECT CAST(strftime('%Y',cases.filing_date) AS INT) AS year,
CAST(strftime('%Y',parties.dob) AS INT) AS dob
FROM cases, parties, charges
WHERE cases.case_id = parties.case_id AND cases.case_id = charges.case_id
AND charges.disposition LIKE 'Guilty' AND cases.filing_date NOT LIKE ''
AND parties.type LIKE 'Defendant' AND parties.name NOT LIKE ''
AND parties.dob NOT LIKE '')
WHERE (year - dob) > 0 AND (year - dob )< 100
GROUP BY year
ORDER BY age DESC
LIMIT 5;