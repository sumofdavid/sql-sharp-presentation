USE SQL#Presentation
GO

/*
Scenario:  You need to pull data from an internal or external SSRS report and then export it as a file

Techniques used:  
1.  Acquire SSRS report in XML format utilizing SQL#.INET_DownloadFile clr function
2.  Shred xml into tabular format
3.  Export to a file using SQL#.DB_BulkExport

Possibilities:  
*  You may need to transform this data before exporting it.
*  You may want to FTP it somewhere
*  You can run this as a SQL Agent job to move data
*  You can use SQL#.INET_GetWebPage to pull a web page to parse, or call a webservice
*  For a simple file you can also use SQL#.INET_SplitIntoFields

*/
SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;

DECLARE @x xml,
		@row_count int;

-- delete temp table if exists
IF OBJECT_ID('tempdb..#state') IS NOT NULL
	DROP TABLE #state

-- create temp table  (using because the .net clr can't access a table variable)
CREATE TABLE #state
(
	[name] varchar(50) NOT NULL,
	[abbreviation] varchar(2) NOT NULL
);


-- retrieve values from SSRS report
SELECT  @x = CAST(SQL#.INET_DownloadFile('http://dtc97c3e0cf5622/ReportServer?/SSRS001/statelisting&rs:Format=XML', '') AS xml);

-- insert into temp table shredded xml
WITH XMLNAMESPACES(DEFAULT 'statelisting', 'http://www.w3.org/2001/XMLSchema-instance' AS ns1) -- need to make sure you declare both namespaces
INSERT INTO #state       
(
	name,
	abbreviation
)
SELECT	
	LTRIM(RTRIM(x.Detail.value('@name[1]', 'VARCHAR(50)'))) AS name,
	LTRIM(RTRIM(x.Detail.value('@abbreviation[1]', 'VARCHAR(2)'))) AS abbreviation
FROM @x.nodes('//table1/Detail_Collection/Detail') AS x(Detail);


-- now we want to put that data into comma delimited values in a text file
-- Output to file
EXEC SQL#.DB_BulkExport
	@Query = 'SELECT * FROM #state',
	@TextQualifier = '"',  
	@TextQualifyAllColumns = 1, -- 1 = qualify all columns, 0 = qualify only character, date, and uniqueidentifer data types
	@ColumnHeaderHandling = 'Results', -- Always, Results, Never  (NULL or empty string = Always)
	@BitHandling = 'Number', -- Word (default)(True or False), Letter (T or F), Number (1,0)
	@FirstRow = 0, -- The first result row to export (0 = ignore)
	@LastRow = 0, -- The last result row to export (0 = ignore)
	@FieldTerminator = ',',
	@RowTerminator = NULL,  -- can be any characters, but default (NULL) = CR/LF \r\n
	@OutputFilePath = 'C:\users\sumlin\desktop\SQLSharpPresentation\states.txt',
	@FileEncoding = 'ASCII',
	@AppendFile = 0,  -- 0 = if file exists, file will be replaced.  1 = if file exists, file will be appended.
	@RowsExported = @row_count OUT; -- returns the number of records / rows exported....optional


SELECT @row_count AS [Number of Rows From SSRS Report]