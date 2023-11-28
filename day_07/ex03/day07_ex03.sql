WITH vs_CTE AS (
	(SELECT p.name, COUNT(*) count, 'order' AS total_count FROM pizzeria p
	JOIN menu m ON p.id = m.pizzeria_id
	JOIN person_order po ON po.menu_id = m.id
	GROUP BY p.name
	ORDER BY count DESC)
UNION (SELECT p.name, COUNT(*) count, 'visit' AS total_count FROM pizzeria p
	JOIN person_visits pv ON  p.id = pv.pizzeria_id
	GROUP BY p.name
	ORDER BY count DESC)
ORDER BY total_count, count DESC)
SELECT name, sum(count) AS total_count FROM vs_CTE
GROUP BY name
ORDER BY total_count DESC;