#!/bin/bash
MYSQL_PWD=fischer
mysqldump -u root fischer_apps > /root/fischer_apps.sql
sed -i '/Dump completed on/d' /root/fischer_apps.sql

dos2unix /var/www/website/sql/settings.conf &>/dev/null
source /var/www/website/sql/settings.conf

if [ $recovery_mode == true ]; then

    cp /root/fischer_apps.sql /root/fischer_apps.sql.tmp
    mysql -u root fischer_apps < /root/fischer_apps.sql.bak
    mv /root/fischer_apps.sql.tmp /root/fischer_apps.sql.bak
    sed -i "s/\(recovery_mode *= *\).*/\1false/" /var/www/website/sql/settings.conf

    echo " ================================================================================="
    echo " |                     SQL Recovery Mode Flag Detected!                          |"
    echo " ================================================================================="
    echo " | Alright, I put your last version back in place.                               |"
    echo " ================================================================================="

elif [ $export_mine == true ]; then

    cat /root/fischer_apps.sql > /var/www/website/sql/fischer_apps.sql
    sed -i "s/\(export_mine *= *\).*/\1false/" /var/www/website/sql/settings.conf

    echo " "
    echo " ================================================================================="
    echo " |                       Database EXPORT flag detected                           |"
    echo " ================================================================================="
    echo " | Your fischer_apps.sql file has been overwritten.                              |"
    echo " | Be careful to commit stable changes. To revert this change before you commit  |"
    echo " | simply run git checkout sql/fischer_apps.sql                                  |"
    echo " ================================================================================="

    echo " I have already reset, export_mine=false "


else
    cmp -s /root/fischer_apps.sql /var/www/website/sql/fischer_apps.sql > /dev/null
    if [ $? -eq 1 ]; then
        echo " "
        echo " =============================================================================== "
        echo " |                          The DATABASE has changed!                          | "
        echo " =============================================================================== "
        if [ $update_always == true ]; then
            echo " |  The config says to always update from source                               | "
            update=true
        elif [ $update_next == true ]; then
            echo " | I see that update_next is set!                                              |"
             update=true
        else
            update=false
        fi

        sed -i "s/\(update_next *= *\).*/\1false/" /var/www/website/sql/settings.conf

        if [ $update == true ]; then
            cp /root/fischer_apps.sql /root/fischer_apps.sql.bak
            mysql -u root fischer_apps < /var/www/website/sql/fischer_apps.sql
            echo " | *Import complete*                                                           |"
            echo " | To undo this import set recovery_mode=true in your sql/settings.conf        |"
        else
            echo " | Your settings prevent me from updating your copy of the database right now. |"
            echo " | Modify sql/settings.conf to change this behavior. This script runs only     |"
            echo " | during vagrant up operations.                                               |"
        fi
            echo " ==============================================================================="
        echo " "
    else
        echo The database has not changed
    fi
fi