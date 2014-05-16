### Prérequis

Installer [Virtualbox](https://www.virtualbox.org/wiki/Downloads) et [packer](http://www.packer.io/downloads.html).

### Construction de la box

```
$ git clone git@bitbucket.org:xotelia/boxes.git
$ cd boxes
$ packer build template.json
```

### Ajout de la box a `vagrant`

```
$ vagrant box add xotelia xotelia.box
```
