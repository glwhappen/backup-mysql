# 第一阶段：使用MySQL官方镜像
FROM mysql:8.0 as mysql

# 第二阶段：使用Alpine Linux
FROM alpine:latest

# 安装bash
RUN apk add --no-cache bash

# 从MySQL镜像中复制mysqldump到Alpine容器
COPY --from=mysql /usr/bin/mysqldump /usr/bin/mysqldump

# 创建一个目录来存放备份脚本和备份文件
WORKDIR /app

# 复制备份脚本和启动脚本到容器
COPY backup.sh /app/
COPY start.sh /app/
# 确保脚本可执行
RUN chmod +x /app/backup.sh 
RUN chmod +x /app/start.sh
# 设置环境变量
ENV MYSQL_HOST=mysql
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=password
ENV MYSQL_DATABASE=mydatabase
ENV FILE_NAME=backup
ENV MYSQL_PORT=3306
ENV BACKUP_SCHEDULE='@daily'

# 使用start.sh脚本启动容器
ENTRYPOINT ["/app/start.sh"]