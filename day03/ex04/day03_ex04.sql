WITH JoinTab AS
(SELECT me.pizzeria_id, pr.gender
FROM person_order AS po
LEFT JOIN person AS pr ON po.person_id = pr.id
LEFT JOIN menu AS me ON po.menu_id = me.id)

SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
WHERE (SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id) = 
	(SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id AND gender = 'female')
	AND (SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id) > 0
UNION
SELECT pz.name AS pizzeria_name
FROM pizzeria AS pz
WHERE (SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id) = 
	(SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id AND gender = 'male')
	AND (SELECT COUNT(1) FROM JoinTab WHERE pizzeria_id = pz.id) > 0
ORDER BY pizzeria_name