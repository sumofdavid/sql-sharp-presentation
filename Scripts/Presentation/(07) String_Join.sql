USE SQL#Presentation
GO

DECLARE @sql nvarchar(max) = N'	SELECT COLUMN_NAME
								FROM AdventureWorks.INFORMATION_SCHEMA.COLUMNS
								WHERE TABLE_NAME = N''Contact''
								AND TABLE_SCHEMA = N''Person''
								ORDER BY ORDINAL_POSITION'

PRINT SQL#.String_Join(@sql,',',2)

/*
@sql can be any sql statement that returns a single column of strings
The second parameter is the delimiter
The third parameter determines whether to keep empty entries

We all probably have some code snippet that we use to dynamically create column lists....this makes it easy
How many times have we forgot to remove the last comma?
*/