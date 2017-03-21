USE Pavkin;

SELECT * FROM graduation;
SELECT * FROM profession_kind;
SELECT * FROM profession;

INSERT profession(NAME, PROFESSION_DESCRIPTION, AVERAGE_SALARY, PROFESSION_KIND_ID) VALUES('PLOTNIC PO DRUGOME DEREVU', 'STROGAET DRUGOE DEREVO', 14000, 1);
INSERT profession(NAME, PROFESSION_DESCRIPTION, AVERAGE_SALARY, PROFESSION_KIND_ID) VALUES('HIRURG', 'BIKER', 19000, 3);

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


