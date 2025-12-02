# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/focal64"
    config.vm.box_check_update = false
    
    config.vm.define "consul_server" do |consul|
      consul.vm.hostname = "consul-server"
      consul.vm.network "private_network", ip: "192.168.56.13"
      consul.vm.network "forwarded_port", guest: 8500, host: 8500
      
      consul.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
        vb.name = "consul_server"
      end
    end
    
    config.vm.define "api" do |api|
      api.vm.hostname = "api"
      api.vm.network "private_network", ip: "192.168.56.14"
      api.vm.network "forwarded_port", guest: 8082, host: 8082
      
      api.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = 2
        vb.name = "api"
      end
    end
    
    config.vm.define "manager" do |manager|
      manager.vm.hostname = "manager"
      manager.vm.network "private_network", ip: "192.168.56.15"
      
      manager.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
        vb.name = "manager_consul"
      end
    end
    
    config.vm.define "db" do |db|
      db.vm.hostname = "db"
      db.vm.network "private_network", ip: "192.168.56.16"
      
      db.vm.provider "virtualbox" do |vb|
        vb.memory = "1024"
        vb.cpus = 1
        vb.name = "db"
      end
    end
end
