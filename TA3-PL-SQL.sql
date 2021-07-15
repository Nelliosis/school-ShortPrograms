CREATE USER TA3_USER IDENTIFIED BY GustoKoPumasa1234;

GRANT CONNECT, CREATE TABLE, CREATE SYNONYM, CREATE TYPE TO TA3_USER;
-- grants connection, table creation, synonym creation and type creation to TA3.
GRANT UPDATE, DELETE, SELECT, INSERT ON CAPAWING_DB.USERS TO TA3_USER;
-- grants the update, delete, select and insert table privileges to TA3
