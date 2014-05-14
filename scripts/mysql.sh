echo mysql-server-5.5 mysql-server/root_password password vagrant | debconf-set-selections
echo mysql-server-5.5 mysql-server/root_password_again password vagrant | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
