SELECT person_order.order_date, CONCAT (name, ' (age:', age, ')') AS person_information 
FROM person JOIN person_order ON person_order.person_id = person.id
ORDER BY order_date, person_information;