SELECT person.name AS person_name1, pr.name AS person_name2, pr.address AS common_address
FROM person
JOIN person pr ON person.address = pr.address AND person.id > pr.id
ORDER BY person_name1, person_name2, common_address;
