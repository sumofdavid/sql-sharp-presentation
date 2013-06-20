USE SQL#Presentation
GO

DECLARE @first_day_of_month datetime,
		@last_day_of_month datetime

SELECT	@first_day_of_month = SQL#.Date_FirstDayOfMonth(GETDATE(), 0, 0, 0, 0),
		@last_day_of_month = SQL#.Date_LastDayOfMonth(GETDATE(), 0, 0, 0, 0);


/*
What is the date for San Diego SQL Server Users group this month?
*/
SELECT SQL#.Date_NthOccurrenceOfWeekday(3,'Thursday',@first_day_of_month)

/*
What are the dates for the San Diego SQL Server Users Group this year?
3rd Thursday of the month
*/
SELECT 
	SQL#.Date_NthOccurrenceOfWeekday(3,'Thursday',DatetimeVal) AS ThirdThursday
FROM SQL#.Util_GenerateDateTimeRange('1/1/2013','12/31/2013',1,'Month')