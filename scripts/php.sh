# Installation des packets
apt-get -y install php7.2 php7.2-cli libapache2-mod-php7.2 php7.2-mysql php7.2-curl php7.2-json php7.2-gd php-msgpack php-memcached php7.2-intl php7.2-sqlite3 php7.2-gmp php-geoip php7.2-mbstring php7.2-xml php7.2-zip php7.2-bcmath php7.2-ldap php-redis php7.2-soap

# Configuration du module PHP pour apache
sed -i 's@;date.timezone =@date.timezone = Europe/Paris@' /etc/php/7.2/apache2/php.ini
sed -i 's@memory_limit = 128M@memory_limit = 256M@' /etc/php/7.2/apache2/php.ini

# Configuration de PHP CLI
sed -i 's@;date.timezone =@date.timezone = Europe/Paris@' /etc/php/7.2/cli/php.ini

# Installation de Composer
EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer
rm composer-setup.php
chmod +x /usr/local/bin/composer
composer --version
mkdir -p /home/vagrant/{.composer,.cache}
chown -R vagrant:vagrant /home/vagrant/.composer /home/vagrant/.cache
