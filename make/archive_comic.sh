#!/bin/sh
## Archive comic image files. Must run working directory
## Usage: archive_comic.sh <Comic name> [First dir] [End dir] [Start count]

NAME_COMIC=$1
START=$2
END=$3
count=1

if [ $# -lt 1 ]; then
    echo "Usage: archive_comic.sh <Comic name> <Absolute path>"
    exit
fi
if [ $# -eq 2 ]; then
    if [ ! -d "$START" ]; then
        echo $START is not a directory or exist
        exit
    fi
    DO=false
else
    DO=true
fi
if [ $# -eq 3 ]; then
    if [ ! -d "$END" ]; then
        echo $END is not a directory or exist
        exit
    fi
fi
if [ $# -eq 4 ]; then
    count=$4
fi

mkdir tmp 2>/dev/null
for dir in *; do
## Directory check
    if [ ! -d "$dir" ]; then
        continue
    fi
## Except directory
    if [ "$dir" = "tmp" ]; then
        continue
    fi
## Start directory check
    if [ $DO = false ]; then
        if [ "$START" = "$dir" ]; then
            DO=true
        else
            continue
        fi
    fi

    echo zip "${NAME_COMIC}"_$(printf %02d $count) "$dir""/*"
    zip -r "${NAME_COMIC}"_$(printf %02d $count) "$dir"/*
    if [ $? != 0 ]; then
        echo "Error to archive : zip ${NAME_COMIC}_$(printf %02d $count) $dir/*"
        sleep 1000
    fi
    ((count+=1))
    mv "$dir" tmp/
    #rm "$dir" -r
    
## Reach $END directory, then end loop
    if [ ! -z "$END" ]; then
        if [ "$END" = "$dir" ]; then
            break
        fi
    fi
done
