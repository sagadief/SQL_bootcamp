INSERT INTO public.menu(id, pizzeria_id, pizza_name, price)
VALUES ((SELECT max(id) FROM menu) + 1,
(SELECT id FROM pizzeria WHERE name = 'Dominos'), 'sicilian pizza', 900);

INSERT INTO public.person_order(id, person_id, menu_id, order_date)
VALUES ((SELECT max(id) FROM person_order) + 1,
(SELECT id FROM person WHERE name = 'Denis'),
(SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), '2022-02-24');

INSERT INTO public.person_order(id, person_id, menu_id, order_date)
VALUES ((SELECT max(id) FROM person_order) + 1,
(SELECT id FROM person WHERE name = 'Irina'),
(SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'), '2022-02-24');

DE