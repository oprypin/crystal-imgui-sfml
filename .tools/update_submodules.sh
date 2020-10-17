#!/bin/sh
cd "$(dirname "$0")/.."
git submodule status --recursive |
cut -c 2- |
awk '{ print "-e"; print "s|\\b[0-9a-f]+(\\.tar.+-C ?"$2")$|"$1"\\1|" }' |
xargs -d '\n' sed -E -i Makefile
