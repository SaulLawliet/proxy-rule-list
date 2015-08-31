#!/bin/bash

file_name="list.txt"
sed '/\[AutoProxy]/d;/^$/d' $file_name |LC_ALL=c sort -u -o $file_name
if [[ "0" == `cat list.txt |wc -l` ]]; then
    echo -e "[AutoProxy]\n" > $file_name
else
    sed -i '1i [AutoProxy]\n' $file_name
fi

git add .
git status
git commit -m "nothing to say"
git push
