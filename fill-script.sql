INSERT dbo.graduation(NAME) VALUES('srednee');
INSERT dbo.graduation(NAME) VALUES('visshee');

INSERT dbo.profession_kind(TYPE) VALUES('PLOTTNIC');
INSERT dbo.profession_kind(TYPE) VALUES('STROITEL');
INSERT dbo.profession_kind(TYPE) VALUES('VRACH');

INSERT profession(NAME, PROFESSION_DESCRIPTION, AVERAGE_SALARY, PROFESSION_KIND_ID) VALUES('PLOTNIC PO DRUGOME DEREVU', 'STROGAET DRUGOE DEREVO', 14000, 1);
INSERT profession(NAME, PROFESSION_DESCRIPTION, AVERAGE_SALARY, PROFESSION_KIND_ID) VALUES('HIRURG', 'BIKER', 19000, 3);

select * from graduation;
select * from profession_kind;
select * from profession;

