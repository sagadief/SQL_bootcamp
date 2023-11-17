SELECT generated_date AS missing_date FROM v_generated_dates
EXCEPT
SELECT visit_date FROM person_visits
ORDER BY missing_date;



-- Напишите SQL-оператор, который возвращает пропущенные дни для визитов
-- людей в январе 2022 года. Для этого используйте представление v_generated_dates
-- и отсортируйте результат по столбцу missing_date. Выборка данных представлена ниже.
