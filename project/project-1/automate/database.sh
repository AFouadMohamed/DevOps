#! /usr/bin/bash

ROOT_PASSWORD="admin123"


## change to root ##
##sudo -i


## Create files ##
touch host done

##  check all hosts ##
cat /etc/hosts > host
echo "Done all hosts - $(date +%F)" > done

## Update OS ##
sudo yum update -y
echo "Done all update - $(date +%F)" >> done

## set repository ##
sudo yum install epel-release git mariadb-server -y
echo "repo's are  installed  - $(date +%F)" >> done

## start and enabe servci ##
sudo systemctl enable mariadb --now
echo " service maridb is work now " >> done

## Clone Code ##
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
echo " git and folder id ready " >> done


# Set the root password and perform additional security steps
sudo mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';
FLUSH PRIVILEGES;
DELETE FROM mysql.user WHERE User='';
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;
EOF

echo "MariaDB root password has been set and security measures applied is done " >> done

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

## Configuration firewall ##
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
sudo firewall-cmd --reload
sudo systemctl restart mariadb

echo " Firewall now configuration - $(date +%F)" >> done 

## Print finsh Job ##
echo "NICE JOB YA BRO " >> done

