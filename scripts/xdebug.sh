apt-get install -y php-xdebug

echo "xdebug.var_display_max_depth = 16" | tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.cli_color = 2" | tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.remote_enable = 1" | tee -a /etc/php/7.1/mods-available/xdebug.ini
# With virtualbox 10.0.2.2 is always the host IP
# > 10.0.2.2    Special alias to your host loopback interface (i.e., 127.0.0.1 on your development machine)
# It is better to set the host IP instead of enabling `remote_connect_back` because when debegugging CLI scripts
# Xdebug can't connect to any IP.
echo "xdebug.remote_host = 10.0.2.2" | tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.default_enable = 1" | tee -a /etc/php/7.1/mods-available/xdebug.ini

service apache2 restart
