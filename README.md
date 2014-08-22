# Xotelia Vagrant box

Sources to build our preconfigured *LAMP + Redis + Tools* Vagrant box.
Works fine with Symfony and Magento.

## Dependencies

Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads) and [packer](http://www.packer.io/downloads.html).

## Build

```
$ git clone git@bitbucket.org:xotelia/boxes.git
$ cd boxes
$ packer build template.json
```

## Specs

**Linux**
```
$ cat /etc/debian_version
7.6
```
```
$ cat /etc/timezone
Europe/Paris
```

**Apache**
```
$ apache2 -v
Server version: Apache/2.2.22 (Debian)
Server built:   Jun 16 2014 03:51:14
```

**MySQL**
```
$ mysqld --version
mysqld  Ver 5.5.38-0+wheezy1 for debian-linux-gnu on x86_64 ((Debian))
```
```
$ mysql --version
mysql  Ver 14.14 Distrib 5.5.38, for debian-linux-gnu (x86_64) using readline 6.2
```

**PHP**
```
$ php -v
PHP 5.4.4-14+deb7u12 (cli) (built: Jun 30 2014 13:15:11)
Copyright (c) 1997-2012 The PHP Group
Zend Engine v2.4.0, Copyright (c) 1998-2012 Zend Technologies
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
intl
json
libxml
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
Composer version 0ce0cf42e80d68f5cf5c766457536e2894e32ffc 2014-07-23 17:19:39
```
```
$ ansible --version
ansible 1.6.3
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
