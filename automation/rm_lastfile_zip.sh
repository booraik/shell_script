#!/bin/bash

for file in ./*
do
    if [[ "$file" =~ ".zip" ]]; then
        rmfile=`zip -sf "$file" | grep -v Total | tail -1`
        rmfile="$(echo -e "${rmfile}" | sed -e 's/^[[:space:]]*//')"
        zip -d -v "$file" "$rmfile"
    fi
done
