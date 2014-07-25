#!/bin/sh

if [[ ! -f "/etc/horde/horde/conf.php" ]]; then
    cp -rp /etc/.horde/* /etc/horde/
    cp /etc/horde/horde/conf.php.dist /etc/horde/horde/conf.php
fi