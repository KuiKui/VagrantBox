sed -i 's@deb http://http.debian.net/debian wheezy main@deb http://http.debian.net/debian wheezy main contrib non-free@' /etc/apt/sources.list
sed -i 's@deb-src http://http.debian.net/debian wheezy main@deb-src http://http.debian.net/debian wheezy main contrib non-free@' /etc/apt/sources.list

apt-get -y install python-software-properties
add-apt-repository -y 'deb http://ppa.launchpad.net/rquillo/ansible/ubuntu saucy main'

apt-get -y update
