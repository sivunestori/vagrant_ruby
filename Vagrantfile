# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Run first:
  # vagrant box add kraksoft/debian-7.8-netinst https://github.com/kraksoft/vagrant-box-debian/releases/download/7.8.0/debian-7.8.0-amd64.box
  config.vm.box = "debian/jessie64"
  config.ssh.forward_x11 = true

  # grunt port
  config.vm.network "forwarded_port", guest: 3000, host: 3000, auto_correct: true

  # debugging port
  config.vm.network "forwarded_port", guest: 5858, host: 5858, auto_correct: true

  # rabbitmq management. http://lvh.me:15672/
  config.vm.network "forwarded_port", guest: 15672, host: 15672, auto_correct: true

  # private network
  config.vm.network "private_network", ip: "192.168.1.3", virtualbox__intnet: true

  # virtualbox parameters
  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  # provisioning shell: box installation
  config.vm.provision "shell", path: "ruby_box_provision.sh"

end
