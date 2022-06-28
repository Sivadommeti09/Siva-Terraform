#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
yum -y install git
git clone https://github.com/Sivadommeti09/file.git /var/www/html/
systemctl restart httpd
