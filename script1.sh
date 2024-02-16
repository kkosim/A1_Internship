#!/bin/bash

# 1. Declaring ORACLE_ALERT variable
#export ORACLE_ALERT=/u01/app/oracle/diag/rdbms/test101/test101/trace/alert_test101.log

# 2. Alert log of errors from last 12 hours
echo "---- Error log meassages from alert.log from last 12 hours ----"
echo $ORACLE_ALERT | grep -E "$(date -d '12 hours ago' '+%b %d %H:')|ORA-"

echo "---- Datafiles size ----"
sqlplus -s / as sysdba << EOF
col "File Name" format a50
col "Size (MB)" format 999,999,999
select file_name "File Name", round(bytes/1024/1024) "Size (MB)" from dba_data_files;
EOF

echo "---- Number and sizes of Archive logs ----"
sqlplus -s / as sysdba << EOF
col "Archive Logs" format 999,999
col "Size (MB)" format 999,999,999
select count(*) "Archive Logs", round(sum(blocks*block_size)/1024/1024) "Size (MB)" from v\$archived_log where deleted = 'NO';
EOF

echo "---- Database status ----"
sqlplus -s / as sysdba << EOF
select name, open_mode, log_mode, database_role from v\$database;
EOF
