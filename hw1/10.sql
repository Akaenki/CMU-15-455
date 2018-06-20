SELECT parties.zip, COUNT(parties.case_id) 
FROM parties,charges
WHERE parties.case_id = charges.case_id
AND zip <> ''
GROUP BY parties.zip
ORDER BY COUNT(parties.case_id)
LIMIT 3;