USE SQL#Presentation
GO

SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

-- delete temp table if exists
IF OBJECT_ID('tempdb..#state') IS NOT NULL
	DROP TABLE #state;

-- create temp table
CREATE TABLE #state
(
	[name] varchar(50) NOT NULL,
	[abbreviation] varchar(2) NOT NULL
);

INSERT #state
EXEC SQL#.INET_SplitIntoFields 
	@URI = N'http://dtc97c3e0cf5622/ReportServer?/SSRS001/statelisting&rs:Format=CSV',
	@Timeout = -1,
	@RegExDelimiter = N',',
	@RowsToSkip = 1,
	@ColumnNames = N'State Name, State Abbreviation',
	@FileEncoding = N'ASCII',
	@DataTypes = 'varchar(50),varchar(2)';

SELECT * FROM #state;