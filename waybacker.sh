#!/bin/bash

# trap ctrl-c and call ctrl_c()
trap ctrl_c INT

function ctrl_c() {
        cp -r web.archive.org/web/20*/htt*/* $1/ && rm -rf web.archive.org/
}

clear

mkdir $1
echo "Fetching... (It may take a long time, ctrl+c when you get tired)"
wget -q -e robots=off --mirror --domains=staticweb.archive.org,web.archive.org https://web.archive.org/web/0/$1

cp -r web.archive.org/web/20*/htt*/* $1/ && rm -rf web.archive.org/

echo
echo "Done!"
