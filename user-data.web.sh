#!/bin/bash
yum -y update && yum -y upgrade
yum install nginx -y
service nginx start
yum -y install git-core
