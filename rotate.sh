#!/usr/bin/env sh

BAG_DIR = $1
REMOTE_HOST = $2
REMOTE_DIR = $3

# rsync over all the files (let it try old files too)
rsync $BAG_DIR/*.bag $REMOTE_HOST:$REMOTE_DIR

# remove files older than one week
find $BAG_DIR/* -mtime 7 -exec rm {} \;