CREATE VIEW resume_employee
  WITH ENCRYPTION
  AS SELECT emp.NAME, r.desire_salary, r.description, emp.PHONE_NUMBER, emp.PROFESSION_ID, emp.GRADUATION_ID
  FROM resume_table r
  INNER JOIN employee emp
    ON r.EMPLOYEE_ID = emp.ID;

CREATE VIEW profession_details
  AS SELECT p.NAME, p.PROFESSION_DESCRIPTION, p.AVERAGE_SALARY, pk.TYPE
  from profession p
  INNER JOIN profession_kind pk
    ON p.PROFESSION_KIND_ID = pk.ID
    WHERE p.AVERAGE_SALARY > 10000
  WITH CHECK OPTION;

UPDATE profession_details
  SET AVERAGE_SALARY=9000
WHERE type=' flua';

SET NUMERIC_ROUNDABORT OFF;
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON;

CREATE VIEW comments_view
  WITH SCHEMABINDING
  AS SELECT COMPANY_ID, FORUM_ID, COMMENTS, MARK
  FROM dbo.comments;

DELETE FROM comments;

SELECT * FROM comments_view;

SELECT * FROM comments;
SELECT * FROM comments_view WITH noexpend;

CREATE UNIQUE CLUSTERED INDEX comments_view_index
on comments_view (COMPANY_ID, FORUM_ID, COMMENTS, MARK);
