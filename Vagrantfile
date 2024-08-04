Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true

 ### DB VM  #####
 config.vm.define "db01" do |db01|
  db01.vm.box = "eurolinux-vagrant/centos-stream-9"
  db01.vm.box_version = "9.0.43"
  db01.vm.hostname = "db01"
  db01.vm.network "private_network", ip: "192.168.56.15"
  db01.vm.provider "virtualbox" do |vb|
    vb.memory = "20248"
  end
end

### Memcache VM #####
config.vm.define "mc01" do |mc01|
  mc01.vm.box = "eurolinux-vagrant/centos-stream-9"
  mc01.vm.box_version = "9.0.43"
  mc01.vm.hostname = "mc01"
  mc01.vm.network "private_network", ip: "192.168.56.14"
  mc01.vm.provider "virtualbox" do |vb|
    vb.memory = "900"
  end
end

### TOMCAT VM  #####
config.vm.define "app01" do |app01|
  app01.vm.box = "eurolinux-vagrant/centos-stream-9"
  app01.vm.box_version = "9.0.43"
  app01.vm.hostname = "app01"
  app01.vm.network "private_network", ip: "192.168.56.12"
  app01.vm.provider "virtualbox" do |vb|
    vb.memory = "4096"
  end
end

### RabbitMQ  #####
config.vm.define "rmq01" do |rmq01|
  rmq01.vm.box = "eurolinux-vagrant/centos-stream-9"
  rmq01.vm.box_version = "9.0.43"
  rmq01.vm.hostname = "rmq01"
  rmq01.vm.network "private_network", ip: "192.168.56.13"
  rmq01.vm.provider "virtualbox" do |vb|
    vb.memory = "900"
  end
end

### Nginx  #####
config.vm.define "web01" do |web01|
  web01.vm.box = "ubuntu/jammy64"
  web01.vm.hostname = "web01"
  web01.vm.network "private_network", ip: "192.168.56.11"
  web01.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.gui = true
  end
end
end
