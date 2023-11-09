SELECT missing_date
FROM (SELECT gs::date AS missing_date FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs) AS gs_dates
LEFT JOIN (SELECT DISTINCT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) AS dates
ON gs_dates.missing_date = dates.visit_date
WHERE dates.visit_date IS NULL;
