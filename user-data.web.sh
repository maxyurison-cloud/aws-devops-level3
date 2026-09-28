#!/bin/bash
yum -y update && yum -y upgrade
yum install nginx -y
service nginx start
yum -y install git-core

cd /root
git clone https://github.com/nenemustafa/Hellome.git
rm -f /usr/share/nginx/html/*.html
cp Hellome/heyme /usr/share/nginx/html/index.html
