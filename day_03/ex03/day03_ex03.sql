WITH mam AS (
	SELECT COUNT(person_id) AS count, pizzeria_id FROM person_visits
	WHERE person_id IN (SELECT id FROM person WHERE gender = 'female')
	GROUP BY pizzeria_id
), pap AS (
	SELECT COUNT(person_id) AS count, pizzeria_id FROM person_visits
	WHERE person_id IN (SELECT id FROM person WHERE gender = 'male')
	GROUP BY pizzeria_id
)

SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
WHERE pizzeria.id IN ( SELECT mam.pizzeria_id
	FROM mam
	INNER JOIN pap ON mam.pizzeria_id = pap.pizzeria_id
	WHERE mam.count <> pap.count
)
ORDER BY pizzeria_name;



-- Найдите, пожалуйста, пиццерии, которые чаще посещают женщины или мужчины.
-- Для любых операторов SQL с наборами сохраните дубликаты
-- (конструкции UNION ALL, EXCEPT ALL, INTERSECT ALL).
-- Просьба отсортировать результат по названию пиццерии. Пример данных приведен ниже.

