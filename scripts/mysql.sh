wget --quiet https://dev.mysql.com/get/mysql-apt-config_0.8.5-1_all.deb
echo mysql-apt-config mysql-apt-config/select-server select mysql-5.6 | debconf-set-selections
DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.8.5-1_all.deb
apt-get update
echo mysql-community-server mysql-community-server/root-pass password vagrant | debconf-set-selections
echo mysql-community-server mysql-community-server/re-root-pass password vagrant | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
cd /usr/share/zoneinfo && ln -s Europe/Paris CEST
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot -pvagrant mysql
sed -i 's@bind-address\t\t= 127.0.0.1@bind-address\t\t= 0.0.0.0@' /etc/mysql/my.cnf
sed -i 's@^sql_mode@# sql_mode@' /usr/my.cnf
echo "GRANT ALL ON *.* to root@'%' IDENTIFIED BY 'vagrant';FLUSH PRIVILEGES;" | mysql -uroot -pvagrant
