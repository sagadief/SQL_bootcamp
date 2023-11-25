SELECT p.name, m.pizza_name, m.price, (m.price - (m.price * pd.discount/100)) AS discount_price,
    p2.name AS pizzeria_name
FROM person_order po INNER JOIN menu m ON m.id = po.menu_id
    INNER JOIN person p ON p.id = po.person_id
    INNER JOIN person_discounts pd ON p.id = pd.person_id AND pd.pizzeria_id = m.pizzeria_id
    INNER JOIN pizzeria p2 ON m.pizzeria_id = p2.id
ORDER BY p.name, m.pizza_name;