CREATE TABLE nodes (
    point1 CHAR(1),
    point2 CHAR(1),
    cost INT
);

INSERT INTO nodes (point1, point2, cost) VALUES
('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('a', 'd', 20),
('d', 'a', 20),
('b', 'c', 35),
('c', 'b', 35),
('b', 'd', 25),
('d', 'b', 25),
('c', 'd', 30),
('d', 'c', 30);

WITH tours AS
	(SELECT
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
),
min_tour AS (
	SELECT *
	FROM tours
	ORDER BY 1
	LIMIT 1
	)
SELECT tours.*
FROM tours, min_tour
WHERE tours.total_cost IN (min_tour.total_cost)
