USE SQL#Presentation
GO

-- business days in January this year.
SELECT SQL#.Date_BusinessDays('1/1/2013','1/31/2013',(1|2|4|8|16|32))  -- eliminates saturdays, sunday, new years, and MLK day

