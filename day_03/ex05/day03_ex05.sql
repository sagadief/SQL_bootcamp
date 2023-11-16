SELECT name FROM pizzeria JOIN person_visits ON pizzeria_id = pizzeria.id
WHERE person_visits.person_id = 2
EXCEPT
SELECT name FROM pizzeria JOIN menu ON menu.pizzeria_id = pizzeria.id
JOIN person_order ON menu.id = person_order.menu_id WHERE person_order.person_id = 2;
