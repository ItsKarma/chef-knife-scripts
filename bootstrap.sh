#!/bin/bash
# loops through hosts in a file called "hostlist" and will bootstrap them 1 by 1 using the username/pass/env/role provided.

read -p "Enter SSH User: " USER
read -s -p "Enter SSH Password: " PASS

BSLOG="bootstrap.log"
BSLOGOLD="bootstrap.log.old"
LIST=$(cat hostlist | sed ':a;N;$!ba;s/\n/ /g' )

if [ -f $BSLOG ]
then
  mv $BSLOG $BSLOGOLD
fi

echo "Logging output..." > $BSLOG

for i in $LIST
do
  echo "" >> $BSLOG
  echo $i >> $BSLOG
  knife bootstrap $i --ssh-user $USER --ssh-password $PASS --sudo --use-sudo-password -E prod -r "role[base]","role[apache]" >> $BSLOG
done
