(SELECT p.name, COUNT(*) count, 'order' AS action_type FROM pizzeria p
	JOIN menu m ON p.id = m.pizzeria_id
	JOIN person_order po ON po.menu_id = m.id
	GROUP BY p.name
	ORDER BY count DESC
	LIMIT 3)
UNION (SELECT p.name, COUNT(*) count, 'visit' AS action_type FROM pizzeria p
	JOIN person_visits pv ON  p.id = pv.pizzeria_id
	GROUP BY p.name
	ORDER BY count DESC
	LIMIT 3)
ORDER BY action_type, count DESC;