#!/bin/bash

wordlist="/wlist/all_words.txt"

while IFS= read -r word; do
    length=${#word}
    for (( i=0; i<$length; i++ )); do
        echo "${word:$i}"
    done
done < "$wordlist"
