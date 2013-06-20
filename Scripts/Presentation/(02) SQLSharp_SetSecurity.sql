USE SQL#Presentation
GO

-- We can change the security level differently per assembly
EXEC [SQL#].SQLsharp_SetSecurity 3, 'SQL#';
EXEC [SQL#].SQLsharp_SetSecurity 3, 'SQL#.FileSystem';
EXEC [SQL#].SQLsharp_SetSecurity 3, 'SQL#.Network';
EXEC [SQL#].SQLsharp_SetSecurity 3, 'SQL#.DB';
EXEC [SQL#].SQLsharp_SetSecurity 3, 'SQL#.DotNetZip';
EXEC [SQL#].SQLsharp_SetSecurity 3, 'SQL#.OS';
