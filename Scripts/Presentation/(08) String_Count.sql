USE SQL#Presentation
GO

/*
Parameters:
1 - String to search
2 - String to find
3 - Start position
4 - (1=Case Sensitive, 2= Case Insensitive)
5 - Overlap (0=Search starts at end of previous match. 1=Search starts at next character after start of previous match)

*/
DECLARE @string_to_search nvarchar(MAX) = N'aaabbbcccaaa',
		@string_to_find nvarchar(MAX) = N'aa'


SELECT SQL#.String_Count(@string_to_search, @string_to_find, 1, 2, 0); -- no overlap
SELECT SQL#.String_Count(@string_to_search, @string_to_find, 1, 2, 1); -- with overlap

