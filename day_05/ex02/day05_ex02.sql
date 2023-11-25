CREATE INDEX IF NOT EXISTS idx_person_name ON person (upper(name));
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT name FROM person WHERE upper(name) = 'ANNA';



-- CREATE INDEX IF NOT EXISTS idx_person_visits_pizzeria_id ON person_visits (pizzeria_id);

-- Создайте, пожалуйста, функциональный индекс B-Tree с именем idx_person_name
-- для столбца name таблицы person. Индекс должен содержать имена персон в верхнем
-- регистре.
--
-- Напишите и предоставьте любой SQL с доказательством (EXPLAIN ANALYZE) того,
-- что индекс idx_person_name работает.