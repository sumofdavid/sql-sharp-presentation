USE SQL#Presentation
GO

DECLARE @s nvarchar(1000) = N'Joe,,,John,James,Roger,Roy,Rick,Randy,David,Donald,Darrel,Donny,Mary,Mindy'

SELECT * FROM SQL#.String_Split(@s,',',1); -- keep empty entries
SELECT * FROM SQL#.String_Split(@s,',',2); -- remove empty entries


/*
In some sql databases, the f_split, fn_split, udf_split, whatever you call it!!  is used tremendously (m24 example).
*/