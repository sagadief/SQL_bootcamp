SELECT pizza_name, price, pizzeria.name pizzeria_name
FROM menu
         JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
         JOIN (SELECT id menu_id
               FROM menu
               EXCEPT
               SELECT menu_id
               FROM person_order) not_id
              ON menu.id = not_id.menu_id
ORDER BY pizza_name, price;