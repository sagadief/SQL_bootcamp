INSERT INTO public.menu(id, pizzeria_id, pizza_name, price)
VALUES ((SELECT max(id) FROM menu) + 1, 2, 'greek pizza', 800);

UPDATE menu SET price = (price - 0.1 * price) WHERE pizza_name = 'greek pizza';
