#!/bin/bash
#/etc/pacman.d/hooks.bin/timeshift.sh
find "/mnt/System-Backups/timeshift/snapshots-ondemand" -mmin -60 | grep $(date +%Y-%m-%d)
if [ $? -eq 0 ]; then
    echo "timeshift backup canceled, time threshold not met"
else
    sudo -Hiu mohamedelsiddig /bin/sh -c 'DISPLAY=:0 notify-send "Timeshift_Backup_Beginning"'
        echo " "
            echo "Initiating Pre-Upgdate Timeshift Snapshot"
            echo " "
        echo "You have 10 seconds to cancel timeshift snapshot"
    /usr/bin/timeshift --create --comments "timeshift-pacman-hook-snapshot"
fi
exit
