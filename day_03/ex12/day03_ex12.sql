INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT (generate_series((SELECT max(id) FROM person_order) + 1,
       (SELECT max(id) FROM person_order) + (SELECT count(*) FROM person))),
       (generate_series((SELECT min(id) FROM person),
       (SELECT count(*) FROM person))),
       (SELECT menu.id FROM menu WHERE menu.pizza_name = 'greek pizza'), '2022-02-25';



