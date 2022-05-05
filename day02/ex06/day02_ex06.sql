WITH 
CustTab AS
	(SELECT id, name
	FROM person
	WHERE name IN ('Anna', 'Denis')),
OrderTab AS
	(SELECT cs.name AS person_name, me.pizza_name, pz.name AS pizzeria_name
	FROM person_order AS po
	LEFT JOIN menu AS me ON po.menu_id = me.id
	LEFT JOIN pizzeria AS pz ON me.pizzeria_id = pz.id
	LEFT JOIN CustTab AS cs ON po.person_id = cs.id
	WHERE po.person_id IN (SELECT id FROM CustTab))

SELECT pizza_name, pizzeria_name
FROM OrderTab 
WHERE person_name = 'Anna'
	AND pizza_name = ANY(SELECT pizza_name
		FROM OrderTab 
		WHERE person_name = 'Denis')
UNION
SELECT pizza_name, pizzeria_name
FROM OrderTab 
WHERE person_name = 'Denis'
	AND pizza_name = ANY(SELECT pizza_name
		FROM OrderTab 
		WHERE person_name = 'Anna')
ORDER BY pizza_name, pizzeria_name
