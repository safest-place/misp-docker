#!/bin/bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
/etc/init.d/apache2 start
/etc/init.d/redis-server start
exec tail -f /dev/null

