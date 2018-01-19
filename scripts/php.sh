# Installation des packets
apt-get -y install php7.2 php7.2-cli libapache2-mod-php7.2 php7.2-mysql php7.2-curl php7.2-json php7.2-gd php-msgpack php-memcached php7.2-intl php7.2-sqlite3 php7.2-gmp php-geoip php7.2-mbstring php7.2-xml php7.2-zip php7.2-bcmath php7.2-ldap php-redis php7.2-soap

# Configuration du module PHP pour apache
sed -i 's@;date.timezone =@date.timezone = Europe/Paris@' /etc/php/7.2/apache2/php.ini
sed -i 's@memory_limit = 128M@memory_limit = 256M@' /etc/php/7.2/apache2/php.ini

# Configuration de PHP CLI
sed -i 's@;date.timezone =@date.timezone = Europe/Paris@' /etc/php/7.2/cli/php.ini

# Installation de Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
chmod +x /usr/local/bin/composer
composer --version
mkdir -p /home/vagrant/{.composer,.cache}
chown -R vagrant:vagrant /home/vagrant/.composer /home/vagrant/.cache
