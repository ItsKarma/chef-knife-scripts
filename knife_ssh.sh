#!/bin/bash
# This script allows you to execute any command (that you have permission to execute) via knife ssh
# - The host must exist, and you must have a valid user account on the host for this to work
# - Update the COMMAND line below with the command you would like to execute.

read -p "Enter SSH User: " USER
read -s -p "Enter SSH Password: " PASS

LOG="knife_ssh.log"
LOGOLD="knife_ssh.log.old"
LIST=$(sed ':a;N;$!ba;s/\n/ /g' hostlist)
COMMAND="sudo tail -30 /var/log/secure"

if [ -f $LOG ]
then
  mv $LOG $LOGOLD
fi

echo "Logging output..." > $LOG

for i in $LIST
do
  echo "" >> $LOG
  echo $i $COMMAND >> $LOG
  knife ssh "name:$i" "$COMMAND" --ssh-user $USER --ssh-password $PASS >> $LOG
done
