#!/bin/sh
# Backup file to BACKUP_DIR what BACKUPLIST_FILE file
# Change backup directory everyday based date

BACKUP_DIR=/var/backup/
BACKUPLIST_FILE=/var/backup/backup_files.txt
DATE=`date "+%y%m%d"`
BACKUP_DIR_TODAY=$BACKUP_DIR$DATE

#make directory
if [ ! -e $BACKUP_DIR_TODAY ]; then
    mkdir $BACKUP_DIR_TODAY
fi

while read line
do
    if [ ${#line} -eq 0 ]; then
        continue;
    fi

    if [ ${line:0:1} = '#' ]; then
        continue;
    fi

    /bin/cp -f $line $BACKUP_DIR_TODAY/

done < $BACKUPLIST_FILE
