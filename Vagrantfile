# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "doppel" do |config| 
    config.vm.box = "ubuntu/bionic64"

    config.vm.network "private_network", ip: "192.168.1.88"

    config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"
    config.vm.provision "file", source: ".", destination: "/home/vagrant/"
    config.vm.provision "shell", inline: <<-SHELL
      cat /home/vagrant/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys
      ln -s /usr/bin/python3.6 /usr/bin/python 

      bash /home/vagrant/wkstn-prov/install_ansible.sh

      (cd /home/vagrant/wkstn-prov/ ; ansible-playbook wkstn-prov.yml)
    SHELL
  end
end
