curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get -y install nodejs
export npm_install=4.6.1
curl -L --insecure https://www.npmjs.org/install.sh | bash
npm install -g gulp
chown -R vagrant:vagrant /home/vagrant/.config
