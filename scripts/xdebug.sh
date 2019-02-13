apt-get -y install php7.2-dev
pecl install xdebug-2.6.0beta1

cat <<EOF > /etc/php/7.2/mods-available/xdebug.ini
zend_extension=xdebug.so
xdebug.var_display_max_depth = 16
xdebug.cli_color = 2
xdebug.remote_enable = 1
; With virtualbox 10.0.2.2 is always the host IP
; > 10.0.2.2    Special alias to your host loopback interface (i.e., 127.0.0.1 on your development machine)
; It is better to set the host IP instead of enabling `remote_connect_back` because when debegugging CLI scripts
; Xdebug can't connect to any IP.
xdebug.remote_host = 10.0.2.2
xdebug.remote_connect_back = 0
xdebug.remote_autostart = 1
EOF

ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/cli/conf.d/20-xdebug.ini
ln -s /etc/php/7.2/mods-available/xdebug.ini /etc/php/7.2/apache2/conf.d/20-xdebug.ini

service apache2 restart
