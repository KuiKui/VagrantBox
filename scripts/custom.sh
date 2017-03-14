apt-get -y install git-core htop vim screen fontconfig curl unzip tree

# Change timezone
echo "Europe/Paris" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Configure locale
debconf-set-selections <<< 'locales locales/locales_to_be_generated select en_US.UTF-8 UTF-8'
debconf-set-selections <<< 'locales locales/default_environment_locale select en_US.UTF-8'
dpkg-reconfigure -f noninteractive locales
update-locale LANG=en_US.UTF-8
update-locale LC_CTYPE=en_US.UTF-8
