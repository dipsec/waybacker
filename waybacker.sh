#!/bin/bash

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        cp -r web.archive.org/web/*/*/* $dom/ && rm -rf web.archive.org/
}

clear
echo "Insert Domain:"
read dom

echo
mkdir $dom
echo "Fetching... (It may take a long time, ctrl+c when you get tired)"
wget -q -e robots=off --mirror --domains=staticweb.archive.org,web.archive.org https://web.archive.org/web/0/$dom

cp -r web.archive.org/web/*/*/* $dom/ && rm -rf web.archive.org/

echo
echo "Done!"
