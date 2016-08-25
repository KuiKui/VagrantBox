apt-get -y install zsh
sudo -u vagrant -H curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sudo -u vagrant -H sh
chsh -s $(which zsh) vagrant
sed -i 's@plugins=(git)@plugins=(git composer symfony2)@' /home/vagrant/.zshrc

# Add custom env variable
echo "export ENV_VAGRANT=1" >> .zshrc
