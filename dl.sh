#!/usr/bin/env bash

source config.sh
source hlw.sh

while true; do
    pics=$(pagepics 1)

    if [ -s $LAST_TIMESTAMP_FILE ]; then
        timestamp=$(cat $LAST_TIMESTAMP_FILE)
        for pic in $pics; do
            picstamp=$(picdate $pic)
            if [[ $picstamp > $timestamp ]]; then
                wget -O $DEST_DIR/$picstamp".jpg" $pic 2> /dev/null
            else
                break
            fi
        done
    else
        for pic in $pics; do
            picstamp=$(picdate $pic)
            wget -O $DEST_DIR/$picstamp".jpg" $pic 2> /dev/null
        done
    fi

    pic=$(echo $pics | cut -d" " -f 1)
    picdate $pic > $LAST_TIMESTAMP_FILE

    sleep $WAITING_TIME
done
