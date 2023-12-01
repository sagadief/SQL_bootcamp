DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date;
CREATE OR REPLACE FUNCTION
fnc_person_visits_and_eats_on_date(
	IN pperson varchar DEFAULT 'Dmitriy',
	IN pprice numeric DEFAULT 500,
	IN pdate date DEFAULT '2022-01-08')
RETURNS TABLE(
          name VARCHAR
          )
AS $$
-- DECLARE pizzeria_name VARCHAR;
	BEGIN
	    return query(
		SELECT DISTINCT pizzeria.name AS name FROM person_visits pv
        JOIN person ON pv.person_id = person.id
        JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
        JOIN menu ON pizzeria.id = menu.pizzeria_id
        WHERE person.name = pperson AND pv.visit_date = pdate
        AND menu.price < pprice
        );
	END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');