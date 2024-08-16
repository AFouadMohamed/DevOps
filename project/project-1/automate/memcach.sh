#! /usr/bin/bash

## Create files ##
touch host done

##  check all hosts ##
cat /etc/hosts > host
echo "Done all hosts - $(date +%F)" > done

## Update OS ##
sudo yum update -y
echo "Done all update - $(date +%F)" >> done

## update repository ##
sudo yum install epel-release  -y
echo "repo's are  installed  - $(date +%F)" >> done

## Install, start & enable memcache on port 11211 ##
 sudo yum install memcached -y
 sudo systemctl enable memcached --now
 sudo systemctl status memcached
 sed -i 's/127.0.0.1/0.0.0.0/g' /etc/sysconfig/memcached
 sudo systemctl restart memcached
 echo " my system updated now $(date +%F)" > done 
 
## Configuration firewall ##
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-port=11211/tcp
sudo firewall-cmd --runtime-to-permanent
sudo firewall-cmd --add-port=11111/udp
sudo firewall-cmd --runtime-to-permanent
sudo memcached -p 11211 -U 11111 -u memcached -d
echo " config firewall is done  $(date +%F)" > done

## Print finsh Job ##
echo "NICE JOB YA BRO " >> done

