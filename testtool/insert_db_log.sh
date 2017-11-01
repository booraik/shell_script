#!/bin/sh

# Insert DataBase Log Tables
# Usage : ./insert_db_log.sh <MYSQL USER ID> <MYSQL USER PASSWORD> <INSERT COLUMNS COUNT> <INSERT COLUMN INTERVAL SECONDS>
# Example : ./insert_db_log.sh root  10000 5

MYSQLID=$1
MYSQLPWD=$2
COUNT=$3
INTERVAL=$4

DATE=`date +%s`
echo -n "Insert Columns...."
for i in $(seq 1 $COUNT); do 
echo -n .
cat << EOF | mysql -u$MYSQLID -p$MYSQLPWD
    INSERT INTO test_db.log_a(name,tel,time) VALUES (0,0,FROM_UNIXTIME($DATE));
    INSERT INTO test_db.log_b(name,tel,time) VALUES (0,0,FROM_UNIXTIME($DATE));
    INSERT INTO test_db.log_c(name,tel,time) VALUES (0,0,FROM_UNIXTIME($DATE));
EOF
DATE=`expr $DATE - $INTERVAL`

done 
echo ""
echo "$COUNT COLUMN INSERT DONE"

