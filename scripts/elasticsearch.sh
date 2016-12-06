apt-get -y install elasticsearch
service elasticsearch start
systemctl enable elasticsearch.service

# Install Head plugin
/usr/share/elasticsearch/bin/plugin --install mobz/elasticsearch-head
