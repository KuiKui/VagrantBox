apt-get install -y php7.0-xdebug

ln -sf /etc/php/7.0/mods-available/xdebug.ini /etc/php/7.0/apache2/conf.d/20-xdebug.ini
ln -sf /etc/php/7.0/mods-available/xdebug.ini /etc/php/7.0/cli/conf.d/20-xdebug.ini

echo "xdebug.var_display_max_depth = 16" | tee -a /etc/php/7.0/mods-available/xdebug.ini
echo "xdebug.cli_color = 2" | tee -a /etc/php/7.0/mods-available/xdebug.ini
echo "xdebug.remote_enable = 1" | tee -a /etc/php/7.0/mods-available/xdebug.ini
echo "xdebug.remote_connect_back = 1" | tee -a /etc/php/7.0/mods-available/xdebug.ini

service apache2 restart
