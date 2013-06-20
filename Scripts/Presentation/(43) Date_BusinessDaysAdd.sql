USE SQL#Presentation
GO

-- 20 business days from now...excluding saturdays, sundays, and memorial day
SELECT SQL#.Date_BusinessDaysAdd(GETDATE(),30,(1|2|64))

