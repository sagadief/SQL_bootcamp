CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
(   SELECT p.name AS pizzeria_name
    FROM person_visits pv
	JOIN pizzeria p ON pv.pizzeria_id = p.id
	JOIN menu ON p.id = menu.pizzeria_id
	JOIN person ON pv.person_id = person.id
	WHERE person.name = 'Dmitriy' AND price <= 800 AND visit_date = '2022-01-08'
);