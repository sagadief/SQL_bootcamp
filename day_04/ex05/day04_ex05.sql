CREATE VIEW v_price_with_discount AS (
    SELECT name, pizza_name, price, ROUND(price - price * 0.1) AS discount_price
    FROM person_order po JOIN person p ON po.person_id = p.id
    JOIN menu ON po.menu_id = menu.id
    ORDER BY name, pizza_name
);