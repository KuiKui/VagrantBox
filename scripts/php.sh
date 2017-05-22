# Installation des packets
apt-get -y install php7.1 php7.1-cli libapache2-mod-php7.1 php7.1-mysql php7.1-curl php7.1-json php7.1-gd php7.1-mcrypt php-msgpack php-memcached php7.1-intl php7.1-sqlite3 php7.1-gmp php-geoip php7.1-mbstring php7.1-xml php7.1-zip php7.1-bcmath php7.1-ldap php-redis php7.1-soap

# Configuration du module PHP pour apache
sed -i 's@;date.timezone =@date.timezone = Europe/Paris@' /etc/php/7.1/apache2/php.ini
sed -i 's@memory_limit = 128M@memory_limit = 256M@' /etc/php/7.1/apache2/php.ini

# Configuration de PHP CLI
sed -i 's@;date.timezone =@date.timezone = Europe/Paris@' /etc/php/7.1/cli/php.ini

# Installation de Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
composer --version
chown -R vagrant:vagrant /home/vagrant/.composer
