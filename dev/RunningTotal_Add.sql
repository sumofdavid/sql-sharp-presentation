USE SQL#Presentation
GO

SELECT 
	ints.IntVal, 
	SQL#.RunningTotal_Add('', ints.IntVal, '') AS [Total]
FROM SQL#.Util_GenerateInts(0, 11, 1) ints
ORDER BY ints.IntVal ASC



DECLARE @RunningTotalID UNIQUEIDENTIFIER, 
		@Dummy FLOAT

SET @RunningTotalID = NEWID()

SET @Dummy = SQL#.RunningTotal_Add(@RunningTotalID, 5, '') -- preset value

SELECT 
	ints.IntVal, 
	SQL#.RunningTotal_Add(@RunningTotalID, ints.IntVal, '') AS [Total]
FROM SQL#.Util_GenerateInts(0, 11, 1) ints
ORDER BY ints.IntVal ASC


SELECT SQL#.RunningTotal_ClearCache(0);

SELECT 
	pc.Name,
	soh.OrderDate,
	sod.LineTotal,
	SQL#.RunningTotal_Add('',sod.LineTotal,pc.Name) ProductCategoryRunningTotal
FROM AdventureWorks.Sales.SalesOrderDetail sod
	INNER JOIN AdventureWorks.Sales.SalesOrderHeader soh
		ON sod.SalesOrderID = soh.SalesOrderID
	INNER JOIN AdventureWorks.Production.Product p
		INNER JOIN AdventureWorks.Production.ProductSubcategory psc
			INNER JOIN AdventureWorks.Production.ProductCategory pc
				ON psc.ProductCategoryID = pc.ProductCategoryID
			ON p.ProductSubcategoryID = psc.ProductSubcategoryID
		ON sod.ProductID = p.ProductID
WHERE soh.OrderDate >= '2/1/2004' AND soh.OrderDate < '2/5/2004'
ORDER BY pc.Name, soh.OrderDate


SELECT 
	ints.IntVal, 
	(ints.IntVal /3) AS [Grouping], 
	SQL#.RunningTotal_Add('',ints.IntVal, (ints.IntVal /3)) AS [Total]
FROM SQL#.Util_GenerateInts(0, 11, 1) ints
ORDER BY ints.IntVal ASC