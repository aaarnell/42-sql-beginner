SELECT me.pizza_name, me.price, pz.name AS pizzeria_name
FROM menu AS me
LEFT JOIN person_order AS po ON me.id = po.menu_id
LEFT JOIN pizzeria AS pz ON me.pizzeria_id = pz.id
WHERE po.id IS NULL
ORDER BY me.pizza_name, me.price