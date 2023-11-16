WITH nam AS (SELECT pizza_name, price, pizzeria.name AS pizzeria_name,
                    pizzeria.id FROM menu
                    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id)
SELECT p1.pizza_name, p1.pizzeria_name AS pizzeria_name_1,
       p2.pizzeria_name AS pizzeria_name_2, p1.price
FROM nam AS p1
    JOIN nam AS p2 ON p1.pizza_name = p2.pizza_name AND p1.price = p2.price
    AND p1.id > p2.id
ORDER BY 1;




-- Пожалуйста, найдите одинаковые названия пиццы, которые имеют одинаковую цену,
-- но из разных пиццерий. Убедитесь, что результат упорядочен по названию пиццы.
-- Образец данных представлен ниже. Убедитесь, что названия столбцов соответствуют
-- названиям столбцов ниже.
