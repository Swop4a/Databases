USE Pavkin;

SELECT * FROM graduation;
SELECT * FROM profession_kind;
SELECT * FROM profession;

--Joins

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id,
	prof_kind.TYPE prof_kind_type
FROM dbo.profession prof
INNER JOIN dbo.profession_kind prof_kind ON prof.ID=prof_kind.ID;
SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id,
	prof_kind.TYPE prof_kind_type
FROM dbo.profession prof
LEFT OUTER JOIN dbo.profession_kind prof_kind ON prof.ID=0;

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id,
	prof_kind.TYPE prof_kind_type
FROM dbo.profession prof
RIGHT OUTER JOIN dbo.profession_kind prof_kind ON prof.ID=0;

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id,
	prof_kind.TYPE prof_kind_type
FROM dbo.profession prof
FULL OUTER JOIN dbo.profession_kind prof_kind ON prof.ID=0;

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id,
	prof_kind.TYPE prof_kind_type
FROM dbo.profession prof
CROSS JOIN dbo.profession_kind prof_kind;

--Filter

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id
FROM profession prof 
WHERE EXISTS (SELECT * FROM profession_kind prof_kind WHERE prof.ID=prof_kind.ID);

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id
FROM profession prof 
WHERE name IN ('PLOTNIC PO KRASNOMU DEREVU', 'PLOTNIC PO DRUGOMU DEREVU'); 

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id
FROM profession prof 
WHERE AVERAGE_SALARY > ALL(SELECT SALARY FROM vacancy);

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id
FROM profession prof 
WHERE AVERAGE_SALARY > SOME(SELECT SALARY FROM vacancy);

SELECT 
	prof_kind.ID,
	prof_kind.TYPE
FROM profession_kind prof_kind
WHERE prof_kind.ID BETWEEN 2 AND 3;

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id
FROM profession prof 
WHERE name LIKE 'PLOTNIC %';

--Case

SELECT 
	prof.ID id,
	prof.NAME name,
	PROFESSION_DESCRIPTION =
		CASE PROFESSION_DESCRIPTION
			WHEN 'STROGAET KRASNOE DEREVO' THEN 'KRASNOE'
			WHEN 'STROGAET DRUGOE DEREVO' THEN 'DRUGOE'
		END,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id
FROM profession prof;

--Use base functions

select CAST(AVG(AVERAGE_SALARY) AS numeric(6, 1)) from profession;
select CONVERT(numeric(6, 1), AVG(AVERAGE_SALARY)) from profession;

SELECT 
	prof.ID id,
	prof.NAME name,
	prof.PROFESSION_DESCRIPTION description_p,
	prof.AVERAGE_SALARY avrg_salary,
	prof.PROFESSION_KIND_ID prof_kind_id,
	prof_kind.TYPE prof_kind_type
FROM dbo.profession prof
CROSS JOIN dbo.profession_kind prof_kind
where PROFESSION_DESCRIPTION is null;


SELECT nullif(pk.id, pk.PROFESSION_KIND_ID) as result from profession pk;

 DECLARE @Var1 VARCHAR(5)
 DECLARE @Var2 VARCHAR(5)
 DECLARE @Var3 VARCHAR(5)
 set @Var1 = null
 set @Var2 = null
 set @Var3 = 'Var3'
 SELECT COALESCE(@Var1, @Var2, @Var3, '��� ��������� ������') as c, 
 iif (@Var1 is not null, 'Var 1 is not null', 'Var1 is null') as Var1,
 iif (@Var2 is not null, 'Var 2 is not null', 'Var2 is null') as Var2,
 iif (@Var3 is not null, 'Var 3 is not null', 'Var3 is null') as Var3;

 SELECT CONCAT ('����� ��', '=', 3.14) as Result;
 SELECT CONCAT('One', 'Two', NULL) as Result;

 SELECT REPLACE('SSTU one <3', 'SSTU', 'SSU');
 SELECT CONCAT(SUBSTRING('SSU IS NOT ONE <3', 0, 4), SUBSTRING('SSU IS NOT ONE <3', 11, 13));
 SELECT STUFF('SSU IS NOT ONE <3', 5, 6, '');
 SELECT ASCII('a'), UNICODE('a');
 SELECT LOWER('SsU onE <3');
 SELECT UPPER('SsU onE <3');

 --Date query
 SELECT DATEPART(year, 0), DATEPART(month, 0), DATEPART(day, 0);
 SELECT DATEADD(day, 7, CURRENT_TIMESTAMP);
 SELECT DATEDIFF(wk, '20051022', '20051029');
 SELECT GETDATE();
 SELECT SYSDATETIMEOFFSET();

 --Query with 'group by' and having
 select NAME, SUM(AVERAGE_SALARY) 
 from profession group by name
 having SUM(AVERAGE_SALARY) >= 15000;
