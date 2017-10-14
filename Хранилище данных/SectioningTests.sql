INSERT INTO dimDate VALUES
(20170102, 2017, 1, 2),
(20160102, 2016, 1, 2),
(20150102, 2015, 1, 2),
(20140102, 2014, 1, 2),
(20130102, 2013, 1, 2),
(20120102, 2012, 1, 2)
GO

INSERT INTO FastPurchases VALUES
(1, 1, 1, 1, 1, 1, 1, 1, 1, 20130102, 1, 1),
(1, 1, 1, 1, 1, 1, 1, 1, 1, 20140102, 1, 1),
(1, 1, 1, 1, 1, 1, 1, 1, 1, 20150102, 1, 1),
(1, 1, 1, 1, 1, 1, 1, 1, 1, 20160102, 1, 1),
(1, 1, 1, 1, 1, 1, 1, 1, 1, 20170102, 1, 1)
GO

EXEC SW
GO

SELECT * FROM FastPurchases
SELECT * FROM FastPurchasesArch
GO

SELECT CAST([value] as bigint) FROM sys.partition_range_values 
		WHERE function_id = (SELECT function_id FROM sys.partition_functions WHERE name = 'PFFastPurchases_Date')
		ORDER BY boundary_id
SELECT CAST([value] as bigint) FROM sys.partition_range_values 
		WHERE function_id = (SELECT function_id FROM sys.partition_functions WHERE name = 'PFFastPurchasesArch')
		ORDER BY boundary_id
GO

SELECT DISTINCT p.partition_number, fg.name, p.rows FROM sys.partitions p INNER JOIN sys.allocation_units au ON au.container_id = p.hobt_id 
	INNER JOIN sys.filegroups fg ON fg.data_space_id = au.data_space_id WHERE p.object_id = OBJECT_ID('FastPurchases')
GO
SELECT DISTINCT p.partition_number, fg.name, p.rows FROM sys.partitions p INNER JOIN sys.allocation_units au ON au.container_id = p.hobt_id 
	INNER JOIN sys.filegroups fg ON fg.data_space_id = au.data_space_id WHERE p.object_id = OBJECT_ID('FastPurchasesArch')
GO