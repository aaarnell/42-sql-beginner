WITH RECURSIVE city_a AS (
	SELECT cost AS total_cost, node1 AS tour, node1, node2
	FROM routes
	WHERE node1 = 'A'
	UNION ALL
	SELECT
		parrent.total_cost + child.cost,
		parrent.tour || ',' || child.node1,
		child.node1,
		child.node2
	FROM
		routes AS child
	INNER JOIN city_a AS parrent ON child.node1 = parrent.node2
	WHERE tour NOT LIKE '%' || child.node1 || '%'
)
SELECT total_cost, CONCAT ('{', tour , ',', node2, '}')
FROM city_a
WHERE node2 = 'A' and LENGTH (tour) = 7
ORDER BY 1, 2
