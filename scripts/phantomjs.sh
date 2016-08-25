# Dependencies
apt-get -y install fontconfig libfontconfig1 libfreetype6 libstdc++6

# Download
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2

# Untar
tar xfj phantomjs-2.1.1-linux-x86_64.tar.bz2

# Copy
cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

# Change owner
chown -R vagrant:vagrant /usr/local/bin/phantomjs

# Clean
rm -rf phantomjs*
