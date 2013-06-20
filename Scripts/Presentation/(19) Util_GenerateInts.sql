USE SQL#Presentation
GO

-- think about this as a dynamic "numbers" table
SELECT *
FROM SQL#.Util_GenerateInts(0,100,2)



-- a range of numbers
SELECT *
FROM SQL#.Util_GenerateIntRange(100,200,5)