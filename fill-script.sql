BULK INSERT graduation
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\graduation.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM graduation;

BULK INSERT profession_kind
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\profession_kind.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM profession_kind;

BULK INSERT profession
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\profession.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM profession;

BULK INSERT company
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\company.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM company;

BULK INSERT vacancy
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\vacancy.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM vacancy;

BULK INSERT employee
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\employee.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM employee;

BULK INSERT resume_table
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\resume.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM resume_table;

BULK INSERT forum
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\forum.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM forum;

BULK INSERT comments
FROM 'C:\Database\files\comments.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM comments;

BULK INSERT employer
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\employer.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM employer;

BULK INSERT last_job
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\last_job.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM last_job;

BULK INSERT vacancy_list
FROM 'C:\Users\Swop4a\IdeaProjects\databases\src\main\resources\files\vacancy_list.txt'
WITH
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

SELECT * FROM vacancy_list;

select * from graduation;
select * from profession_kind;
select * from profession;
select * from company;
select * from vacancy;
select * from employee;
select * from resume_table;
SELECT * from forum;
SELECT * FROM comments;
SELECT * FROM employer;
SELECT * FROM last_job;
SELECT * FROM vacancy_list;