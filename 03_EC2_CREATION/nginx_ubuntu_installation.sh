#!/bin/bash

sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx     
sudo  status nginx

echo "Nginx installation and setup completed successfully." > /var/www/html/index.html