CREATE TABLE routes (
	node1 VARCHAR NOT null,
	node2 VARCHAR NOT null,
	cost INTEGER NOT null
	);
	
	INSERT INTO routes
VALUES
	('A', 'B', 10), ('B', 'A', 10), ('A', 'C', 15), ('C', 'A', 15),
	('A', 'D', 20), ('D', 'A', 20), ('D', 'B', 25), ('B', 'D', 25),
	('D', 'C', 30), ('C', 'D', 30), ('C', 'B', 35), ('B', 'C', 35);

	
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
WHERE node2 = 'A' and LENGTH (tour) = 7 and total_cost = (SELECT MIN(total_cost) FROM city_a WHERE LENGTH (tour) = 7)
ORDER BY 1, 2
