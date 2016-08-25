apt-get -y install git-core htop vim screen fontconfig curl unzip tree

# Change timezone
echo "Europe/Paris" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
