SELECT pr.name, COUNT(*) AS count_visits
FROM person_visits AS pv
LEFT JOIN person AS pr ON pv.person_id = pr.id
GROUP BY pr.id, pr.name
HAVING COUNT(*) > 1