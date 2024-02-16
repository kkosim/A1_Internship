#!/bin/bash

export ORACLE_SID=test101
expdp final1/final1 schemas=final1 directory=DATA_PUMP_DIR dumpfile=final1_backup.dmp logfile=final_backup.log


