#!/usr/bin/env python
from crontab import CronTab
import sys, os

# script_dir = sys.argv[1]
script_dir = os.path.abspath(os.path.dirname(__file__))
bag_dir = os.path.abspath(os.path.expanduser(sys.argv[1]))
remote_host = sys.argv[2]
remote_dir = sys.argv[3]

cmd = os.path.join(script_dir, 'rotate.sh')+' '+bag_dir+' '+remote_host+' '+remote_dir
cron = CronTab(user=True)

job = cron.new(command=cmd)

# run the job every day at noon and midnight
job.hour.on(0)
job.hour.also.on(12)
job.minute.on(0)

cron.write()