#! /usr/bin/bash

## Create files ##
touch host done

##  check all hosts ##
cat /etc/hosts > host
echo "Done all hosts - $(date +%F)" > done

## Update and upgrade ##
sudo apt update
sudo apt upgrade

## install nginx ##
sudo apt install nginx -y


## config nginx ##
sudo bash -c 'cat << EOF > /etc/nginx/sites-available/vproapp
upstream vproapp {
    server app01:8080;
}

server {
    listen 80;
    location / {
        proxy_pass http://vproapp;
    }
}
EOF'

## Create a symbolic link to enable the configuration  and rm defualt page and restart ngnix ##
sudo rm -rf /etc/nginx/sites-enabled/default
sudo ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/
sudo systemctl reload nginx


## Print finsh Job ##
  echo "NICE JOB YA BRO " >> done

