WITH cte_current_rate AS (
	SELECT 
		c1.id,
		c1.name AS currency_name,
		c1.rate_to_usd AS last_rate
	FROM currency c1
	INNER JOIN (
		SELECT name, MAX(updated) as last_updated
		FROM currency
		GROUP BY name
	) c2 ON c1.name = c2.name AND c1.updated = c2.last_updated
)
SELECT 
    COALESCE(U.name,'not defined') AS name,
	COALESCE (U.lastname,'not defined') AS lastname,
	B.type,
	SUM(COALESCE(B.money, 0)) AS volume,
	COALESCE(currency_name, 'not defined') AS currency_name,
	COALESCE(last_rate, 1) as last_rate_to_usd,
	SUM(COALESCE(B.money, 0)) * COALESCE(last_rate, 1) AS total_volume_in_usd
FROM balance B
    FULL JOIN "user" U ON U.id = B.user_id
    Full JOIN cte_current_rate CTE_CR ON B.currency_id = CTE_CR.id

GROUP BY type, U.id,currency_id,
                currency_name,last_rate
ORDER BY 1 DESC, 2, 3;
