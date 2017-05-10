create procedure FILTER_COMMENTS_BY_MARK
    @mark INT
  AS
    DECLARE @idishnik INT;

    DECLARE result_comment CURSOR FOR
        SELECT ID FROM comments
        WHERE @mark = MARK;

    OPEN result_comment

  FETCH NEXT FROM result_comment INTO
    @idishnik
  WHILE @@FETCH_STATUS = 0
  BEGIN
    PRINT @idishnik
    FETCH NEXT FROM result_comment INTO @idishnik
  END
  CLOSE result_comment
  DEALLOCATE result_comment
GO;

EXEC FILTER_COMMENTS_BY_MARK 3;
--------------------------------------------------------------------------
                              --Task #2
--------------------------------------------------------------------------
create procedure SEARCH_VACANCY_BY_COMPANY
    @company INT
  AS
    DECLARE @i INT
    DECLARE @desciption NVARCHAR(255);
    DECLARE cursor1 CURSOR FOR
      SELECT ID, DESCRIPTION FROM vacancy
      WHERE COMPANY_ID = @company

  OPEN cursor1;

  FETCH NEXT FROM cursor1 INTO
    @i, @desciption
  WHILE @@FETCH_STATUS = 0
  BEGIN
    PRINT RTRIM(CAST(@i AS INT)) + ' ' + RTRIM(CAST(@desciption AS NVARCHAR(255)))
    --PRINT @desciption
    FETCH NEXT FROM cursor1 INTO @i, @desciption
  END
  CLOSE cursor1;
  DEALLOCATE cursor1;
  GO;

EXEC SEARCH_VACANCY_BY_COMPANY 526;
--------------------------------------------------------------------------
                              --Task #3
--------------------------------------------------------------------------
create procedure GET_SALARY_IN_RANGE
    @lower_bound INT, @upper_bound INT
  AS
    SELECT * FROM vacancy WHERE SALARY BETWEEN @lower_bound AND @upper_bound;
  GO;

EXEC GET_SALARY_IN_RANGE 3000000, 4500000;
--------------------------------------------------------------------------
                              --Task #4
--------------------------------------------------------------------------
create procedure COUNT_OF_RESUME
  AS
    DECLARE @i INT;
    DECLARE @cnt INT;
    DECLARE cursor1 CURSOR FOR
      SELECT VACANCY_ID, count(*) AS cnt
        FROM vacancy_list
        GROUP BY VACANCY_ID;

    OPEN cursor1;

    FETCH NEXT FROM cursor1 INTO
      @i, @cnt
    WHILE @@FETCH_STATUS = 0
    BEGIN
      PRINT 'VACANCY: ' + RTRIM(CAST(@i AS INT)) + ' COUNT: ' +  RTRIM(CAST(@cnt AS INT));
      FETCH NEXT FROM cursor1 INTO @i, @cnt;
    END
    CLOSE cursor1;
    DEALLOCATE cursor1;
  GO;

EXEC COUNT_OF_RESUME;
--------------------------------------------------------------------------
                               --Task #5
--------------------------------------------------------------------------
create procedure GET_EMPLOYERS_FROM_COMPANY
  @company INT
  AS
    DECLARE @i INT
    DECLARE @name NVARCHAR(40)
    DECLARE cursor1 CURSOR FOR
      SELECT ID, NAME FROM employer WHERE @company = COMPANY_ID;

  OPEN cursor1;
  FETCH NEXT FROM cursor1 INTO
    @i, @name;
  WHILE @@FETCH_STATUS = 0
    BEGIN
       PRINT 'ID: ' + RTRIM(CAST(@i AS INT)) + ' NAME: ' + RTRIM(CAST(@name AS NVARCHAR(40)));
      FETCH NEXT FROM cursor1 INTO @i, @name;
    END
  CLOSE cursor1;
  DEALLOCATE cursor1;
  GO;

EXEC GET_EMPLOYERS_FROM_COMPANY 693;
--------------------------------------------------------------------------
drop procedure FILTER_COMMENTS_BY_MARK;
drop procedure SEARCH_VACANCY_BY_COMPANY;
drop procedure GET_SALARY_IN_RANGE;
drop procedure COUNT_OF_RESUME;
--------------------------------------------------------------------------
SELECT * FROM resume_table;
SELECT * from vacancy_list;
SELECT * FROM vacancy;
SELECT * FROM forum;
SELECT * FROM employer;
SELECT * FROM company;