apt-get install -y php-xdebug

echo "xdebug.var_display_max_depth = 16" | tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.cli_color = 2" | tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.remote_enable = 1" | tee -a /etc/php/7.1/mods-available/xdebug.ini
echo "xdebug.remote_connect_back = 1" | tee -a /etc/php/7.1/mods-available/xdebug.ini

service apache2 restart
