SELECT p.name, count(*) AS count_of_visits FROM person_visits pv
JOIN person p ON p.id = pv.person_id
GROUP BY p.name
HAVING COUNT(*) > 3;


-- Напишите SQL-оператор, который возвращает имя человека и соответствующее ему
-- количество посещений любой пиццерии, если человек посетил ее более 3 раз (> 3).
-- Посмотрите на пример данных ниже.