#!/bin/bash

. func_str

# Output increase Mac Address
# Usage : ./inc_mac.sh <Initial MAC_ADDRESS> <Increase COUNT>

MACADDR=$1
INCCNT=$2


for i in $(seq 1 $INCCNT); do

    CHKPOS=15
    DIGIT="00"
    while [ $DIGIT == "00" ]; do
        DIGIT=$((0x${MACADDR:$CHKPOS:2} + 1))
        DIGIT=`echo "obase=16;$DIGIT" | bc`

        if [ ${#DIGIT} -lt 2 ]; then
            DIGIT=0$DIGIT
        elif [ "$DIGIT" == "100" ]; then
            DIGIT=00
        fi

        MACADDR=`str_replace_pos $MACADDR $DIGIT $CHKPOS 2  `
        CHKPOS=`expr $CHKPOS - 3 `
    done
    echo $MACADDR



done


