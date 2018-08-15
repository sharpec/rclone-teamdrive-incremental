# rclone-teamdrive-incremental
Incremental Backup on Google Team Drive of Linux folder

For folder named AGGI in linux system, this script run an incrmenetal backup in a TEAM DRIVE with name Backup-aggi, then sync folder with TEAM DRIVE aggi (the real folder)
in Backup-aggi you find folder 0 for latest day file, and various folder date-based with file modify in that day

change absolute path of folder in script 

you need to create for any folder want to sync:
- script in rclone-sync-script
- teamdrive (real folder) shared with user
- teamdrive (backup folder) only for incremental backup

insert in crontab, for any folder

## cron for Gaggi
3 11 * * *  root /root/rclone-sync-script/aggi.sh
