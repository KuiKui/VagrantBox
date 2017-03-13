apt-get -y install git-core htop vim screen fontconfig curl unzip tree

# Change timezone
echo "Europe/Paris" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Configure locale
debconf-set-selections <<< 'locales locales/locales_to_be_generated select fr_FR.UTF-8 UTF-8'
debconf-set-selections <<< 'locales locales/default_environment_locale select fr_FR.UTF-8'
sed -i 's@# fr_FR.UTF-8@fr_FR.UTF-8@' /etc/locale.gen
dpkg-reconfigure -f noninteractive locales
update-locale LANG=fr_FR.UTF-8
update-locale LC_CTYPE=fr_FR.UTF-8
