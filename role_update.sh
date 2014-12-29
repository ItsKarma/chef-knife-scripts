#!/bin/bash
# Script to update roles
# - if you want to remove a role, uncomment the 2 OLDROLE lines and change the role names as needed.

LOG="role_update.log"
LOGOLD="role_update.log.old"
LIST=$(sed ':a;N;$!ba;s/\n/ /g' hostlist)
#OLDROLE="role[your_old_role]"
NEWROLE="role[your_new_role]"

if [ -f $LOG ]
then
  mv $LOG $LOGOLD
fi

echo "Logging output..." > $LOG

for i in $LIST
do
  echo "" >> $LOG
  echo $i >> $LOG
#  knife node run_list remove $i "$OLDROLE" >> $LOG
  knife node run_list add $i "$NEWROLE" >> $LOG
done
