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
create procedure SEARCH_VACANCY_BY_COMPANY
    @company INT
  AS
    DECLARE @i INT
    DECLARE cursor1 CURSOR FOR
      SELECT * FROM vacancy
      WHERE COMPANY_ID = @company

  OPEN cursor1;

  FETCH NEXT FROM cursor1 INTO
    @i
  WHILE @@FETCH_STATUS
  GO;

--------------------------------------------------------------------------
drop procedure FILTER_COMMENTS_BY_MARK;

--------------------------------------------------------------------------
SELECT * from vacancy_list;
SELECT * FROM vacancy;