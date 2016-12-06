echo 'deb http://httpredir.debian.org/debian jessie main contrib non-free' >> /etc/apt/sources.list
echo 'deb-src http://httpredir.debian.org/debian jessie main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://httpredir.debian.org/debian jessie-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb-src http://httpredir.debian.org/debian jessie-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://security.debian.org/ jessie/updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb-src http://security.debian.org/ jessie/updates main contrib non-free' >> /etc/apt/sources.list

apt-get -y install software-properties-common
add-apt-repository -y 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu vivid main'

echo 'deb http://www.rabbitmq.com/debian/ testing main' > /etc/apt/sources.list.d/rabbitmq.list
wget https://www.rabbitmq.com/rabbitmq-release-signing-key.asc
apt-key add rabbitmq-release-signing-key.asc
rm rabbitmq-release-signing-key.asc

echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list.d/dotdeb.list
echo 'deb-src http://packages.dotdeb.org jessie all' >> /etc/apt/sources.list.d/dotdeb.list
wget https://www.dotdeb.org/dotdeb.gpg
apt-key add dotdeb.gpg
rm dotdeb.gpg

echo 'deb http://ftp.us.debian.org/debian wheezy-backports main' > /etc/apt/sources.list.d/npm.list

echo 'deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main' > /etc/apt/sources.list.d/java.list
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

echo 'deb http://packages.elastic.co/elasticsearch/1.7/debian stable main' > /etc/apt/sources.list.d/elasticsearch-1.7.list
wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -

apt-get -y update
