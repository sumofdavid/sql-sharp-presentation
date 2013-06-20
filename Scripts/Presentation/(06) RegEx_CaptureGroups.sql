---------------------------------------------------------------------------------------------------------
-- Example #1
---------------------------------------------------------------------------------------------------------
-- find all of the html elements within a web page (why?  don't know)
DECLARE @doc nvarchar(max) = N'',
		@regex nvarchar(300) = N'<([A-Z][A-Z0-9]*)\b[^>]*>.*?</\1>';

SET @doc = N'<html><head><title>This is a sample web page</title></head><body><h1>This would be a big title of the website</h1>
<p>This is a list of links</p>
<ul><li><a href="http://www.yahoo.com">Yahoo</a></li>
<li><a href="http://www.micrososft.com">Microsoft</a></li>
<li><a href="http://www.google.com">Google</a></li></ul></body></html>';

SELECT * FROM SQL#.RegEx_CaptureGroups(@doc, @regex,1,'IgnoreCase');
GO







---------------------------------------------------------------------------------------------------------
-- Example #2
---------------------------------------------------------------------------------------------------------
-- find all the doubled words within the document
DECLARE @doc nvarchar(max) = N'The quick brown fox fox jumps over the the lazy dog',
		@regex nvarchar(300) = N'\b(\w+)\s+\1\b';

SELECT * FROM SQL#.RegEx_CaptureGroups(@doc, @regex,1,'IgnoreCase');

-- ### you could clean up the document using RegEx_Replace or a cursor solution
