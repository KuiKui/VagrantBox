sed -i 's@deb http://http.debian.net/debian wheezy main@deb http://http.debian.net/debian wheezy main contrib non-free@' /etc/apt/sources.list
sed -i 's@deb-src http://http.debian.net/debian wheezy main@deb http://http.debian.net/debian wheezy main contrib non-free@' /etc/apt/sources.list
apt-get -y update
apt-get -y install php5 php5-cli libapache2-mod-fastcgi php5-mysql php5-sqlite php5-intl php5-imagick php5-curl php-apc php5-xdebug php5-memcached php5-xsl php5-gd
echo "date.timezone = Europe/Paris" >> /etc/php5/cli/php.ini
echo "date.timezone = Europe/Paris" >> /etc/php5/fpm/php.ini
echo "xdebug.max_nesting_level = 250" >> /etc/php5/conf.d/xdebug.ini
sed -i 's@memory_limit = 128M@memory_limit = 512M@' /etc/php5/fpm/php.ini
sed -i 's@post_max_size = 8M@post_max_size = 12M@' /etc/php5/fpm/php.ini
sed -i 's@upload_max_filesize = 2M@upload_max_filesize = 10M@' /etc/php5/fpm/php.ini
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
