USE SQL#Presentation
GO

-- sample data
DECLARE @t TABLE (UserInputtedString varchar(max) NULL);

INSERT INTO @t (UserInputtedString)
VALUES	('<persons><person firstname="david" lastname="sumlin"></person></persons>'),
		('<persons><person firstname="roger" lastname="moore"></person</persons>'), -- invalid because of missing >
		('<persons><person firstname="marilyn" lastname="monroe"></persons>'), -- invalid because of missing </person>
		('<persons><person firstname="richie" lastname="rich"></person></persons>'),
		('<persons><person firstname="buckeroo" lastname="bonzai"></person></persons>'),
		('<persons><person firstname="john" lastname="big bootee"></person></persons>'),
		('<persons><person firstname="john" lastname="connor"></person></persons>'),
		('<person><person firstname="tiger" lastname="woods"></person></persons>'), -- invalid because starting element is spelled wrong
		(NULL);  -- is valid

-- THE SCENARIO
-- We want to find all the rows that are valid xml

-- before sql 2012 the only way to determine whether a string was a valid xml document/fragment was by using try catch
-- this will not work
SELECT
	UserInputtedString,
	CAST(UserInputtedString AS xml)  -- upon trying to cast an invalid xml DOM, you will get an error
FROM @t

----------------------------------------------------------------------------------------------------------
-- this will work, but is lengthy
DECLARE @i bit,
		@s varchar(max),
		@x xml;

DECLARE @t2 TABLE (UserInputtedString varchar(MAX) NULL, IsValidXML bit NOT NULL);

DECLARE curs CURSOR LOCAL FOR
	SELECT 
		UserInputtedString
	FROM @t;

OPEN curs;
FETCH NEXT FROM curs INTO @s;

WHILE @@FETCH_STATUS = 0
BEGIN

	BEGIN TRY
		
		SET @i = 1
		SELECT @x = CAST(@s AS xml)

	END TRY
	BEGIN CATCH
		SET @i = 0

	END CATCH

	INSERT INTO @t2 SELECT @s, @i	  
	
	FETCH NEXT FROM curs INTO @s	
END

CLOSE curs;
DEALLOCATE curs;

-- get results
SELECT * 
FROM @t2;
-- wow, that is kind of sucky!


----------------------------------------------------------------------------------------------------------
-- with SQL# it's easy
SELECT
	UserInputtedString,
	SQL#.Util_IsValidConvert(UserInputtedString,'xml',NULL, NULL)
FROM @t;


----------------------------------------------------------------------------------------------------------
-- with SQL 2012 we now have a built in TRY_CAST function
SELECT
	UserInputtedString,
	CASE
		WHEN UserInputtedString IS NULL THEN 1
		WHEN TRY_CAST(UserInputtedString AS xml) IS NULL THEN 0
		ELSE 1
	END
FROM @t;


----------------------------------------------------------------------------------------------------------
-- or we could create our own function  
IF OBJECT_ID('dbo.f_IsValidXML') IS NOT NULL
	DROP FUNCTION dbo.f_IsValidXML;
GO
CREATE FUNCTION [dbo].[f_IsValidXML]
(
	@s varchar(max)
)
RETURNS bit
AS
	BEGIN
		DECLARE @x bit = 1
        
		IF TRY_CAST(@s AS xml) IS NULL
			SET @x = 0
			
		RETURN @x      
	END
GO

SELECT
	UserInputtedString,
	dbo.f_IsValidXML(UserInputtedString)
FROM @t;



