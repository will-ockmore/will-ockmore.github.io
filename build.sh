#!/bin/bash
set -e

jekyll build
cp -r _site/** build/
cd build
git add .
git commit -m 'build'
git push dokku master
