echo mysql-server-5.5 mysql-server/root_password password vagrant | debconf-set-selections
echo mysql-server-5.5 mysql-server/root_password_again password vagrant | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
cd /usr/share/zoneinfo && ln -s Europe/Paris CEST
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot -pvagrant mysql
sed -i 's@bind-address\t\t= 127.0.0.1@bind-address\t\t= 0.0.0.0@' /etc/mysql/my.cnf
echo "GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'vagrant';FLUSH PRIVILEGES;" | mysql -uroot -pvagrant
