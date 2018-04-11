#!/bin/sh

## CUI dir size
#ncdu

## using du
#du -ah ./ | grep -v /$ | sort -h

## using find | xargs
#find . -type f -print0 | xargs -0 ls -lhrS

## using find | sort
#find . -type f -printf "%k\t%p\n" | sort -n |

## using find | du | sort
find -type f -exec du -sh {} + | sort -h
