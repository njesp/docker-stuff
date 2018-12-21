-- Script to modify new Docker Oracle Database
alter session set container = xepdb1;
-- sysprivs
grant advisor to public;
grant alter session to public;
grant create cluster to public;
grant create database link to public;
grant create dimension to public;
grant create evaluation context to public;
grant create external job to public;
grant create indextype to public;
grant create job to public;
grant create materialized view to public;
grant create operator to public;
grant create procedure to public;
grant create rule set to public;
grant create rule to public;
grant create sequence to public;
grant create session to public;
grant create synonym to public;
grant create table to public;
grant create trigger to public;
grant create type to public;
grant create view to public;
grant debug connect session to public;
grant execute_catalog_role to public;
grant global query rewrite to public;
grant query rewrite to public;
grant select any dictionary to public;
--
create user dst_user01 identified by Xpassword_01 account unlock;
alter user dst_user01 quota unlimited on users;
grant connect to dst_user01;


--