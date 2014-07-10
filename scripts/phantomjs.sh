apt-get -y install fontconfig libfontconfig1 libfreetype6 libstdc++6
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
tar xfj phantomjs-1.9.7-linux-x86_64.tar.bz2 -C /home/vagrant
chown -R vagrant:vagrant /home/vagrant/phantomjs-1.9.7-linux-x86_64
echo "export PATH=$PATH:/home/vagrant/phantomjs-1.9.7-linux-x86_64/bin" >> /home/vagrant/.zshrc
