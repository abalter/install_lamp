
### Create User
sudo adduser $1

### Update sources
apt-get update
apt-get full-upgrade

### Install LAMP
sudo apt-get install lamp-server^ phpmyadmin
sudo service apache2 restart

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





