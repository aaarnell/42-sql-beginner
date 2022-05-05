SELECT me.pizza_name, pz.name AS pizzeria_name, me.price
FROM menu AS me
LEFT JOIN pizzeria AS pz ON me.pizzeria_id = pz.id
WHERE pizza_name IN ('mushroom pizza','pepperoni pizza')
ORDER BY me.pizza_name, pizzeria_name