CREATE UNIQUE INDEX IF NOT EXISTS idx_person_discounts_unique
ON ONLY person_discounts (person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id = 4 AND pizzeria_id = 6;

-- На самом деле, с одной стороны, нам необходимо улучшить согласованность данных,
-- а с другой - повысить производительность. Пожалуйста, создайте многоколоночный
-- уникальный индекс (с именем idx_person_discounts_unique), который предотвращает
-- дублирование парных значений идентификаторов person и pizzeria.
--
-- После создания нового индекса предоставьте, пожалуйста, любой простой SQL-оператор,
-- показывающий доказательство использования индекса (с помощью EXPLAIN ANALYZE).
-- Пример "доказательства" приведен ниже