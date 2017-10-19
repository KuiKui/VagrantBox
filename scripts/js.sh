curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get -y install nodejs
npm install npm@latest -g
npm install -g gulp
chown -R vagrant:vagrant /home/vagrant/.config
