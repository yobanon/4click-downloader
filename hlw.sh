#!/usr/bin/env zsh

host="http://4clicks.ru"
page="/ajax.php?page="

target="4clicklinks"

pagepics() {
    wget -O - $host$page$1 2> /dev/null \
    | grep -o "/data/uploads/thumbs/\(\w\|-\)\+.jpg"  \
    | sed 's:thumbs:original:' \
    | awk -v host=$host '{ print host $1 }'
}
