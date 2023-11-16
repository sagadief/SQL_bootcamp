INSERT INTO public.menu(id, pizzeria_id, pizza_name, price)
VALUES ((SELECT max(id) FROM menu) + 1,
(SELECT id FROM pizzeria WHERE name = 'Dominos'), 'sicilian pizza', 900);
