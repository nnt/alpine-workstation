# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine310"

  config.vm.provider "hyperv" do |hyperv|
    hyperv.memory = "512"
  end
  
  config.vm.provision "shell" do |sh|
    sh.privileged = false
    sh.path = "provision-basics.sh"
  end

  config.vm.provision "shell" do |sh|
    sh.path = "provision-docker.sh"
  end
end
