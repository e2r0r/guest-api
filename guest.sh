#!/bin/sh

PATH=/usr/local/bin:/usr/local/sbin:/bin:/usr/bin:/usr/sbin

PID=`ps --no-headers -A -o "vsz %cpu rss sz ucomm pid" | awk '{if ($1 > 200000 && $5 == "python") print $6}'`
TIMENOW=`date +"%F %T"`

if [ $PID > 0 ]; then
	kill -9 $PID && sleep 3
	spawn-fcgi -f /data/www/guest/code.fcgi -a 127.0.0.1 -p 8090 -C 8
	killall -HUP nginx
	echo "$TIMENOW restarted"
fi
