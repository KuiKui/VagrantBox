apt-get -y install apache2
sed -i 's@User ${APACHE_RUN_USER}@User vagrant@' /etc/apache2/apache2.conf
sed -i 's@Group ${APACHE_RUN_GROUP}@Group vagrant@' /etc/apache2/apache2.conf
sed -i 's@/var/www@/vagrant@' /etc/apache2/sites-available/default
sed -i 's@AllowOverride None@AllowOverride All@' /etc/apache2/sites-available/default
a2enmod actions
usermod -aG adm vagrant
a2enmod rewrite
