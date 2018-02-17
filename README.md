# install_lamp
Script to install a LAMP server on a base ubuntu server

## Usage:
1. Log into server as root
1. Install Git

        sudo apt-get install git

1. Clone this repo. You will need to use https because the ssh token is not set up.
    
        git clone https://github.com/abalter/install_lamp.git

1. Run the script, supplying the name of a regular user
    
        bash install_lamp/install_lamp.sh <username>

1. Answer questions and provide passwords for mysql, etc.
  
**Code Summary**

```bash
sudo apt-get install git
git clone https://github.com/abalter/install_lamp.git
bash install_lamp/install_lamp.sh <username>
```


