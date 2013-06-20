USE SQL#Presentation
GO


SELECT *
FROM SQL#.File_GetDirectoryListing('C:\Program Files (x86)', 1, '', '(\.xls)')
WHERE [Type] <> 'Dir'