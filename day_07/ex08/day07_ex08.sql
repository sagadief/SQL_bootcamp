SELECT p.address, pi.name, COUNT(po.id) AS count_of_orders FROM person p
JOIN person_order po ON po.person_id = p.id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pi ON pi.id = m.pizzeria_id
GROUP BY pi.name, address
ORDER BY address, name;