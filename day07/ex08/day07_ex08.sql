SELECT pr.address, pz.name, COUNT(*) AS count_of_orders
FROM person_order AS po
LEFT JOIN person AS pr ON po.person_id = pr.id
LEFT JOIN menu AS me ON po.menu_id = me.id
LEFT JOIN pizzeria AS pz ON me.pizzeria_id = pz.id
GROUP BY pr.address, pz.name
ORDER BY pr.address, pz.name