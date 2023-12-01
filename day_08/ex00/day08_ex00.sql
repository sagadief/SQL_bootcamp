-- Session#1
BEGIN;

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

COMMIT;

--Session#2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

