# LAMP Vagrant box

Sources to build our preconfigured **LAMP** + **Redis** + **RabbitMQ** + **Tools** Vagrant box.

## Usage

This box is available on [Hashicorp Atlas](https://atlas.hashicorp.com/kuikui/boxes/modern-lamp).

To use it, juste add these lines to your `Vagrantfile` :

```
config.vm.box         = 'kuikui/modern-lamp'
config.vm.box_version = '>=2.3.0'
```

## Dependencies

Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) and [packer](http://www.packer.io/downloads.html).

## Build

```
$ git clone git@github.com:KuiKui/VagrantBox.git
$ cd VagrantBox
$ packer build template.json
```

For debug purpose :
```
$ PACKER_LOG=1 packer build template.json
```

## Test

```
$ vagrant box add kuikui-test kuikui-modern-lamp.box --force
$ vagrant up
```

## Usage

Add the new built box to vagrant :
```
$ vagrant box add kuikui kuikui-modern-lamp.box
```

And use the `box` instruction in your Vagrantfile to select the box :
```ruby
config.vm.box = "kuikui"
```

Use the [test Vagrantfile](Vagrantfile) at the root of your project or create your own, and launch vagrant :
```
$ vagrant up
$ vagrant ssh
```

Then :

* source files are in `/vagrant`
* Apache root directory is `/vagrant/web`
* MySQL is up with user `root` and password `vagrant`
* Redis is up on `127.0.0.1:6379`
* RabbitMQ is up with user `guest` and password `guest`

And :

* http server can be reached from local env at `http://localhost:8080`
* RabbitMQ web UI can be reached from local env at `http://localhost:15672`

## Specs

**Linux**
```
$ cat /etc/debian_version
9.3
```
```
$ cat /etc/timezone
Etc/UTC
```

**Apache**
```
$ sudo apache2 -v
Server version: Apache/2.4.25 (Debian)
Server built:   2017-09-19T18:58:57
```

**MySQL**
```
$ sudo mysqld --version
mysqld  Ver 5.6.39 for Linux on x86_64 (MySQL Community Server (GPL))
```
```
$ mysql --version
mysql  Ver 14.14 Distrib 5.6.39, for Linux (x86_64) using  EditLine wrapper
```

**PHP**
```
$ php -v
PHP 7.2.1-1+0~20180105151615.16+stretch~1.gbpd3910a (cli) (built: Jan  5 2018 15:16:17) ( NTS )
Copyright (c) 1997-2017 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2017 Zend Technologies
    with Zend OPcache v7.2.1-1+0~20180105151615.16+stretch~1.gbpd3910a, Copyright (c) 1999-2017, by Zend Technologies
    with Xdebug v2.6.0beta1, Copyright (c) 2002-2017, by Derick Rethans
```
```
$ php -m
[PHP Modules]
bcmath
calendar
Core
ctype
curl
date
dom
exif
fileinfo
filter
ftp
gd
geoip
gettext
gmp
hash
iconv
igbinary
intl
json
ldap
libxml
mbstring
mcrypt
memcached
msgpack
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
redis
Reflection
session
shmop
SimpleXML
soap
sockets
SPL
sqlite3
standard
sysvmsg
sysvsem
sysvshm
tokenizer
wddx
xdebug
xml
xmlreader
xmlwriter
xsl
Zend OPcache
zip
zlib

[Zend Modules]
Xdebug
Zend OPcache
```
```
memory_limit = 256M
date.timezone = Europe/Paris
```

**Redis**
```
$ redis-server --version
Redis server v=3.2.6 sha=00000000:0 malloc=jemalloc-3.6.0 bits=64 build=826601c992442478
```

**RabbitMQ**
```
$ sudo service rabbitmq-server status
...
RabbitMQ 3.6.14. Copyright (C) 2007-2017 Pivotal Software, Inc.
...
```

**Javascript**

```
$ node --version
v6.12.3
```

```
$ npm --version
5.6.0
```

```
$ gulp --version
CLI version 3.9.1
```

**Shell**
```
$ ps -p $$
  PID TTY          TIME CMD
 3371 pts/0    00:00:00 zsh
```

**Tools**
```
$ git --version
git version 2.11.0
```
```
$ composer --version
Composer version 1.6.2 2018-01-05 15:28:41
```
```
$ ansible --version
ansible 2.4.2.0
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/home/vagrant/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python2.7/dist-packages/ansible
  executable location = /usr/bin/ansible
  python version = 2.7.13 (default, Nov 24 2017, 17:33:09) [GCC 6.3.0 20170516]
```
```
$ phantomjs --version
2.1.1
```
```
$ htop --version
htop 2.0.2 - (C) 2004-2016 Hisham Muhammad
Released under the GNU GPL.
```
```
$ screen --version
Screen version 4.05.00 (GNU) 10-Dec-16
```

**Additional config**

An environmental variable `ENV_VAGRANT` is set to ease the development : use it to add dev only features (debug, etc.)

Just check this variable with PHP (works with CLI and Apache) :
```php
<?php
if (getenv('ENV_VAGRANT')) {
    doSomeVagrantThing();
}
```
