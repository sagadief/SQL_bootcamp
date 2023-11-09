SELECT m.pizza_name pizza_name, p.name pizzeria_name FROM menu m
JOIN pizzeria p ON p.id = m.pizzeria_id
JOIN person_order po ON po.menu_id = m.id
JOIN person pe ON pe.id = po.person_id
WHERE pe.name IN ('Anna', 'Denis')
ORDER BY pizza_name, pizzeria_name;
