apt-get -y install apache2
sed -i 's@User ${APACHE_RUN_USER}@User vagrant@' /etc/apache2/apache2.conf
sed -i 's@Group ${APACHE_RUN_GROUP}@Group vagrant@' /etc/apache2/apache2.conf

echo "" >> /etc/apache2/apache2.conf
echo "# Use this env variable in your code to add dev only features (debug, etc.)" >> /etc/apache2/apache2.conf
echo "SetEnv ENV_DEV true" >> /etc/apache2/apache2.conf
echo "SetEnv ENV_VAGRANT true" >> /etc/apache2/apache2.conf

cat <<EOF > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
        DocumentRoot /vagrant/web
        <Directory /vagrant/web>
                AllowOverride All
                Require all granted
        </Directory>
</VirtualHost>
EOF

usermod -aG adm vagrant

a2enmod actions
a2enmod rewrite
