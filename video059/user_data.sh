#!/bin/bash

# Update the operating system
sudo yum update -y

# Install Apache web server
sudo yum install -y httpd

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd

# Hello World in the index.html file
echo "<h1>Hello World from Fazle!</h1>" | sudo tee /var/www/html/index.html