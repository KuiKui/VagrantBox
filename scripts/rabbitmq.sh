apt-get -y install rabbitmq-server
rabbitmq-plugins enable rabbitmq_management
echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config
