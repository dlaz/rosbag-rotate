#!/usr/bin/env sh

BAG_DIR=$1
REMOTE_HOST=$2
REMOTE_DIR=$3

# rsync over all the files (let it try old files too)
rsync $BAG_DIR/*.bag $REMOTE_HOST:$REMOTE_DIR
status=$?

if test $status -eq 0
then
	# remove files older than one week
	find $BAG_DIR/* -mtime 7 -exec rm {} \;
else
	# something went wrong - send an email maybe
	exit 1;
fi
