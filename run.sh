#! /bin/sh
#
# run.sh
# Copyright (C) 2016-10-07 23:53 renothing <frankdot@qq.com>
#
# Distributed under terms of the Apache license.
#
sed -i "s|;\s*emergency_restart_threshold\s*=.*|emergency_restart_threshold =${FPM_RESTART_THRESHOLD}|i" /etc/php5/php-fpm.conf && \
sed -i "s|;\s*emergency_restart_interval\s*=.*|emergency_restart_interval =${FPM_RESTART_INTERVAL}|i" /etc/php5/php-fpm.conf && \
sed -i "s|;\s*process.max\s*=.*|process.max =${FPM_MAX}|i" /etc/php5/php-fpm.conf && \
sed -i "s|;*pm.max_children\s*=.*|pm.max_children =${FPM_MAX}|i" /etc/php5/php-fpm.conf && \
sed -i "s|;\s*pm.max_requests\s*=.*|pm.max_requests =${FPM_MAX_REQUESTS}|i" /etc/php5/php-fpm.conf && \
sed -i "s|;*request_terminate_timeout\s*=.*|request_terminate_timeout = ${PHP_MAX_EXECUTION}|i" /etc/php5/php-fpm.conf && \
sed -i "s|date.timezone\s*=.*|date.timezone = ${TIMEZONE}|i" /etc/php5/php.ini && \
sed -i "s|max_execution_time\s*=.*|max_execution_time = ${PHP_MAX_EXECUTION}|i" /etc/php5/php.ini && \
sed -i "s|memory_limit\s*=.*|memory_limit = ${PHP_MEMORY_LIMIT}|i" /etc/php5/php.ini && \
sed -i "s|upload_max_filesize\s*=.*|upload_max_filesize = ${PHP_MAX_UPLOAD_SIZE}|i" /etc/php5/php.ini && \
sed -i "s|max_file_uploads\s*=.*|max_file_uploads = ${PHP_MAX_UPLOAD}|i" /etc/php5/php.ini && \
sed -i "s|post_max_size\s*=.*|post_max_size = ${PHP_MAX_POST}|i" /etc/php5/php.ini && \
cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
echo "${TIMEZONE}" > /etc/timezone 
stat -c "%U" /var/www|grep -q www-data || chown www-data:www-data -R /var/www
/usr/bin/php-fpm -F
