SELECT COALESCE(p.name, '-') as person_name, visit_date, 
COALESCE(pi.name, '-') as pizzeria_name 
FROM person p
FULL JOIN (SELECT * FROM person_visits 
		   WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-3') pv
		   ON p.id = pv.person_id
FULL JOIN pizzeria pi ON pv.pizzeria_id = pi.id
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-3' OR pv.visit_date is NULL
ORDER BY 1, 2, 3;
