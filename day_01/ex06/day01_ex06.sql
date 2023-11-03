SELECT t.data_of AS action_date, p.name AS person_name
FROM (
    SELECT order_date AS data_of, person_id FROM person_order
    UNION
    SELECT visit_date AS data_of, person_id FROM person_visits
) AS t
JOIN person AS p ON t.person_id = p.id
ORDER BY t.data_of, p.name DESC;
