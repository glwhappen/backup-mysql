#!/bin/sh
echo "${BACKUP_SCHEDULE} /bin/sh /app/backup.sh"
# 创建crontab条目
echo "${BACKUP_SCHEDULE} /bin/sh /app/backup.sh >> /backup/cron.log 2>&1" | crontab -

# 启动cron服务
crond -f
