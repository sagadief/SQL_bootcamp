SELECT DISTINCT name FROM person_order pv JOIN person ON pv.person_id = person.id
ORDER BY name;