INSERT dbo.graduation(NAME) VALUES('srednee');
INSERT dbo.graduation(NAME) VALUES('visshee');

INSERT dbo.profession_kind(TYPE) VALUES('PLOTTNIC');
INSERT dbo.profession_kind(TYPE) VALUES('STROITEL');
INSERT dbo.profession_kind(TYPE) VALUES('VRACH');

INSERT profession(NAME, PROFESSION_DESCRIPTION, AVERAGE_SALARY, PROFESSION_KIND_ID) VALUES('PLOTNIC PO DRUGOME DEREVU', 'STROGAET DRUGOE DEREVO', 14000, 1);
INSERT profession(NAME, PROFESSION_DESCRIPTION, AVERAGE_SALARY, PROFESSION_KIND_ID) VALUES('HIRURG', 'BIKER', 19000, 3);

INSERT company (name) VALUES ('Apple');
INSERT company (name) VALUES ('Sumsung');
INSERT company (name) VALUES ('Xiaomi');

INSERT INTO vacancy (DESCRIPTION, PROFESSION_ID, COMPANY_ID, SALARY, DATA_OPENING, DATA_CLOSING)
  VALUES ('Some description #1', 1, 1, 30000, '12-10-25', '19-10-25');
INSERT INTO vacancy (DESCRIPTION, PROFESSION_ID, COMPANY_ID, SALARY, DATA_OPENING, DATA_CLOSING)
  VALUES ('Some description #2', 1, 2, 35000, '14-11-5', '15-3-25');
INSERT INTO vacancy (DESCRIPTION, PROFESSION_ID, COMPANY_ID, SALARY, DATA_OPENING, DATA_CLOSING)
  VALUES ('Some description #3', 2, 4, 35000, '14-11-5', '15-3-25');

INSERT INTO employee VALUES ('Petya', 22, 89363348, 1, 1);
INSERT INTO employee VALUES ('Vasya', 28, 89364568, 1, 2);

INSERT INTO resume_table VALUES (3, 58000, 'Some desc #1');
INSERT INTO resume_table VALUES (3, 51000, 'Some desc #2');
INSERT INTO resume_table VALUES (4, 30000, 'Some desc #3');

select * from graduation;
select * from profession_kind;
select * from profession;
select * from company;
select * from vacancy;
select * from employee;
SELECT * from resume_table;

