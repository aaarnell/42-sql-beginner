WITH Inc_Dates AS
(SELECT CAST(gs AS date) AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs)

SELECT gs.missing_date
FROM
	(SELECT *
	FROM person_visits
	WHERE person_id = 1 OR person_id = 2) AS pv
RIGHT OUTER JOIN
Inc_Dates AS gs ON pv.visit_date = gs.missing_date
WHERE pv.id IS NULL
ORDER BY pv.visit_date
