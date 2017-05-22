echo 'deb http://httpredir.debian.org/debian jessie main contrib non-free' >> /etc/apt/sources.list
echo 'deb-src http://httpredir.debian.org/debian jessie main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://httpredir.debian.org/debian jessie-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb-src http://httpredir.debian.org/debian jessie-updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb http://security.debian.org/ jessie/updates main contrib non-free' >> /etc/apt/sources.list
echo 'deb-src http://security.debian.org/ jessie/updates main contrib non-free' >> /etc/apt/sources.list

apt-get -y install software-properties-common apt-transport-https lsb-release ca-certificates
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

wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list

apt-get -y update
