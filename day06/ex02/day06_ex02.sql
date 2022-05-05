SELECT pr.name, me.pizza_name, me.price, 
	(((me.price * 100) - (me.price * pd.discount))/100) AS discount_price
FROM person_order AS po
LEFT JOIN menu AS me ON po.menu_id = me.id
LEFT JOIN person AS pr ON po.person_id = pr.id
LEFT JOIN person_discounts AS pd ON po.person_id = pd.person_id AND me.pizzeria_id = pd.pizzeria_id
ORDER BY pr.name, me.pizza_name

