#!/bin/sh
sudo apt update
sudo apt install nginx unzip -y
cd /tmp
wget https://www.free-css.com/assets/files/free-css-templates/download/page294/woody.zip
unzip woody.zip
sudo mv carpenter-website-template/ /var/www/html/woody
# Now navigate to http://<public-ip>/woody