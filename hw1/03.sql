SELECT cases.violation_county, COUNT(charges.description)
FROM cases
INNER JOIN charges ON cases.case_id = charges.case_id
WHERE charges.description LIKE '%RECKLESS%' AND cases.violation_county NOT LIKE ''
GROUP BY cases.violation_county
ORDER BY COUNT(charges.description) DESC
LIMIT 3;