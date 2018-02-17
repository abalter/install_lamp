# install_lamp
Script to install a LAMP server on a base ubuntu server

## Explanation
This script allows you to quickly and easily set up a LAMP servier with PHPMyadmin on a fresh 
Ubuntu DigitalOcean droplet. It has only been tested in Ubuntu 16.04 and later.

It may be possible to use on systems other than DigitalOcean. However, it assumes:

1. That you can set up your base install with an SSH key for the root user
1. That you want to create a regular user with sudo permissions and other stuff.

It would not be hard to remove these requirements. For instance, if you simply want to access the 
server using the root user and a password, you could remove any parts relating to configuring a
regular user.

Eventually, I'll get around to setting up argument parsing and create switches to customize the 
usage. And also copious commenting. In the mean time, it serves my purposes and may also server yours.

Maybe I should just put an explanation here, rather than lines and lines of comments. We'll see.

## Usage:
### Building your droplet
1. Make sure to set up your ssh key. This script is going to assume you have done that
  and will use the same ssh key for the regular user.

### Running the setup
1. Log into server as root
1. Install Git if necessary (My droplets seem to come with git, but no guarantees)

        sudo apt-get install git

1. Clone this repo. You will need to use https because the ssh token for git is not set up.
  (In fact, I can't even use my password. If I recall there is something that needs to be set up
  for ssh access to GitHub. I should check on that.)
    
        git clone https://github.com/abalter/install_lamp.git

1. Run the script, supplying the name of a regular user. The script will check for this, and exit
  if you don't supply one.
    
        bash install_lamp/install_lamp.sh <username>

1. Answer questions and provide passwords for mysql, etc.
  
**Code Summary**

```bash
sudo apt-get install git
git clone https://github.com/abalter/install_lamp.git
bash install_lamp/install_lamp.sh <username>
```

## To-Do

-[ ] Explain how each part works
-[ ] Add switches. For example:
  -[ ] Adding regular user
  -[ ] Creating www group
  -[ ] Using ssh key or password auth
  -[ ] Including other stuff like node
  -[ ] ...
-[ ] Check into GitHub https vs. ssh thing.
