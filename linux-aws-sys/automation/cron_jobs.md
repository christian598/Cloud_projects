### Setup Cron Jobs

## Edit crontab
crontab -e (will open a config file)

## Example of a backup script to run daily at 14.00
0 2 * * * /usr/bin/python3 /usr/local/bin/scripts/backup.py >> /var/log/backup/backup.log 2>&1

## List current cron-jobs
crontab -l