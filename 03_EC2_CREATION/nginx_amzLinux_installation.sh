sudo yum upadte -y
sudo yum install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx

echo "Nginx installation and setup completed successfully." > /usr/share/nginx/html/index.html