#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable
echo <html>"Hello from Fazle"</html> > /var/www/html/index.html