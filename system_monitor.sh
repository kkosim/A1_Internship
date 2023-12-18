#!/bin/bash

echo "Disk space:"
df -h

echo "Top processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head

echo "Top CPU processes:"
top -b -n 1 | head -n 10

echo "Memory info:"
free -m