#!/bin/sh

# 获取当前的日期和时间
current_time=$(date "+%Y-%m-%d %H:%M:%S")

# 在日志文件中记录备份开始的时间
echo "Backup started at $current_time"

# 备份文件名包含日期时间
BACKUP_FILENAME="${FILE_NAME}.sql"
echo "${MYSQL_HOST}" -u "${MYSQL_USER}" "${MYSQL_DATABASE}"
# 使用mysqldump进行备份
mysqldump -h "${MYSQL_HOST}" -P "${MYSQL_PORT}" -u "${MYSQL_USER}" -p"${MYSQL_PASSWORD}" "${MYSQL_DATABASE}" > "/backup/${BACKUP_FILENAME}"

echo "Backup completed: ${BACKUP_FILENAME}"
