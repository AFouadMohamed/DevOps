#! /usr/bin/bash

## Create files ##
 touch host done

##  check all hosts ##
 cat /etc/hosts > host
 echo "Done all hosts - $(date +%F)" > done


## Update OS ##
 sudo yum update -y
 echo "Done all update - $(date +%F)" >> done

## update and Install Repo ##
 sudo yum install epel-release java-11-openjdk java-11-openjdk-devel git maven wget -y
 echo "repo's & Update are installed  - $(date +%F)" >> done

## Download tomcat and extract file ##
 wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
 tar xzvf apache-tomcat-9.0.75.tar.gz
 echo "Tommcat is extract fine $(date +%F)" >> done

## add user tomcat ##
 sudo useradd --home-dir /usr/local/tomcat --shell /sbin/nologin tomcat
 echo "User is created " >> done

## copy file and set premession ##
 cd apache-tomcat-9.0.75/
 sudo cp -r * /usr/local/tomcat/
 sudo chown -R tomcat.tomcat /usr/local/tomcat
 echo "copy  & premession is doee " >> done 
 
## Create Tomcat service file ##
sudo bash -c 'cat << EOF > /etc/systemd/system/tomcat.service
[Unit]
Description=Tomcat
After=network.target

[Service]
User=tomcat
WorkingDirectory=/usr/local/tomcat
Environment=JRE_HOME=/usr/lib/jvm/jre
Environment=JAVA_HOME=/usr/lib/jvm/jre
Environment=CATALINA_HOME=/usr/local/tomcat
Environment=CATALINA_BASE=/usr/local/tomcat
ExecStart=/usr/local/tomcat/bin/catalina.sh run
ExecStop=/usr/local/tomcat/bin/shutdown.sh
SyslogIdentifier=tomcat-%i

[Install]
WantedBy=multi-user.target
EOF'

## Reload systemd to recognize the new service ##
sudo systemctl daemon-reload

## Enable and start the Tomcat service ##
sudo systemctl enable tomcat --now

## config firewall ##
sudo systemctl enable firewalld --now
sudo firewall-cmd --get-active-zones
sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
sudo firewall-cmd --reload
echo "Firewall is done " >> done

## Download Project ##
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project

## MVN Insatll ##
sudo mvn install
echo "MVN is ok " >> done

## Confug tomcat ##
sudo systemctl stop tomcat
sudo  rm -rf /usr/local/tomcat/webapps/ROOT*
sudo cp target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
sudo systemctl start tomcat
sudo chown tomcat.tomcat /usr/local/tomcat/webapps -R
sudo systemctl restart tomcat
echo "tomact config is done " >> done 

## Print finsh Job ##
  echo "NICE JOB YA BRO " >> done
