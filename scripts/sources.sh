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

apt-get -y update
