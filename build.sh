#!/bin/bash
set -e

jekyll build
cp -r _site/** build/
