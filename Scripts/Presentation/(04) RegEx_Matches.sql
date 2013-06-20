DECLARE @doc nvarchar(max) = N'',
		@regex nvarchar(300) = N'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b'

-- a document (could be a web page)
SET @doc = N'This is a long document that contains a few email addresses.  The first address, david@sumlin.com is my own address.  
I have heard that billg@microsoft.com will get to Bill Gates, but I do not know.  I have also heard that you can email the president
by sending an email to obama@whitehouse.gov, but I do not think that is right'

-- return the email addresses and where they are in the document
SELECT * 
FROM SQL#.RegEx_Matches(@doc, @regex, 1, 'IgnoreCase');



-- return urls from a web page
SET @regex = N'\b(https?|ftp|file)://[-A-Z0-9+&@#/%?=~_|!:,.;]*[A-Z0-9+&@#/%=~_|]'

SET @doc = N'<html><head><title>This is a sample web page</title></head><body><h1>This would be a big title of the website</h1>
<p>This is a list of links</p>
<ul><li><a href="http://www.yahoo.com">Yahoo</a></li>
<li><a href="http://www.micrososft.com">Microsoft</a></li>
<li><a href="http://www.google.com">Google</a></li></ul></body></html>'

-- return the urls
SELECT * 
FROM SQL#.RegEx_Matches(@doc, @regex, 1, 'IgnoreCase');
