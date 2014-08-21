sed -i 's@deb http://http.debian.net/debian wheezy main@deb http://http.debian.net/debian wheezy main contrib non-free@' /etc/apt/sources.list
sed -i 's@deb-src http://http.debian.net/debian wheezy main@deb-src http://http.debian.net/debian wheezy main contrib non-free@' /etc/apt/sources.list

apt-get -y install python-software-properties
add-apt-repository -y 'deb http://ppa.launchpad.net/rquillo/ansible/ubuntu saucy main'

echo 'deb http://www.rabbitmq.com/debian/ testing main' > /etc/apt/sources.list.d/rabbitmq.list
wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
apt-key add rabbitmq-signing-key-public.asc

apt-get -y update
