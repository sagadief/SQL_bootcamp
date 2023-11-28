SELECT address,
	CAST(ROUND(MAX(age::NUMERIC) - MIN(age::NUMERIC) / MAX(age::NUMERIC), 2) AS REAL) AS formula,
	ROUND(AVG(age::NUMERIC), 2) AS average,
	(CASE WHEN (MAX(age) - (ROUND(MIN(age), 2) / MAX(age))) > ROUND(AVG(age), 2) THEN TRUE
     ELSE FALSE
	 END) AS comparison
FROM person
GROUP BY address
ORDER BY address;