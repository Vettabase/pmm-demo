grant select, process, binlog monitor on *.* to 'pmm'@'%' identified by 'dba';
grant all privileges on *.* to 'dba'@'%' identified by 'dba';

create database sbtest;