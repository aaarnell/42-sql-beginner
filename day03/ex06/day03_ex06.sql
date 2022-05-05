SELECT me1.pizza_name, 
	(SELECT name FROM pizzeria WHERE id = me1.pizzeria_id) AS pizzeria_name_1,
	(SELECT name FROM pizzeria WHERE id = me2.pizzeria_id) AS pizzeria_name_2,
	me1.price
FROM menu AS me1
CROSS JOIN menu AS me2
WHERE me1.pizza_name = me2.pizza_name
	AND me1.price = me2.price
	AND me1.pizzeria_id != me2.pizzeria_id
ORDER BY me1.pizza_name