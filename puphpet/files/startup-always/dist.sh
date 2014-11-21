#!/bin/bash
echo "Generating DEVELOPER config for .dist files"

configdir="/var/www/vagrant/puphpet/files/dot/fischer_config"
web="/var/www/website"

if [ ! -f $web/web/index.php ]; then
    touch $web/web/index.php && cat $configdir/.index.php > $web/web/index.php
fi

if [ ! -f $web/yii ]; then
    touch $web/yii && cat $configdir/.yii > $web/yii
fi

if [ ! -f $web/config/db.php ]; then
    touch $web/config/db.php && cat $configdir/.db.php > $web/config/db.php
fi

if [ ! -f $web/config/ldap.php ]; then
    touch $web/config/ldap.php && cat $configdir/.ldap.php > $web/config/ldap.php
fi

if [ ! -f $web/sql/settings.conf ]; then
    touch $web/sql/settings.conf && cat $configdir/.settings.conf > $web/sql/settings.conf
fi

