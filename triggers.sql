CREATE TABLE vacancy_register (
  vacancy_id  INT,
  description VARCHAR(255),
  date        DATETIME,
  old_salary  INT,
  new_salary  INT
);

UPDATE vacancy SET vacancy.SALARY=38000 WHERE vacancy.ID = 4;

SELECT * FROM vacancy_register;

CREATE TRIGGER update_vacancy
  ON vacancy AFTER UPDATE
  AS IF UPDATE (SALARY)
  BEGIN
    DECLARE  @old_salary INT
    DECLARE @new_salary INT
    DECLARE @vacancy_id INT
    DECLARE @description varchar(255)

    SELECT @old_salary = (SELECT SALARY FROM deleted)
    SELECT @new_salary = (SELECT SALARY FROM inserted)
    SELECT @vacancy_id = (SELECT ID FROM deleted)
    SELECT @description = (SELECT description FROM deleted)

    INSERT INTO vacancy_register VALUES (@vacancy_id, @description, GETDATE(), @old_salary, @new_salary);
  END;

CREATE TRIGGER delete_vacancy
  ON vacancy INSTEAD OF DELETE
  AS
  BEGIN
    DECLARE @vacancy_id INT

    SELECT @vacancy_id = (SELECT id FROM deleted)

    DELETE FROM vacancy_list WHERE vacancy_list.VACANCY_ID = @vacancy_id;
    DELETE FROM vacancy WHERE vacancy.id = @vacancy_id;
  END;

CREATE TRIGGER close_company
  ON company INSTEAD OF DELETE
  AS
  BEGIN
    DECLARE @company_id INT

    SELECT @company_id = (SELECT id FROM deleted)

    DELETE FROM vacancy WHERE vacancy.COMPANY_ID = @company_id;
    DELETE FROM company WHERE ID = @company_id
  END;

CREATE TRIGGER delete_resume
  ON resume_table INSTEAD OF  DELETE
  AS
  BEGIN
    DECLARE @resume_id INT

    SELECT @resume_id = (SELECT id FROM deleted);

    DELETE FROM vacancy_list WHERE vacancy_list.RESUME_ID = @resume_id;
    DELETE FROM resume_table WHERE resume_table.ID = @resume_id;
  END

  CREATE TRIGGER insert_profession
    ON profession INSTEAD OF INSERT
    AS
    BEGIN
      DECLARE @profession_kind_id INT

      SELECT @profession_kind_id = (SELECT PROFESSION_KIND_ID FROM inserted)

      IF NOT EXISTS(SELECT * FROM profession_kind WHERE profession_kind.id = @profession_kind_id)
        BEGIN
          ROLLBACK TRANSACTION;
          RAISERROR ('SUCH ITEM DOES NOT EXIST', 10, 1);
        END
      ELSE
        BEGIN
          DECLARE @id INT
          DECLARE @name VARCHAR(40)
          DECLARE @profesion_description VARCHAR(255)
          DECLARE @average_salary INT
          DECLARE @profession_kind INT

          SELECT @id = (SELECT id FROM inserted);
          SELECT @name = (SELECT name FROM inserted);
          SELECT @profesion_description = (SELECT PROFESSION_DESCRIPTION FROM inserted);
          SELECT @average_salary = (SELECT AVERAGE_SALARY FROM inserted);
          SELECT @profession_kind = (SELECT PROFESSION_KIND_ID FROM inserted);

          INSERT INTO profession VALUES( @name, @profesion_description, @average_salary, @profession_kind);
        END
    END

  CREATE TRIGGER add_vacancy
    ON vacancy INSTEAD OF INSERT
    AS
    BEGIN
      DECLARE @profession_id INT
      DECLARE @company_id INT
      DECLARE @date_opening DATE
      DECLARE @date_closing DATE

      SELECT @profession_id = (SELECT PROFESSION_ID FROM inserted);
      SELECT @company_id = (SELECT COMPANY_ID FROM inserted);

      IF NOT EXISTS(SELECT * FROM profession WHERE profession.id = @profession_id) OR
         NOT EXISTS(SELECT * FROM company WHERE company.ID = @company_id) OR @date_closing < @date_opening
        BEGIN
          ROLLBACK TRANSACTION;
          RAISERROR ('SUCH ITEM DOES NOT EXISTS', 10, 1);
        END
      ELSE
        BEGIN
          DECLARE @description  VARCHAR(255)
          DECLARE @salary INT

          INSERT INTO vacancy VALUES (@description, @profession_id, @company_id, @salary, @date_opening, @date_closing);
        END
    END

SELECT * from company;
SELECT * FROM vacancy;

DELETE FROM company WHERE company.ID = 3;

SELECT * FROM profession;