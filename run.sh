#!/usr/bin/env bash

if [[ -z $1 ]]
then
    TESTS_DIR=/usr/share/sysbench/
    echo "Using default test directory path of ${TESTS_DIR}"
fi

TABLES=16

COUNT=$(mariadb -udba -pdba -P 3307 -h 127.0.0.1 -NBe "select count(table_name) from information_schema.tables where table_schema='sbtest'")
echo "Existing tables count: ${COUNT}"

if [[ $COUNT -lt $TABLES ]]
then
    sysbench \
    --db-driver=mysql \
    --mysql-user=dba \
    --mysql_password=dba \
    --mysql-db=sbtest \
    --mysql-host=127.0.0.1 \
    --mysql-port=3307 \
    --tables=${TABLES} \
    --table-size=10000 \
    ${TESTS_DIR}/oltp_read_write.lua prepare
fi

sysbench --db-driver=mysql --mysql-user=dba --mysql_password=dba --mysql-db=sbtest --mysql-host=127.0.0.1 --mysql-port=3307 --tables=16 --table-size=10000 --threads=4 --time=0 --events=0 --report-interval=1 ${TESTS_DIR}/oltp_read_write.lua run
