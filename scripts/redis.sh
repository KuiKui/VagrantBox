apt-get -y install redis-server
sed -i 's@127.0.0.1@0.0.0.0@' /etc/redis/redis.conf
