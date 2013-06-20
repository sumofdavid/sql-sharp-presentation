USE SQL#Presentation
GO

SELECT 
	DATALENGTH(AdditionalContactInfo) AS RawSize, 
	DATALENGTH(SQL#.Util_GZip(CONVERT(varbinary(MAX),AdditionalContactInfo))) AS CompressedSize
FROM AdventureWorks2012.Person.Person
WHERE AdditionalContactInfo IS NOT NULL;

