#!/bin/bash

sed -i "s|PROXY_PREFIX|${PROXY_PREFIX}|" /etc/nginx/conf.d/nginx.conf;

if [ -e /data/data_pack.tar.gz ]
then
    cd /data
    tar xvfz data_pack.tar.gz
fi

if [ "x$KILL_MODE" != "x" ]
    then
        echo "Container started in kill mode, used for Galaxy IEs."
        /monitor_traffic.sh &
fi

supervisord
tail -f /var/log/supervisor/*
