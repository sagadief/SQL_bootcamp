SELECT
	n1.cost + n2.cost + n3.cost + n4.cost AS total_cost,
	'{' || n1.point1 || ',' || n1.point2 || ',' ||
	n2.point2 || ',' || n3.point2 || ',' || n4.point2 || '}' AS tour
FROM nodes n1
JOIN nodes n2 ON n1.point2 = n2.point1
JOIN nodes n3 ON n2.point2 = n3.point1
JOIN nodes n4 ON n3.point2 = n4.point1
WHERE 
	n1.point1 = 'a'
	AND n2.point2 != n1.point1
	AND n3.point2 != n1.point1 
	AND n3.point2 != n2.point1
	AND n4.point2 = n1.point1
ORDER BY 1,2
