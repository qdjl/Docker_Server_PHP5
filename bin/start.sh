#!/bin/sh

if [ "$1" = "shell" ]; then
/bin/bash
exit 0
fi

if [ ! -d "/app/log" ]; then
mkdir /app/log
fi

if [ ! -d "/run/php" ]; then
mkdir /run/php
fi


cron &
/usr/sbin/php5-fpm --nodaemonize -c /etc/php5/fpm/php.ini --fpm-config /etc/php5/fpm/php-fpm.conf
