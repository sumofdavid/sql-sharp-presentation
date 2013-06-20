USE SQL#Presentation
GO

DECLARE @dt date = CAST(DATEADD(dd,-2,GETDATE()) AS date), -- minus two days and the time component
		@s1 nvarchar(1000) = N'%{dd;;%d;;%d day;;%d days} %{hh;;%d;;%d hour;;%d hours} %{mi;;%d;;%d minute;;%d minutes} %{ss;;0 seconds;;%d second;;%d seconds}',
		@s3 nvarchar(1000) = N'%{yy;;%2d;;%2d;;%2d}:%{mm;;%2d;;%2d;;%2d}:%{dd;;%2d;;%2d;;%2d}:%{hh;;%2d;;%2d;;%2d}:%{mi;;%2d;;%2d;;%2d}:%{ss;;%2d;;%2d;;%2d}';

PRINT 'Begin Time = ' + CONVERT(varchar(100),@dt,120);
PRINT '  End Time = ' + CONVERT(varchar(100),GETDATE(),120);
PRINT '-----------------------------------------------------'
PRINT ' --- Elapsed Time Format #1 ---'
PRINT SQL#.Date_FormatTimeSpan(@dt, GETDATE(), @s1);
PRINT ' --- Elapsed Time Format #2 ---'
PRINT SQL#.Date_FormatTimeSpan(@dt, GETDATE(), @s3);

