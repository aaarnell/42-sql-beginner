SELECT 
	res.address,
	ROUND(res.formula, 2) AS formula,
	ROUND(res.average, 2) AS average,
	res.formula > res.average AS comparison
FROM
	(SELECT address,
		(MAX(age)::numeric - MIN(age)::numeric)/MAX(age)::numeric AS formula,
		AVG(age) AS average
	FROM person
	GROUP BY address) AS res
ORDER BY res.address