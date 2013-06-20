USE SQL#Presentation
GO

EXEC SQL#.DB_DumpData
	@DBPattern = N'AdventureWorks',  -- can be regex
	@SchemaPattern = N'Production',  -- can be regex
	@TablePattern = N'Product',  -- can be regex
	@IncludeViews = 0,
	@IncludeComputedColumns = 0,
	@IdentityHandling = N'INSERT',  -- INSERT | INCLUDE | EXCLUDE
	@DBNameHandling = N'',
	@SchemaNameHandling = N'[%s].',
	@TableAndColumnNameQualifierLeft = N'[',
	@TableAndColumnNameQualifierRight = N']',
	@StringAndDateQualifier = N'''',
	@DateFormat = 121,
	@OutputFilePath = N'',
	@FileEncoding = N'',
	@LinkedServerName = N'',
	@DisableConstraints = 1,
	@DisableTriggers = 1;