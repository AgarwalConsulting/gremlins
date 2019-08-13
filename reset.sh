#!/usr/bin/env bash

set -e

rm -rf .git/
rm -f name.txt
rm -f student-names.txt

git init
git add .
git commit -m "Init."
hub delete AgarwalConsulting/gremlins
hub create AgarwalConsulting/gremlins
git push -uf
