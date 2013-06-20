USE SQL#Presentation
GO

/*
A way to possibly take uri strings and parse into fields

*/
SELECT tab.TheURI, info.* 
FROM	(
		SELECT 'http://www.place.com/dir/page.aspx?var1=val&var2=somethingElse' AS [TheURI]
		UNION ALL
		SELECT NULL
		UNION ALL
		SELECT 'https://196.168.12.6:23/'
		UNION ALL
		SELECT 'https://user:pass@localhost/page.htm&var=f%26g'
		) tab
	CROSS APPLY SQL#.INET_URIGetInfo(tab.TheURI) info