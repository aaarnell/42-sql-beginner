INSERT INTO person_order (id, person_id, menu_id, order_date)	
SELECT gs, 
	pr.id, 
	(SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
	'2022-02-25'
FROM generate_series((SELECT MAX(id) FROM person_order) + 1, 
	(SELECT MAX(id) FROM person_order) + (SELECT COUNT(1) FROM person)) AS gs
LEFT JOIN person AS pr ON (gs - (SELECT MAX(id) FROM person_order)) = pr.id