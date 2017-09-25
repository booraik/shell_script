#!/bin/bash
#Usage: ./count.sh <file> <index>
FILE=${1:-access_log*}
INDEX=${2:-1}
cat $FILE | awk "{print $ $INDEX}" | sort |uniq -dc | sort -n
