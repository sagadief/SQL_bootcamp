SELECT name FROM person p 
JOIN person_order po ON p.id = po.person_id
WHERE p.gender = 'female' 
AND po.menu_id IN (SELECT id FROM menu WHERE pizza_name LIKE '%mushroom%' OR pizza_name LIKE '%pepperoni%')
ORDER BY name;
