CREATE INDEX IF NOT EXISTS idx_menu_unique ON menu (pizzeria_id, pizza_name);

EXPLAIN ANALYZE
SELECT pizzeria_id, pizza_name
FROM menu;