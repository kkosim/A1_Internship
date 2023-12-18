#!/bin/bash

echo "User details: $(whoami)"

echo -e "\nThe records of user from /etc/passwd:"
grep "^$(whoami):" /etc/passwd

echo -e "\nLogin time:"
last -n 1 $(whoami)

echo -e "\nGroups:"
groups $(whoami)

echo "Home Directory contents:"
ls -la /home/$(whoami)

