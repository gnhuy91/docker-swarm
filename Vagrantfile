# -*- mode: ruby -*-
# vi: set ft=ruby :

IP_PREFIX = "10.100.192.20"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.linked_clone = true if Vagrant::VERSION =~ /^1.8/
  end
  # swarm nodes
  (1..2).each do |i|
    config.vm.define "swarm-node-#{i}" do |d|
      d.vm.hostname = "swarm-node-#{i}"
      d.vm.network "private_network", ip: "#{IP_PREFIX}#{i}"
    end
  end
  # swarm master
  config.vm.define "swarm-master" do |d|
    # run ansible playbook
    d.vm.provision :shell, path: "bootstrap_ansible.sh"
    d.vm.hostname = "swarm-master"
    d.vm.network "private_network", ip: "#{IP_PREFIX}0"
    # map Consul Web UI HTTP port with host machine
    # so we can visit localhost:8500/ui on host
    d.vm.network :forwarded_port, guest: 8500, host: 8500
  end
  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end
end
