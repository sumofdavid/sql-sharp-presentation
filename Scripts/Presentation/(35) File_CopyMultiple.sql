USE SQL#Presentation
GO

-- simple way to copy files from one destination to another (including recursive subdirectories (potentially filtered by a regex expression)
SELECT * 
FROM SQL#.File_CopyMultiple('C:\users\sumlin\desktop\SQL# Presentation', 1, '' , '(\.gif|\.jpg)$', 'C:\users\sumlin\desktop', 1)
