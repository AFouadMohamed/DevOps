#! /usr/bin/bash

## install epel ##
sudo amazon-linux-extras install epel -y


## install Erlang ##
sudo yum install erlang -y

## install rabbitmq server ##
sudo yum install rabbitmq-server -y
sudo systemctl start rabbitmq-server 
sudo systemctl enable rabbitmq-server 


## plugins list and install  ##
sudo rabbitmq-plugins list
sudo rabbitmq-plugins enable rabbitmq_management



## config and add user ##
 sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
 sudo rabbitmqctl add_user test test
 sudo rabbitmqctl set_user_tags test administrator

 ## restart services ##
 sudo systemctl restart rabbitmq-server
