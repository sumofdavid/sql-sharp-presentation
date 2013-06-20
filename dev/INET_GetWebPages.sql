
DECLARE @sql nvarchar(max) = N'data=';
SELECT @sql = @sql + SQL#.INET_URIEncode(N'DECLARE @id int = 7; SELECT TOP 3 * FROM (SELECT CourseName, COUNT(*) RegistrationCount FROM v_Registrations WHERE StudentID IN  (SELECT DISTINCT StudentID FROM v_Registrations WHERE CourseID = @id) AND CourseID <> @id GROUP BY CourseName) dv ORDER BY RegistrationCount DESC, CourseName ASC;');
http://maps.googleapis.com/maps/api/geocode/xml?address=San%20Diego&sensor=false




SELECT * FROM SQL#.INET_GetWebPages('http://imdbapi.org/?id=tt0126029&type=xml&plot=simple&episode=0&lang=en-US&aka=simple&release=simple&business=0&tech=0', 1, 0, 0, -1, -1, NULL, 'Get', NULL, 'Auto')

SELECT * FROM SQL#.INET_GetWebPages('http://www.yahoo.com', 1, 0, 5, -1, -1, NULL, NULL, NULL, 'Auto')