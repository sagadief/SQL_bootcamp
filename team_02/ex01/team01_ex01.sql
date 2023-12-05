insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION nearest_rate(p_cur_id bigint, p_date timestamp) RETURNS numeric AS $$
DECLARE res numeric = NULL;
BEGIN
SELECT rate_to_usd INTO res
FROM (
        (
            SELECT 
				rate_to_usd,
                (c1.updated - p_date) as t
            FROM currency c1
            WHERE c1.updated > p_date
                and c1.id = p_cur_id
            ORDER BY t
            LIMIT 1
        )
        UNION
        (
            SELECT
				rate_to_usd,
                (p_date - c2.updated) as t
            FROM currency c2
            WHERE c2.updated < p_date
                and c2.id = p_cur_id
            ORDER BY t
            LIMIT 1
        )
        ORDER BY t ASC
        LIMIT 1
    ) formula_table;
RETURN res;
END;
$$ LANGUAGE plpgsql;

SELECT 
	COALESCE(U.name, 'not defined') AS name,
	COALESCE(U.lastname, 'not defined') AS lastname,
	C.name AS currency_name,
	ROUND (B.money * nearest_rate(B.currency_id, b.updated),2) AS currency_in_usd
FROM balance B
    LEFT JOIN "user" U ON B.user_id=U.id
    LEFT JOIN (SELECT DISTINCT id, name from currency) C ON c.id = B.currency_id
WHERE C.name IS NOT NULL
ORDER BY 1 DESC, 2, 3;
