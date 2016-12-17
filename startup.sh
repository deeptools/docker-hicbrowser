#!/bin/bash

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
