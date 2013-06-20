USE SQL#Presentation
GO

/*
Starting 1/1/2013, increment the date by 1 month till 12/31/2013
*/

SELECT *
FROM SQL#.Util_GenerateDateTimeRange('1/1/2013','12/31/2013',1,'Month');

/*
By week
*/
SELECT * 
FROM SQL#.Util_GenerateDateTimeRange('1/1/2013','12/31/2013',1,'Week');

/*
By day
*/
SELECT * 
FROM SQL#.Util_GenerateDateTimeRange('1/1/2013','12/31/2013',1,'Day');