#!/bin/bash

file_name="list.txt"
sed '/\[AutoProxy]/d;/^$/d' $file_name |LC_ALL=c sort -u -o $file_name
if [[ "0" == $(cat $file_name |wc -l) ]]; then
    echo -e "[AutoProxy]\n" > $file_name
else
    sed -i '1i [AutoProxy]\n' $file_name
fi
