grant select, process, replication client, reload on *.* to 'pmm'@'%' identified by 'dba' WITH MAX_USER_CONNECTIONS 10;

grant all privileges on *.* to 'dba'@'%' identified by 'dba';

create database if not exists sbtest;

UPDATE performance_schema.setup_consumers
SET ENABLED = 'YES' WHERE NAME LIKE '%statements%';
SET GLOBAL innodb_monitor_enable = all;


