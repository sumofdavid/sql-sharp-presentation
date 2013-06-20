USE SQL#Presentation
GO

DECLARE @crlf char(2) = CHAR(13) + CHAR(10),
		@s varchar(max) =	'This is a long commment that somebody may have posted on your blog.  They start the comment off with how fond they are of walking through the snow both ways, uphill.  They then reflect on how fun it was to take naps and drink Kool Aid in kindergarten, but then they digress about how gasoline used to be cheap and nowadays kids don''t know the value of a dollar. They finally get around to commening on just how great they think the president is doing.  Oh yah, and finally.... They comment on how you should always use lower case for everything in your sql code';

PRINT @s
PRINT '--------------------------------------------------------------------------------------'
PRINT SQL#.String_WordWrap(@s,40, @crlf)
PRINT '--------------------------------------------------------------------------------------'
PRINT SQL#.String_WordWrap(@s,40,'<br/>')
PRINT '--------------------------------------------------------------------------------------'
PRINT SQL#.String_WordWrap(@s,40,'<br/>' + @crlf)
