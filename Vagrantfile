# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine310"

  config.vm.provider "hyperv" do |h|
    h.memory = "512"
    h.vmname = File.read("configs/vmname")
  end
  
  config.vm.provision "shell" do |sh|
    sh.privileged = false
    sh.path = "scripts/provision-basics.sh"
  end

  config.vm.provision "shell" do |sh|
    sh.path = "scripts/provision-docker.sh"
  end
end
