DELETE FROM FastPurchases
DELETE FROM FastPurchasesTemp
DELETE FROM dimCook
DELETE FROM dimOffice
DELETE FROM dimRecipe
DELETE FROM dimClient
DELETE FROM dimDate
GO

ALTER INDEX FP_ColumnIndex ON FastPurchases DISABLE
GO

ALTER INDEX FP_ColumnIndex ON FastPurchases REBUILD 
GO

SELECT * FROM dimOffice
SELECT * FROM dimCook
SELECT * FROM dimRecipe
SELECT * FROM dimClient
SELECT * FROM dimDate
SELECT * FROM FastPurchases
SELECT * FROM FastPurchasesTemp