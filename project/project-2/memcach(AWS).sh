#! /usr/bin/bash

## Update your package index ##
sudo dnf update -y

## Install Memcached ##
sudo dnf install memcached -y

## Start and enable the Memcached service ##
sudo systemctl enable  memcached --now 

## config memchache ##
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/sysconfig/memcached

## restart services ##
sudo systemctl restart memcached
