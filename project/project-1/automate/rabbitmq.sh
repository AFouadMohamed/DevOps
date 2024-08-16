#! /usr/bin/bash

## Create files ##
touch host done

##  check all hosts ##
cat /etc/hosts > host
echo "Done all hosts - $(date +%F)" > done

## update system ##
sudo yum update -y
echo "Update system - $(date +%F)" >> done

## Insatll repo ##
sudo yum install epel-release wget -y
echo "Install  repo - $(date +%F)" >> done

## Install and enable rabbitmq service ##
sudo dnf -y install centos-release-rabbitmq-38
sudo dnf --enablerepo=centos-rabbitmq-38 -y install rabbitmq-server
sudo systemctl enable rabbitmq-server --now 
echo "Rabbitmq and service are done - $(date +%F)" > done 


## RabbitMQ config ##
sudo sh -c 'echo "[{rabbit, [{loopback_users, []}]}]." > /etc/rabbitmq/rabbitmq.config'
sudo rabbitmqctl add_user test test
sudo rabbitmqctl set_user_tags test administrator# sudo systemctl restart rabbitmq-server
echo "CONF is done - $(date +%F)" > done 

## Configyration Firwall ##
 sudo systemctl start firewalld
 sudo systemctl enable firewalld
 sudo firewall-cmd --add-port=5672/tcp
 sudo firewall-cmd --runtime-to-permanent
 sudo systemctl start rabbitmq-server
 sudo systemctl enable rabbitmq-server
 sudo systemctl status rabbitmq-server
 echo "Firewall config - $(date +%F)" >> done

 ## Finsh JOB ##
 echo "Job Done - $(date +%F)" >> done
