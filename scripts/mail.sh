# Installation des paquets
echo postfix postfix/mailname string packer-virtualbox-iso | debconf-set-selections
echo postfix postfix/main_mailer_type select Local only | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt-get -y install postfix dovecot-imap

# Configuration de postfix
postconf -e "home_mailbox = Maildir/"
postconf -e "mailbox_command ="

# Configuration de dovecot-imap
sed -i '@mail_location = mbox:~/mail:INBOX=/var/mail/%u@mail_location = maildir:~/Maildir@' /etc/dovecot/conf.d/10-mail.conf
maildirmake.dovecot /etc/skel/Maildir
maildirmake.dovecot /etc/skel/Maildir/.Drafts
maildirmake.dovecot /etc/skel/Maildir/.Sent
maildirmake.dovecot /etc/skel/Maildir/.Trash
maildirmake.dovecot /etc/skel/Maildir/.Templates
maildirmake.dovecot /etc/skel/Maildir/.Archive

# Configuration du user vagrant
cp -r /etc/skel/Maildir /home/vagrant
chown -r vagrant:vagrant /home/vagrant/Maildir
chmod 700 /home/vagrant/Maildir
