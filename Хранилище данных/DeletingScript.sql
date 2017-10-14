-- Deleting script

-- Deleting script
DROP TABLE FastPurchases
DROP TABLE FastPurchasesArch
DROP PARTITION SCHEME PSFastPurchases_Date
DROP PARTITION SCHEME PSFastPurchasesArch
DROP PARTITION FUNCTION PFFastPurchases_Date
DROP PARTITION FUNCTION PFFastPurchasesArch
DROP PROCEDURE SW
GO


DROP TABLE dimClient
DROP TABLE dimClientCategory
DROP TABLE dimRecipe
DROP TABLE dimDate
DROP TABLE dimCook
DROP TABLE dimOffice
DROP TABLE dimLocation
GO