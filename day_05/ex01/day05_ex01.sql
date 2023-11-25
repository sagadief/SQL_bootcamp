EXPLAIN ANALYZE SELECT pizza_name, pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON pizzeria_id = pizzeria.id;