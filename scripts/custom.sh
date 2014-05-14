apt-get -y install git htop vim screen

# Change timezone
echo "Europe/Paris" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata
