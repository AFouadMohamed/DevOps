#! /usr/bin/bash

ROOT_PASSWORD="admin123"


## Update your package list ##
sudo dnf update

## Install MariaDB ##
sudo dnf install mariadb105-server git -y

## Start and enable MariaDB ##
sudo systemctl start mariadb
sudo systemctl enable mariadb

## Clone Code ##
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project

# Set the root password and perform additional security steps
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;
EOF


## Create database and user, and grant privileges
sudo mysql -u root -padmin123 <<EOF
CREATE DATABASE IF NOT EXISTS accounts;
GRANT ALL PRIVILEGES ON accounts.* TO 'admin'@'%' IDENTIFIED BY 'admin123';
FLUSH PRIVILEGES;
EOF

## restore Backup ##
sudo mysql -u root -padmin123 accounts < src/main/resources/db_backup.sql

## Restart mariadb-server ##
sudo systemctl restart mariadb


