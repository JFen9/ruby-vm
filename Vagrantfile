# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  # sync folders, maybe we need to configure this
  config.vm.synced_folder "..", "/workspace/ruby", type: "virtualbox"
  config.vm.synced_folder "../../PycharmProjects", "/workspace/python", type: "virtualbox"

  # configure this
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.network "forwarded_port", guest: 5000, host: 5000
  config.vm.network "forwarded_port", guest: 1234, host: 61234, auto_correct: true

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
  end

  # enable this to use ssh agent on host machine
  config.ssh.forward_agent = true

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "my_cookbooks"]

    chef.add_recipe "apt"
    chef.add_recipe "build-essential"
    chef.add_recipe "ruby_build"
    chef.add_recipe "vim"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::client"

    # needed for Nokogiri 1.4
    chef.add_recipe "xslt"
    # aws console
    chef.add_recipe "cloudcli"
    # custom recipe to do post config
    chef.add_recipe "config_everything"
  end

  config.vm.provision "shell", inline: <<-SHELL

    sudo apt-get -qy install ntp
    sudo service ntp start
    sudo apt-get -qy install libsqlite3-dev
    sudo apt-get -qy install libcurl4-openssl-dev
  SHELL
end
