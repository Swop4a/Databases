CREATE TABLE forum(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT forum_pk Primary key,
	NAME nvarchar(40),
	RATING int NOT NULL
);

CREATE TABLE profession_kind(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT profession_kind_pk Primary key,
	TYPE nvarchar(40) NOT NULL
);

CREATE TABLE profession(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT profession_pk Primary key,
	NAME nvarchar(40) NOT NULL,
	PROFESSION_DESCRIPTION nvarchar(255),
	AVERAGE_SALARY int NOT NULL,
	PROFESSION_KIND_ID int FOREIGN KEY (PROFESSION_KIND_ID) REFERENCES profession_kind(ID)
);

CREATE TABLE company(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT company_pk Primary key,
	NAME nvarchar(40) NOT NULL,
);

CREATE TABLE comments(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT comments_id Primary key,
	COMPANY_ID int FOREIGN KEY (COMPANY_ID) REFERENCES company(ID),
	FORUM_ID int FOREIGN KEY (FORUM_ID) REFERENCES forum(ID),
	COMMENTS nvarchar(40),
	MARK int NOT NULL
);

CREATE TABLE vacancy(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT vacancy_pk Primary key,
	DESCRIPTION nvarchar(255),
	PROFESSION_ID int FOREIGN KEY (PROFESSION_ID) REFERENCES profession(ID),
	COMPANY_ID int FOREIGN KEY (COMPANY_ID) REFERENCES company(ID), 
	SALARY int NOT NULL,
	DATA_OPENING Date NOT NULL,
	DATA_CLOSING Date NOT NULL
);

CREATE TABLE employer(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT employer_pk Primary key,
	COMPANY_ID int FOREIGN KEY (COMPANY_ID) REFERENCES company(ID),
	NAME nvarchar(40) NOT NULL
);

CREATE TABLE graduation(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT graduation_pk Primary key,
	NAME nvarchar(40)
);

CREATE TABLE employee(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT employee_pk Primary key,
	NAME nvarchar(40) NOT NULL,
	AGE int NOT NULL,
	PHONE_NUMBER int,
	PROFESSION_ID int FOREIGN KEY (PROFESSION_ID) REFERENCES profession(ID), 
	GRADUATION_ID int FOREIGN KEY (GRADUATION_ID) REFERENCES graduation(ID)
);

CREATE TABLE resume_table(
	ID int IDENTITY(1, 1) NOT NULL CONSTRAINT resume_pk Primary key,
	EMPLOYEE_ID int FOREIGN KEY (EMPLOYEE_ID) REFERENCES employee(ID),
	DESIRE_SALARY int NOT NULL,
	DESCRIPTION nvarchar(255) 
);

CREATE TABLE vacancy_list(
	VACANCY_ID int FOREIGN KEY (VACANCY_ID) REFERENCES vacancy(ID),
	RESUME_ID int FOREIGN KEY (RESUME_ID) REFERENCES resume_table(ID),
	CONSTRAINT vacancy_list_pk UNIQUE (VACANCY_ID, RESUME_ID)
);

CREATE TABLE last_job(
	EMPLOYEE_ID int, --��������� ����
	PROFESSION_ID int,
	START_WORKING_DATE Date NOT NULL,
	FINISH_WORKING_DATE Date NOT NULL,
	CONSTRAINT last_job_pk Primary Key(EMPLOYEE_ID, PROFESSION_ID) 
);

CREATE TABLE vacancy_register (
  vacancy_id  INT,
  description VARCHAR(255),
  date        DATETIME,
  old_salary  INT,
  new_salary  INT
);
