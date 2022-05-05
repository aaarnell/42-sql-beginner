WITH JoinTab AS
(SELECT pv.pizzeria_id, pr.gender
FROM person_visits AS pv
LEFT JOIN person AS pr ON pv.person_id = pr.id
LEFT JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id)

SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
WHERE (SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id) = 
	(SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id AND gender = 'female')
	AND (SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id) > 0
UNION ALL
SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
WHERE (SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id) = 
	(SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id AND gender = 'male')
	AND (SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id) > 0
ORDER BY pizzeria_name