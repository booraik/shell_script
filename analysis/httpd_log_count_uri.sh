#!/bin/bash
# Write file what URI request count from httpd access log
# Out file : $1.count

# Usage : ./parse_access_log.sh <Access Log>

date=`date '+%m%d%H%M'`

file=$1
out_file=$file"_"$date

echo "Parsing URL call from "$file" file"

#'{print$7}' : URI
awk '{print$7}' $file  \
    | grep -v \*  \
    | grep -v js$ \
    | grep -v gif$ \
    | grep -v css$ \
    | awk -F ? '{print$1}' \
    | awk -F , '{print$1}'  \
    | sort -u \
    | grep -v ^$ | grep -v /$ | grep -v /\"$ \
    > $out_file
echo "Create "$out_file" file"


while read line
do
    ret=`awk '{print$7}' $1 | grep "$line" | wc -l`
    ret+="\t$line"
    echo -n "."
    echo -e $ret >> $file"_tmp"
done < $out_file

sort -nr $file"_tmp" > $file".count"
echo ""
echo "Create "$file"_count file"

rm -rf $out_file
rm -rf $file"_tmp"

