#!/bin/bash
### RCLONE FOLDERNAME ###
oraesatta=`date "+%Y%m%d_%H%M%S"`
folder=aggi
opzioni="--config=/root/.config/rclone/rclone.conf --transfers=7 -v --tpslimit 1 --bwlimit 9M --drive-impersonate YOURIDENTITYMAIL@gmail.com --log-file /var/log/teamdrive-$folder"
ps ax |grep -v grep |grep GBackup-$folder:/
if [[ $? -ne 0 ]] ; then
        echo "Sync $folder Start:   $(date)" >> /var/log/teamdrive
        rclone $opzioni --exclude-from /root/.config/rclone/exclude.txt sync /var/lib/nethserver/ibay/$folder/ GBackup-$folder:/0/ --backup-dir="GBackup-$folder:/$oraesatta/" --suffix="-$oraesatta"
        rclone $opzioni sync GBackup-$folder:/0/ G$folder:/
        echo "Sync $folder End:     $(date)" >> /var/log/teamdrive
fi
