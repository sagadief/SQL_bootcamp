DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

CREATE OR REPLACE FUNCTION fnc_persons(IN pgender varchar default 'female')
RETURNS TABLE(id bigint,
              name varchar,
              age integer,
              gender varchar,
              address varchar)
AS $$
	SELECT * FROM person WHERE gender = pgender;
$$ LANGUAGE SQL;

SELECT * FROM fnc_persons(pgender := 'male');

SELECT * FROM fnc_persons();