#!/bin/sh

if [ ! -f "/pdns.sqlite3" ]
then
    sqlite3 /pdns.sqlite3 < /setup.sql
fi

/usr/sbin/pdns_server
