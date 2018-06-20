WITH attorney_table AS(
SELECT name, COUNT(charges.case_id) as total
FROM attorneys, charges
WHERE attorneys.case_id = charges.case_id
AND name <> ''
GROUP BY name),
case_table AS(
SELECT name, COUNT(charges.case_id) as win
FROM attorneys, charges
WHERE attorneys.case_id = charges.case_id
AND name <> '' AND charges.disposition = 'Not Guilty'
GROUP BY name)
SELECt attorney_table.name, total, win*100.0/total as rate
FROM attorney_table, case_table
WHERE attorney_table.name = case_table.name
ORDER BY rate DESC, total DESC
LIMIT 5;