reference: https://hub.docker.com/rohitbasu77/oracle11g

## Connect to database

hostname: ..
port: 41521
sid: xe
username: system
password: oracle
Password for SYS & SYSTEM is oracle
Password for fareuser, searchuser, bookinguser, checkinuser is rohit123

## Login by SSH:

ssh root@host -p 40022
password: admin

## create table space

sqlplus

CREATE tablespace tlw
datafile '/u01/app/oracle/oradata/XE/tlw.dbf'
SIZE 100m
autoextend ON
NEXT 10m;

## create user
create user tlw identified by tlw default tablespace tlw;

## grant 
GRANT dba to tlw

## create table

CREATE TABLE TLW.NEWTABLE(
  COLUMN1 INTEGER
)
TABLESPACE TLW;
