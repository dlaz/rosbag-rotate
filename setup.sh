#!/usr/bin/env sh

[ $# -lt 3 ] && { echo "Usage: $0 BAG_DIR REMOTE_HOST REMOTE_DIR"; exit 1; }


# grab my path
SCRIPT_DIR=$(readlink -f $0 | xargs dirname)

# load the config
BAG_DIR=$1
REMOTE_HOST=$2
REMOTE_DIR=$3

# setup the cron job for backing up the scripts
# sudo pip install -U python-crontab
python $SCRIPT_DIR/setup-cron.py $BAG_DIR $REMOTE_HOST $REMOTE_DIR