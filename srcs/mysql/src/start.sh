#!/bin/sh

rc default
mysql_install_db
rc-service mariadb setup
rc-service mariadb start
cat create_db | mysql -uroot
rc-service mariadb stop
supervisord -c /etc/supervisor.conf