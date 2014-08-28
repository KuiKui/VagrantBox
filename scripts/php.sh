# Installation des packets
apt-get -y install php5 php5-cli php5-mysql php5-sqlite php5-intl php5-imagick php5-curl php-apc php5-xdebug php5-memcached php5-xsl php5-gd php5-mcrypt php5-imap php-pear php5-dev

# Configuration du module PHP pour apache
sed -i 's@;date.timezone =@date.timezone = Europe/Paris@' /etc/php5/apache2/php.ini
sed -i 's@memory_limit = 128M@memory_limit = 256M@' /etc/php5/apache2/php.ini
sed -i 's@short_open_tag = On@short_open_tag = Off@' /etc/php5/apache2/php.ini

# Configuration de PHP CLI
sed -i 's@;date.timezone =@date.timezone = Europe/Paris@' /etc/php5/cli/php.ini
sed -i 's@memory_limit = 128M@memory_limit = 256M@' /etc/php5/cli/php.ini
sed -i 's@short_open_tag = On@short_open_tag = Off@' /etc/php5/cli/php.ini

# Installation de Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer

# Installation de mailparse
pecl install mailparse
echo "extension=mailparse.so" > /etc/php5/mods-available/mailparse.ini
cd /etc/php5/conf.d && ln -s ../mods-available/mailparse.ini 20-mailparse.ini

# Paramétrage divers
echo "xdebug.max_nesting_level = 250" >> /etc/php5/conf.d/xdebug.ini
