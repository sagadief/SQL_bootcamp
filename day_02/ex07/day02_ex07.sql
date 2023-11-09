SELECT pi.name FROM pizzeria pi 
JOIN person_visits pv ON pi.id = pv.pizzeria_id
JOIN person p ON pv.person_id = p.id
JOIN menu ON pi.id = menu.pizzeria_id
WHERE p.name = 'Dmitriy' AND pv.visit_date = '2022-01-08' AND menu.price < 800;
