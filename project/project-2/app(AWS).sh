#! /usr/bin/bash


## install epel ##
sudo amazon-linux-extras install epel -y



sudo amazon-linux-extras install java-openjdk11 -y
sudo yum install -y git maven wget
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.75/bin/apache-tomcat-9.0.75.tar.gz
tar xzvf apache-tomcat-9.0.75.tar.gz


sudo useradd --home-dir /usr/local/tomcat --shell /sbin/nologin tomcat

cd apache-tomcat-9.0.75/
 sudo cp -r * /usr/local/tomcat/
 sudo chown -R tomcat.tomcat /usr/local/tomcat

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

sudo systemctl daemon-reload

sudo systemctl start tomcat
sudo systemctl enable tomcat


## Download Project ##
git clone -b main https://github.com/hkhcoder/vprofile-project.git
cd vprofile-project
mvn install
systemctl stop tomcat
 rm -rf /usr/local/tomcat/webapps/ROOT*
 cp target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
 systemctl start tomcat
 chown tomcat.tomcat /usr/local/tomcat/webapps -R
 systemctl restart tomcat


