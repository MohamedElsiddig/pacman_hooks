#!/bin/bash
#/etc/pacman.d/hooks.bin/killshot.sh
  echo "press any key to cancel timeshift snapshot"
      sleep 1
for (( i=9; i>0; i--)); do
    printf "\n$i seconds left to cancel snapshot  ... hit any key "
    read -s -n 1 -t 1 key
if [ $? -eq 0 ]; then
    sudo kill -2 `ps -ef|grep -i timeshift| grep -v grep| awk '{print $2}'`
        echo " "
            echo "aborting timeshift snapshot" 
      echo " "
   sudo -Hiu mohamedelsiddig /bin/sh -c 'DISPLAY=:0 notify-send "Timeshift_snapshot_aborted"'
fi
done
