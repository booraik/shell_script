#!/bin/sh

. ./func_str

ABC=`str_replace_pos ABCDEFG ZZZ 2 2`

echo $ABC
