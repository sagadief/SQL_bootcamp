SELECT pizza_name, name AS pizzeria_name, price FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id 
WHERE pizza_name LIKE '%mushroom%' OR pizza_name LIKE '%pepperoni%'
ORDER BY pizza_name, pizzeria_name;