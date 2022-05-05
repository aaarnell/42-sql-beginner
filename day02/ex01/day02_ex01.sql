SELECT CAST(gs AS date) AS missing_date
FROM
	(SELECT *
	FROM person_visits
	WHERE person_id = 1 OR person_id = 2) AS pv
RIGHT OUTER JOIN
generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs ON pv.visit_date = CAST(gs AS date)
WHERE pv.id IS NULL
ORDER BY pv.visit_date
