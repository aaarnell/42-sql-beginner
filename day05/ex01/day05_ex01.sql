set enable_seqscan=OFF;
SELECT me.pizza_name, pz.name AS pizzeria_name
FROM menu AS me
LEFT JOIN pizzeria AS pz ON me.pizzeria_id = pz.id