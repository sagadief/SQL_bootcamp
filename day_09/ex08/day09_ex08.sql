drop function if exists fnc_fibonacci;
CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop NUMERIC DEFAULT 10)
RETURNS TABLE(
        NUM NUMERIC
             )
AS $$
	WITH RECURSIVE fibonacci(first, second) AS (
		SELECT 0, 1
		UNION
		SELECT second, first + second FROM fibonacci
		WHERE second < pstop
	)
	SELECT first FROM fibonacci
$$ LANGUAGE sql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();