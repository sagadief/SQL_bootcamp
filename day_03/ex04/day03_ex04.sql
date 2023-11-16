WITH pap AS (
    SELECT pizzeria_id FROM menu JOIN person_order po ON po.menu_id = menu.id
    WHERE po.person_id IN (SELECT id FROM person WHERE gender = 'female')
    ), mam AS (
     SELECT pizzeria_id FROM menu JOIN person_order po ON po.menu_id = menu.id
    WHERE po.person_id IN (SELECT id FROM person WHERE gender = 'male')
)
SELECT name AS pizzeria_name FROM pizzeria WHERE pizzeria.id = (
    SELECT pizzeria_id FROM pap WHERE pizzeria_id NOT IN (SELECT pizzeria_id FROM mam)
    UNION
    SELECT pizzeria_id FROM mam WHERE pizzeria_id NOT IN (SELECT pizzeria_id FROM pap)
    )
ORDER BY pizzeria_name;













-- Найдите объединение пиццерий, в которых заказывают либо женщины, либо мужчины.
-- Другими словами, необходимо найти набор названий пиццерий, которые заказывали только женщины,
-- и выполнить операцию "UNION" с набором названий пиццерий, которые заказывали только мужчины.
-- Следует помнить, что слово "только" относится к обоим полам.
-- Для любых операторов SQL с множествами не сохраняйте дубликаты (UNION, EXCEPT, INTERSECT).
-- Просьба отсортировать результат по названию пиццерии. Пример данных приведен ниже.

