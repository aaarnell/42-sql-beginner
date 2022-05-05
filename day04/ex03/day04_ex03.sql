SELECT gd.generated_date AS missing_date
FROM person_visits AS pv
RIGHT OUTER JOIN v_generated_dates AS gd ON pv.visit_date = gd.generated_date
WHERE pv.id IS NULL
ORDER BY missing_date