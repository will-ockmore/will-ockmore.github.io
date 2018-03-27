#!/bin/bash
set -euo pipefail

# check for the url being set correctly in config
if [[ ! -z $(ag localhost _config.yml) ]]; then
  echo 'The url param is set to localhost in _config.yml - comment out the correct line!!'
  exit 1
fi

jekyll build
cp -r _site/** build/
cd build
git add .
git commit -m 'build'
git push dokku master
