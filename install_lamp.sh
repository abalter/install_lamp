
### Create User
sudo adduser $1
sudo usermod -aG sudo $1

if [ -e ~/.ssh/authorized_keys ]; then
  echo "Current user (probably root) has .ssh/authorized keys"
  if [ ! -e /home/$1/.ssh ]; then 
    echo "new user $1 does not have .ssh directory"
    echo "creating /home/$1/.ssh"
    mkdir /home/$1/.ssh
  else
    echo "new user $1 already has .ssh directory"
  fi
  echo "Copying authorized keys"
  cp ~/.ssh/authorized_keys /home/$1/.ssh
  echo "setting permissions"
  chmod 700 /home/$1/.ssh
  chmod 644 /home/$1/authorized_keys
  chown -R $1 /home/$1/.ssh
  chgrp -R $1 /home/$1/.ssh
fi

### Update sources
sudo apt-get update
sudo apt-get full-upgrade

### Install LAMP
sudo apt-get install lamp-server^ phpmyadmin php-mbstring php-gettext
sudo phpenmod mcrypt
sudo phpenmod mbstring
sudo service apache2 restart

### Enable viewing of logs
sudo chmod -R 755 /var/log/apache2
sudo chmod -R 644 /var/log/apache2/*

### Create info.php for testing
echo "<?php phpinfo(); ?>" > /var/www/html/info.php
chmod 775 /var/www/html/info.php

### Enable Apache modules
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests
sudo service apache2 restart

### Create web environment
sudo groupadd www
sudo usermod -aG www $1:
sudo chmod -R 775 /var/www
sudo chgrp -R www /var/www

### Desktop stuff
sudo apt-get install openbox vnc4server

### Node
sudo apt-get install nodejs npm

### Set up user environment (not yet implemented)
# git clone <my-dot-files>
# bash my-dot-files/setup.sh
# git clone <my-vim-setup>
# cd <my-vim-files>
# bash my-vim-setup/setup.sh
# git clone <my-tmux-file>
# bash my-tmux-files/setup.sh
# git clone <my-conda-files>
# bash my-conda-files/setup.sh





