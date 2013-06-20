USE SQL#Presentation
GO

DECLARE @email nvarchar(300) = N'',
		@regex nvarchar(300) = N'^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,6}$'

-- valid address
SET @email = 'david@sumlin.com'

SELECT SQL#.RegEx_IsMatch(@email, @regex , 1, 'IgnoreCase')

-- invalid address
SET @email = 'david.sumlin.com'

SELECT SQL#.RegEx_IsMatch(@email, @regex , 1, 'IgnoreCase')

-- should be valid address, but @regex isn't right
SET @email = 'david@sumlin.register'

SELECT SQL#.RegEx_IsMatch(@email, @regex , 1, 'IgnoreCase')

-- by changing regexp, is valid now
SET @regex = N'^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,8}$' -- changed last argument to say that TLD needs to be between 2 and 8 characters
SET @email = 'david@sumlin.register'

SELECT SQL#.RegEx_IsMatch(@email, @regex , 1, 'IgnoreCase')
