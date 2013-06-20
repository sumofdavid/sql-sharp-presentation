USE SQL#Presentation
GO

DECLARE @String nvarchar(max)
SET @String = 'asd=234&=&asd=234&qw234234&asd=234&qw=234234&&qw=234234&asd=234&qw=234234&as%3dd=2%203%3e4&f=asd&g="234"'

/*
Parameters
1 = String of key value pairs
2 = Pair separator
3 = Key value separator
4 = Remove empty value pairs
5 = Trim (key, value, both)
6 = Decode (Key,Value,Both)
7 = Unquote (character to remove from both sides)
*/

SELECT * FROM SQL#.String_SplitKeyValuePairs(@String, '&', '=', 0, null, null,null) -- row 2 is empty
SELECT * FROM SQL#.String_SplitKeyValuePairs(@String, '&', '=', 1, null, null,null) -- empty row is gone
SELECT * FROM SQL#.String_SplitKeyValuePairs(@String, '&', '=', 1, 'key', null,null) -- row 2 key is trimmed
SELECT * FROM SQL#.String_SplitKeyValuePairs(@String, '&', '=', 1, 'key','value', null) -- row 8 value is decoded
SELECT * FROM SQL#.String_SplitKeyValuePairs(@String, '&', '=', 1, 'key','value', '"') -- row 10 value is unquoted