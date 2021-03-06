--Part 1

CREATE TABLE TASKS
(
  TASKS_ID_TASK             VARCHAR2(11)                PRIMARY KEY,
  TASKS_NAME                VARCHAR2(100)             NOT NULL,
  TASKS_DESCRIPTION         VARCHAR2(250)             NOT NULL,
  TASKS_WORK                VARCHAR2(150)             NOT NULL,
  TASKS_ID_PROJECT          VARCHAR2(20)              NOT NULL,
  TASKS_START_DATE          DATE                      NOT NULL,
  TASKS_END_DATE            DATE                      NOT NULL,
  TASKS_CREATED_AT          VARCHAR2(50)              NOT NULL,
  TASKS_UPDATED_AT          VARCHAR2(50)              NOT NULL,
  TASKS_ENABLED             NUMBER(1)                 NOT NULL,
)


CREATE TABLE USERS
(
  USERS_ID_USER              VARCHAR2(11)              PRIMARY KEY,
  USERS_LAST_NAME            VARCHAR2(100)             NOT NULL,
  USERS_FIRST_NAME           VARCHAR2(100)             NOT NULL,
  USERS_EMAIL                VARCHAR(50)               NOT NULL,
  USERS_USERNAME             VARCHAR2(150)             NOT NULL,
  USERS_PASSWORD             VARCHAR2(200)             NOT NULL,
  USERS_CREATED_AT           VARCHAR2(50)              NOT NULL,
  USERS_UPDATED_AT           VARCHAR2(50)              NOT NULL,
  USERS_ENABLED              NUMBER(1)                 NOT NULL
)

CREATE TABLE TIME_CATEGORY
(
  TIME_CATEGORY_ID          VARCHAR2(11)              PRIMARY KEY,
  TIME_CATEGORY_NAME        VARCHAR2(250)             NOT NULL,
  TIME_CATEGORY_DESCRIPTION VARCHAR2(300)             NOT NULL,
  TIME_CATEGORY_CREATED_AT  VARCHAR2(50)              NOT NULL,
  TIME_CATEGORY_UPDATED_AT  VARCHAR2(50)              NOT NULL,
  TIME_CATEGORY_ENABLED     NUMBER(1)                 NOT NULL
)

CREATE TABLE TIME_SHEET
(
  TIME_SHEET_ID             VARCHAR2(11)              PRIMARY KEY,
  TIME_SHEET_NAME           VARCHAR2(250)             NOT NULL,
  TIME_SHEET_DESCRIPTION    VARCHAR2(300)             NOT NULL,
  TIME_SHEET_ID_PROJECT     VARCHAR2(20)              NOT NULL,
  TIME_SHEET_CREATED_AT     VARCHAR2(50)              NOT NULL,
  TIME_SHEET_UPDATED_AT     VARCHAR(50)               NOT NULL,
  TIME_SHEET_ENABLED        NUMBER(1)                 NOT NULL,
  TIME_SHEET_ID_USER        VARCHAR2(11)              NOT NULL
)

CREATE TABLE TIME_SHEET_HOUR
(
  TIME_SHEET_HOUR_ID                    VARCHAR2(11)               PRIMARY KEY,
  TIME_SHEET_HOUR_TIME_SHEET_ID         VARCHAR2(11)               NOT NULL,
  TIME_SHEET_HOUR_USER_ID               VARCHAR2(11)               NOT NULL,
  TIME_SHEET_HOUR_TIME_CATEGORY_ID      VARCHAR2(11)               NOT NULL,
  TIME_SHEET_HOUR_TASK_ID               VARCHAR2(11)               NOT NULL,
  TIME_SHEET_HOUR_QUANTITY              NUMBER(10)                 NOT NULL CHECK(TIME_SHEET_HOUR_QUANTITY >= 0),
  TIME_SHEET_HOUR_DESCRIPTION           VARCHAR(300)               NOT NULL,

  CONSTRAINT TIME_SHEET_HOUR_TIME_SHEET_ID_FK FOREIGN KEY(TIME_SHEET_HOUR_TIME_SHEET_ID) REFERENCES TIME_SHEET(TIME_SHEET_ID),
  CONSTRAINT TIME_SHEET_HOUR_USER_ID_FK FOREIGN KEY(TIME_SHEET_HOUR_USER_ID) REFERENCES USERS(USERS_ID_USER),
  CONSTRAINT TIME_SHEET_HOUR_TIME_CATEGORY_ID_FK FOREIGN KEY(TIME_SHEET_HOUR_TIME_CATEGORY_ID) REFERENCES TIME_CATEGORY(TIME_CATEGORY_ID),
  CONSTRAINT TIME_SHEET_HOUR_TASK_ID_FK FOREIGN KEY(TIME_SHEET_HOUR_TASK_ID) REFERENCES TASKS(TASKS_ID_TASK)
)

--part 2

create table jobs2 as select * from jobs

alter table jobs2
add job_category varchar(100)

insert into jobs2 values ('ST_ASSIST', 'Stock Aid', '5000', '13000', 'M_Operator')

select job_id, job_title, SUM(min_salary), AVG(min_salary) from jobs2
where job_title like '%Representative' and min_salary < 5000
group by job_id, job_title
order by job_id

--part 3
