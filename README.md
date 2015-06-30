# LAMP Vagrant box

Sources to build our preconfigured **LAMP** + **Redis** + **RabbitMQ** + **Tools** Vagrant box.

## Dependencies

Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) and [packer](http://www.packer.io/downloads.html).

## Build

```
$ git clone git@github.com:KuiKui/VagrantBox.git
$ cd VagrantBox
$ packer build template.json
```

## Test

```
$ vagrant box add kuikui-test kuikui.box --force
$ vagrant up
```

## Usage

Add the new built box to vagrant :
```
$ vagrant box add kuikui kuikui.box
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
7.8
```
```
$ cat /etc/timezone
Europe/Paris
```

**Apache**
```
$ apache2 -v
Server version: Apache/2.2.22 (Debian)
Server built:   Dec 23 2014 22:48:29
```

**MySQL**
```
$ mysqld --version
mysqld  Ver 5.5.43-0+deb7u1 for debian-linux-gnu on x86_64 ((Debian))
```
```
$ mysql --version
mysql  Ver 14.14 Distrib 5.5.43, for debian-linux-gnu (x86_64) using readline 6.2
```

**PHP**
```
$ php -v
PHP 5.6.10-1~dotdeb+7.3 (cli) (built: Jun 15 2015 07:22:09)
Copyright (c) 1997-2015 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2015 Zend Technologies
    with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2015, by Zend Technologies
    with Xdebug v2.3.3, Copyright (c) 2002-2015, by Derick Rethans

```
```
$ php -m
[PHP Modules]
bcmath
bz2
calendar
Core
ctype
curl
date
dba
dom
ereg
exif
fileinfo
filter
ftp
gd
gettext
hash
iconv
imagick
intl
json
libxml
mbstring
mcrypt
mhash
mysql
mysqli
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
readline
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
Redis server version 2.4.14 (00000000:0)
```

**RabbitMQ**
```
$ sudo service rabbitmq-server status
...
{rabbit,"RabbitMQ","3.5.3"},
...
```

**Ruby**
```
$ ruby --version
ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]
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
git version 1.7.10.4
```
```
$ composer --version
Composer version 1.0-dev (d0ff01698de0eb74e45ebe379b6ac8ccd5a6b0db) 2015-06-20 11:58:19
```
```
$ ansible --version
ansible 1.9.2
```
```
$ phantomjs --version
1.9.8
```
```
$ htop --version
htop 1.0.1 - (C) 2004-2011 Hisham Muhammad
Released under the GNU GPL.
```
```
$ screen --version
Screen version 4.01.00devel (GNU) 2-May-06
```

**Additional Apache config**

An environmental variable is set in `/etc/apache2/apache2.conf` to ease the development :

* `SetEnv ENV_DEV true` : Use this custom env variable to add dev only features (debug, etc.)

Check this variable with PHP :
```php
<?php
if (isset($_SERVER['ENV_DEV'])) {
    doSomeDevThing();
}
```
