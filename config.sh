#!/usr/bin/env bash

export DEST_DIR="4clicks-pics"
export LAST_TIMESTAMP_FILE="last-timestamp"
export WAITING_TIME=60

if [ -d $DEST_DIR ]; then
    echo "Destination directory was finded"
elif [ -a $DEST_DIR ]; then
    echo "Destination directory isn't directory :<"
    exit 1
else
    mkdir $DEST_DIR
    echo "Destination directory was created"
fi
