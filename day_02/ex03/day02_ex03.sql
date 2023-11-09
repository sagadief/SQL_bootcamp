WITH gs_date AS (SELECT gs::date AS missing_date FROM
	generate_series('2022-01-01', '2022-01-10', interval '1 day') as gs)
	SELECT missing_date FROM gs_date
LEFT JOIN (SELECT DISTINCT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS dates
ON gs_date.missing_date = dates.visit_date
WHERE dates.visit_date IS NULL;