SELECT DB_NAME(ind.database_id) AS [DatabaseName],
       OBJECT_SCHEMA_NAME(ind.[object_id], ind.database_id) AS [TableSchema],
       OBJECT_NAME(ind.[object_id], ind.database_id) AS [TableName],
       SQL#.Sys_IndexName(ind.database_id, ind.[object_id], ind.index_id) AS [IndexName],
       *
FROM sys.dm_db_index_usage_stats ind