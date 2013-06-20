USE SQL#Presentation
GO

-- drop if exists
IF OBJECT_ID('dbo.NewProduct','U') IS NOT NULL
	DROP TABLE NewProduct;

-- create the table
CREATE TABLE NewProduct
(
	ID int NOT NULL IDENTITY(1,1) CONSTRAINT PK_NewProduct PRIMARY KEY CLUSTERED,
	ProductName nvarchar(100) NOT NULL,
	Color nvarchar(15) NULL
);

  
EXEC SQL#.DB_BulkCopy
	@SourceType = N'MSSQL',
	@SourceConnection = N'Data Source=(local); Integrated Security=true; Initial Catalog=AdventureWorks;',
	@SourceQuery = N'SELECT ProductID, Name, Color FROM Production.Product',
	@DestinationConnection = N'Data Source=(local); Integrated Security=true; Initial Catalog=SQL#Presentation;',
	@DestinationTableName = N'dbo.NewProduct',
	@BatchSize = 10000,
	@NotifyAfterRows = 100,
	@TimeOut = 10000,
	@ColumnMappings = N'ProductID,ID|Name,ProductName|Color,Color',
	@BulkCopyOptionsList = N'KeepIdentity|CheckConstraints|TableLock|KeepNulls';

