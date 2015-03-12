# Xotelia Vagrant box

Sources to build our preconfigured **LAMP** + **Redis** + **RabbitMQ** + **Postfix** + **Dovecot** + **Tools** Vagrant box.
Works fine with Symfony, Magento and custom frameworks.

## Dependencies

Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) and [packer](http://www.packer.io/downloads.html).

## Build

```
$ git clone git@github.com:Xotelia/VagrantBox.git
$ cd VagrantBox
$ packer build template.json
$ vagrant box add xotelia xotelia.box
```

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
mysqld  Ver 5.5.41-0+wheezy1 for debian-linux-gnu on x86_64 ((Debian))
```
```
$ mysql --version
mysql  Ver 14.14 Distrib 5.5.41, for debian-linux-gnu (x86_64) using readline 6.2
```

**PHP**
```
$ php -v
PHP 5.4.36-0+deb7u3 (cli) (built: Jan  9 2015 08:07:06)
Copyright (c) 1997-2014 The PHP Group
Zend Engine v2.4.0, Copyright (c) 1998-2014 Zend Technologies
    with Xdebug v2.2.1, Copyright (c) 2002-2012, by Derick Rethans
```
```
$ php -m
[PHP Modules]
apc
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
imap
intl
json
libxml
mailparse
mbstring
mcrypt
memcached
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
zip
zlib

[Zend Modules]
Xdebug
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
{rabbit,"RabbitMQ","3.4.4"},
...
```

**Ruby**
```
$ ruby --version
ruby 1.9.3p194 (2012-04-20 revision 35410) [x86_64-linux]
```

**Postfix**
```
$ postconf -d | grep mail_version
mail_version = 2.9.6
```

**Dovecot Imap**
```
$ dovecot --version
2.1.7
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
Composer version 1.0-dev (eadc167b121359986f542cc9cf976ecee3fcbf69) 2015-03-02 18:20:22
```
```
$ ansible --version
ansible 1.6.6
```
```
$ phantomjs --version
1.9.7
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

Some environmental variables are set in `/etc/apache2/apache2.conf` to ease the development :

* `SetEnv ENV_DEV true` : Use this custom env variable to add dev only features (debug, etc.)
* `SetEnv REDIRECT_MAGE_IS_DEVELOPER_MODE true` : Used by Magento to switch in dev mode

Check these variables with PHP :
```php
<?php
if (isset($_SERVER['ENV_DEV'])) {
    doSomeDevThing();
}
```

## Usage

Add the new built box to vagrant :
```
$ vagrant box add xotelia xotelia.box
```

Or use the `box` and `box_url` instructions in your Vagrantfile to download the box :
```ruby
config.vm.box = "xotelia"
config.vm.box_url = "http://boxes.xotelia.com/xotelia.box"
```

Put our [standard Vagrantfile]() at the root of your project or create your own, and launch vagrant :
```
$ vagrant up
$ vagrant ssh
```

Then :

* source files are in `/vagrant`
* mysql is up with user `root` and password `vagrant`
* redis is up on `127.0.0.1:6379`

And :

* http server can be reached from local env at `http://localhost:8080`
