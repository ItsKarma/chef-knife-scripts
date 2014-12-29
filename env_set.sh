#!/bin/bash

LOG="env_set.log"
LOGOLD="env_set.log.old"
LIST=$(sed ':a;N;$!ba;s/\n/ /g' hostlist)
ENV="your_environment"

if [ -f $LOG ]
then
  mv $LOG $LOGOLD
fi

echo "Logging output..." > $LOG

for i in $LIST
do
  echo "" >> $LOG
  echo $i >> $LOG
  knife node environment set $i $ENV >> $LOG
done
