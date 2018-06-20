WITH clean_table AS(
SELECT parties.race, charges.disposition
FROM parties, charges
WHERE parties.case_id = charges.case_id AND parties.race <> ''
AND disposition IN ('Guilty','Not Guilty')
AND race IN ('African American', 'Caucasian')),
total_by_disp AS(
SELECT disposition, COUNT(*) AS cnt 
FROM clean_table
GROUP BY disposition),
total_by_both AS(
SELECT race, disposition, COUNT(*) as cnt
FROM clean_table
GROUP BY race, disposition)
SELECT race, total_by_both.disposition, total_by_both.cnt * 100.0/total_by_disp.cnt
FROM total_by_disp, total_by_both
WHERE total_by_disp.disposition = total_by_both.disposition
ORDER BY race, total_by_disp.disposition DESC;