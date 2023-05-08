#!/bin/bash -xe

dnf -y install httpd
sudo chown ec2-user /var/www/html/
ln -s /etc/hostname /var/www/html/index.html 
sudo systemctl start httpd