#!/bin/sh

if [ ! -f "/data/pdns.sqlite3" ]
then
    sqlite3 /data/pdns.sqlite3 < /setup.sql
fi

/usr/sbin/pdns_server $@
