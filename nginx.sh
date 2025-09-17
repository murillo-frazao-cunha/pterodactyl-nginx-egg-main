#!/bin/bash
# [Setup] Load the PHP version from the file
PHP_VERSION=$(cat "/etc/enderd/php_version.txt")

# [Docker] Starting PHP-FPM with the specified PHP version
echo "[Docker] Starting PHP-FPM"
php-fpm$PHP_VERSION -c /etc/enderd/php/php.ini --fpm-config /etc/enderd/php/php-fpm.conf --daemonize

chmod g+s /etc/enderd/www

# [Docker] Starting NGINX
echo "[Docker] Starting NGINX"
echo "[Docker] Services successfully launched"

nginx -c /etc/enderd/nginx/nginx.conf -p /etc/enderd
