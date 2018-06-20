SELECT parties.name, COUNT(DISTINCT cases.violation_county) FROM parties 
INNER JOIN cases
WHERE parties.case_id = cases.case_id
AND parties.type LIKE 'Defendant' 
AND parties.name NOT LIKE '' AND cases.violation_county NOT LIKE ''
GROUP BY parties.name 
ORDER BY COUNT(DISTINCT cases.violation_county) DESC
LIMIT 3;