DECLARE @doc nvarchar(max) = N'',
		@regex nvarchar(300) = N'\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b'

-- a document (could be a web page)
SET @doc = N'This is a long document that contains a few email addresses.  The first address, david@sumlin.com is my own address.  
I have heard that billg@microsoft.com will get to Bill Gates, but I don''t know.  I have also heard that you can email the president
by sending an email to obama@whitehouse.gov, but I don''t think that''s right'

-- replace email addresses with 
PRINT SQL#.RegEx_Replace(@doc, @regex, 'david@sumlin.com', -1, 1, 'IgnoreCase')


-- ### You can do a lot more with this function, but I'm not a regex guru, and haven't had the need