USE SQL#Presentation
GO

SELECT *
FROM SQL#.Sys_Objects('',1)
WHERE type IN ('FN','IF','TF') -- functions
-- WHERE type IN ('TA','TR') -- triggers