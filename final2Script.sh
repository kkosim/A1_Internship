#!/bin/bash

export ORACLE_SID=test102
expdp final2/final2 schemas=final2 directory=DATA_PUMP_DIR dumpfile=final2_backup.dmp logfile=final2_backup.log


