SELECT pr.name, COUNT(*) AS count_of_visits
FROM person_visits AS pv
LEFT JOIN person AS pr ON pv.person_id = pr.id
GROUP BY pv.person_id, pr.name
ORDER BY count_of_visits DESC
LIMIT 5