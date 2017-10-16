CREATE TABLE dimDate (
  Date_Id    BIGINT NOT NULL PRIMARY KEY,
  Second     INT,
  Minute     INT,
  Hour       INT,
  Day        INT    NOT NULL,
  Week       INT    NOT NULL,
  Month      INT    NOT NULL,
  Year       INT    NOT NULL,
  Quarter    INT    NOT NULL,
  Day_name   VARCHAR(40),
  Month_name VARCHAR(40)
)
ON [DateFG]
;

CREATE TABLE dimCompany (
  Company_Id BIGINT NOT NULL PRIMARY KEY,
  Name       VARCHAR(40),
  Stuff      INT,
  Capital    BIGINT
)
ON [CompanyFG]
;

CREATE TABLE dimJob (
  Job_Id      BIGINT NOT NULL PRIMARY KEY,
  Name        VARCHAR(40),
  Description VARCHAR(255),
  Salary      INT,
  Company_Id  BIGINT FOREIGN KEY (Company_Id) REFERENCES dimCompany (Company_Id)
)
ON [JobFG]
;

CREATE TABLE dimClients (
  Client_ID   BIGINT NOT NULL PRIMARY KEY,
  First_Name  VARCHAR(40),
  Last_Name   VARCHAR(40),
  Buisness_Id INT,
  Is_active   BIT,
  Job_Id      BIGINT FOREIGN KEY (Job_Id) REFERENCES dimJob (Job_Id)
)
ON [ClientsFG]
;

CREATE TABLE dimCategory (
  Category_Id   BIGINT NOT NULL PRIMARY KEY,
  Age           INT,
  Children      INT,
  Social_Status VARCHAR(20),
  Cars          INT
)
ON [CategoryFG]
;

CREATE TABLE dimType (
  Type_Id BIGINT NOT NULL PRIMARY KEY,
  Name    VARCHAR(20)
)
ON [TypeFG]
;

CREATE TABLE dimRating (
  Rating_id BIGINT NOT NULL PRIMARY KEY,
  Value     INT
)
ON [RatingFG]
;

CREATE PARTITION FUNCTION PartFuncPostAnalyze_Date ( BIGINT )
AS RANGE RIGHT FOR VALUES (20160101, 20170101)
GO

CREATE PARTITION SCHEME PartSchPostAnalyze_Date AS PARTITION PartFuncPostAnalyze_Date TO
(
  [PostAnalyzeFG],
  [PostAnalyzeFG],
  [PostAnalyzeFG]
)
GO

CREATE TABLE dimPostAnalyze (
  Post_Id          BIGINT NOT NULL,
  Type_Id          BIGINT FOREIGN KEY (Type_Id) REFERENCES dimType (Type_Id),
  Publication_date BIGINT FOREIGN KEY (Publication_date) REFERENCES dimDate (Date_Id),
  Client_Id        BIGINT FOREIGN KEY (Client_Id) REFERENCES dimClients (Client_ID),
  Category_Id      BIGINT FOREIGN KEY (Category_Id) REFERENCES dimCategory (Category_Id),
  Job_Id           BIGINT FOREIGN KEY (Job_Id) REFERENCES dimJob (Job_Id),
  Post_Desciption  VARCHAR(255),
  Post_status      VARCHAR(20),
  Rating_Id        BIGINT FOREIGN KEY (Rating_Id) REFERENCES dimRating (Rating_id)
    CONSTRAINT [PK_PostAnalyze] PRIMARY KEY CLUSTERED
      (
        Post_Id ASC, Publication_date ASC
      )
      WITH (IGNORE_DUP_KEY = OFF)
) ON PartSchPostAnalyze_Date (Publication_date
)
GO

CREATE PARTITION FUNCTION PartFuncPostAnalyzeRepository_Date ( BIGINT )
AS RANGE RIGHT FOR VALUES (20160101)
GO

CREATE PARTITION SCHEME PartSchPostAnalyzeRepository_Date AS PARTITION PartFuncPostAnalyzeRepository_Date TO
(
  [PostAnalyzeFG],
  [PostAnalyzeFG]
)
GO

CREATE TABLE dimPostAnalyzeRepository (
  Post_Id          BIGINT NOT NULL,
  Type_Id          BIGINT FOREIGN KEY (Type_Id) REFERENCES dimType (Type_Id),
  Publication_date BIGINT FOREIGN KEY (Publication_date) REFERENCES dimDate (Date_Id),
  Client_Id        BIGINT FOREIGN KEY (Client_Id) REFERENCES dimClients (Client_ID),
  Category_Id      BIGINT FOREIGN KEY (Category_Id) REFERENCES dimCategory (Category_Id),
  Job_Id           BIGINT FOREIGN KEY (Job_Id) REFERENCES dimJob (Job_Id),
  Post_Desciption  VARCHAR(255),
  Post_status      VARCHAR(20),
  Rating_Id        BIGINT FOREIGN KEY (Rating_Id) REFERENCES dimRating (Rating_id)
    CONSTRAINT [PK_PostAnalyzeRepository] PRIMARY KEY CLUSTERED
      (
        Post_Id ASC, Publication_date ASC
      )
      WITH (IGNORE_DUP_KEY = OFF)
) ON PartSchPostAnalyzeRepository_Date (Publication_date
)
GO


CREATE PROCEDURE SlidingWindow
AS
-- STEP 1
  DECLARE @DateForPartFP VARCHAR(8);
  DECLARE @DateForArch VARCHAR(8);

  SET @DateForPartFP = CAST((SELECT TOP 1 [value]
                             FROM sys.partition_range_values
                             WHERE function_id = (SELECT function_id
                                                  FROM sys.partition_functions
                                                  WHERE name = 'PartFuncPostAnalyze_Date')
                             ORDER BY boundary_id DESC) AS VARCHAR(8));

  SET @DateForArch = CAST((SELECT TOP 1 [value]
                           FROM sys.partition_range_values
                           WHERE function_id = (SELECT function_id
                                                FROM sys.partition_functions
                                                WHERE name = 'PartFuncPostAnalyze_Date')
                           ORDER BY boundary_id ASC) AS VARCHAR(8));

  DECLARE @Date_1 DATE;
  SET @Date_1 = DATEADD(YEAR, 1, CAST(@DateForPartFP AS DATE)); --2017
  DECLARE @Date_2 DATE;
  SET @Date_2 = DATEADD(YEAR, 1, CAST(@DateForArch AS DATE)); --2016

  ALTER PARTITION SCHEME PartSchPostAnalyze_Date NEXT USED [PostAnalyzeFG];
  ALTER PARTITION SCHEME PartSchPostAnalyzeRepository_Date NEXT USED [PostAnalyzeFG];

  ALTER PARTITION FUNCTION PartFuncPostAnalyze_Date() SPLIT RANGE (CAST( CONVERT ( VARCHAR (8), @Date_1, 112) AS BIGINT ));
  ALTER PARTITION FUNCTION PartFuncPostAnalyzeRepository_Date() SPLIT RANGE (CAST( CONVERT ( VARCHAR (8), @Date_2, 112) AS BIGINT ));

  PRINT 'Step 1 complited'
  -- STEP 2
  DECLARE @last_section_number INT;
  SET @last_section_number = (SELECT TOP 1 [partition_number]
                              FROM sys.partitions
                              WHERE OBJECT_ID =
                                    (SELECT OBJECT_ID
                                     FROM sys.tables
                                     WHERE name = 'dimPostAnalyzeRepository')
                              ORDER BY [partition_number] DESC) - 1;

  ALTER TABLE dimPostAnalyze
    SWITCH PARTITION 2 TO dimPostAnalyzeRepository PARTITION @last_section_number;
PRINT 'Step 2 complited'
  -- STEP 3
  DECLARE @Date_First BIGINT;
  DECLARE @Date_FirstArch BIGINT;

  SET @Date_First = CAST((SELECT TOP 1 [value]
                          FROM sys.partition_range_values
                          WHERE function_id = (SELECT function_id
                                               FROM sys.partition_functions
                                               WHERE name = 'PartFuncPostAnalyze_Date')
                          ORDER BY boundary_id ASC) AS BIGINT);

  ALTER PARTITION FUNCTION PartFuncPostAnalyze_Date() MERGE RANGE (@Date_First);
  PRINT 'Step 3 complited'
  -- STEP 4
  SET @DateForArch = CAST((SELECT TOP 1 [value]
                           FROM sys.partition_range_values
                           WHERE function_id = (SELECT function_id
                                                FROM sys.partition_functions
                                                WHERE name = 'PartFuncPostAnalyzeRepository_Date')
                           ORDER BY boundary_id DESC) AS VARCHAR(8));
  SET @Date_2 = DATEADD(YEAR, -1, CAST(@DateForArch AS DATE));
  PRINT CONVERT(VARCHAR(8), @Date_2, 112);
  ALTER PARTITION FUNCTION PartFuncPostAnalyzeRepository_Date() MERGE RANGE (CAST( CONVERT ( VARCHAR (8), @Date_2, 112) AS BIGINT ));
  ALTER PARTITION SCHEME PartSchPostAnalyzeRepository_Date NEXT USED [PostAnalyzeFG];
  ALTER PARTITION FUNCTION PartFuncPostAnalyzeRepository_Date() SPLIT RANGE (CAST( CONVERT ( VARCHAR (8), @Date_2, 112) AS BIGINT ));
PRINT 'Step 4 complited'
-- STEP 5
GO

DROP PROCEDURE SlidingWindow

SELECT
  partition_number,
  rows
FROM sys.partitions
WHERE OBJECT_ID = (SELECT OBJECT_ID
                   FROM sys.tables
                   WHERE name = 'dimPostAnalyze')

SELECT
  partition_number,
  rows
FROM sys.partitions
WHERE OBJECT_ID = (SELECT OBJECT_ID
                   FROM sys.tables
                   WHERE name = 'dimPostAnalyzeRepository')

EXEC SlidingWindow;

-- TEST

SELECT *
FROM sys.partition_functions AS pf
  INNER JOIN sys.partition_range_values AS prv ON prv.function_id = pf.function_id

SELECT *
FROM dimPostAnalyze;
SELECT *
FROM dimPostAnalyzeRepository;

CREATE NONCLUSTERED INDEX NoCL_Cities
ON dimClients(Last_Name);

--INDEXES
CREATE NONCLUSTERED INDEX NoCL_Clients
ON dimClients(Last_Name);

drop index NoCL_Clients on dimClients;

CREATE NONCLUSTERED INDEX NoCL_Rating
ON dimRating(Value);

drop index NoCL_Rating on dimRating;

CREATE NONCLUSTERED INDEX NoCL_Date
ON dimDate(Year)
INCLUDE (Quarter, Month, Week, Day);

drop index NoCL_Date on dimDate;

CREATE NONCLUSTERED INDEX NoCL_Category
ON dimCategory(Age);

CREATE NONCLUSTERED COLUMNSTORE INDEX NoCL_Post
ON dimPostAnalyze(Post_Id, Publication_date, Post_Desciption, Post_Status)

DROP INDEX NoCL_Post ON dimPostAnalyze;

--FILLING
INSERT INTO dimRating (Rating_id, Value) VALUES (1, 1);

INSERT INTO dimCategory (Category_Id, Age, Children, Social_Status, Cars) VALUES (1, 30, 0, 'Interprener', 1);

INSERT INTO dimType (Type_Id, Name) VALUES (1, 'Look for');
INSERT INTO dimType (Type_Id, Name) VALUES (2, 'Offer');

INSERT INTO dimCompany (Company_Id, Name, Stuff, Capital) VALUES (1, 'Apple', 100500, 100000000);

INSERT INTO dimDate (Date_Id, Second, Minute, Hour, Day, Week, Month, Year, Quarter, Day_name, Month_name)
VALUES
  (20150101, 1, 1, 1, 1, 1, 1, 2015, 3, 'Monday', 'January')
  , (20160801, 1, 1, 1, 1, 1, 8, 2016, 3, 'Monday', 'August')
  , (20170801, 1, 1, 1, 1, 1, 8, 2017, 3, 'Monday', 'August');

INSERT INTO dimJob (Job_Id, Name, Description, Salary, Company_Id)
VALUES (1, 'Programmer', 'Man who write code', 35000, 1);

INSERT INTO dimClients (Client_ID, First_Name, Last_Name, Buisness_Id, Is_active, Job_Id)
VALUES (1, 'fName', 'sName', 1, 1, 1);

INSERT INTO dimPostAnalyze (Post_Id, Type_Id, Publication_date, Client_Id, Category_Id, Job_Id, Post_Desciption, Post_status, Rating_Id)
VALUES (1, 1, 20160801, 1, 1, 1, 'Some desc', 1, 1);

UPDATE dimPostAnalyze SET .dimPostAnalyze."Publication_date" = 20170801

UPDATE dimPostAnalyze
SET Publication_date = 20170801
WHERE Post_Id = 1;

EXEC SlidingWindow;

SELECT *
FROM dimPostAnalyze;
SELECT *
FROM dimPostAnalyzeRepository;

DROP TABLE dimPostAnalyze;
DROP TABLE dimPostAnalyzeRepository;
DROP TABLE dimClients;
DROP TABLE dimRating;
DROP TABLE dimType;
DROP TABLE dimCategory;
DROP TABLE dimJob;
DROP TABLE dimCompany;
DROP TABLE dimDate;

DROP PROCEDURE SlidingWindow;