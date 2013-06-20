USE SQL#Presentation
GO
SELECT SQL#.Math_RandomRange(NULL, -10, 10), RAND()
SELECT SQL#.Math_RandomRange(NULL, -10, 10), RAND(4)
SELECT SQL#.Math_RandomRange(NULL, -10, 10), RAND(4), RAND()

SELECT *, 
	RAND(ints.IntNum) AS RandSeeded, 
	RAND() AS RandOnly,
SQL#.Math_RandomRange(ints.IntNum, 1, 8) AS MathSeeded,
SQL#.Math_RandomRange(NULL, 1, 8) AS MathOnly
FROM SQL#.Util_GenerateInts(1, 200, 2) ints

-- Get 200 random numbers
SELECT 
SQL#.Math_RandomRange(NULL, 1, 200)
FROM SQL#.Util_GenerateInts(1, 200, 2) ints