# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  # sync folders, maybe we need to configure this
  config.vm.synced_folder "..", "/vagrant", type: "virtualbox"

  # Configure this too
  config.vm.network "forwarded_port", guest: 9000, host: 9000

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
    chef.add_recipe "ruby_rbenv::user"
    chef.add_recipe "ruby_rbenv::user_install"
    chef.add_recipe "vim"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "postgresql::client"
    chef.add_recipe "xslt"
    chef.add_recipe "cloudcli"
    chef.add_recipe "config_mysql"

    chef.json = {

      rbenv: {
        user_installs: [{
          user: 'ubuntu',
          rubies: ["2.1.10"],
          global: "2.1.10",

        }]
      }
    }
  end

  config.vm.provision "shell", inline: <<-SHELL
    #ssh-keyscan -H github.com >> ~/.ssh/known_hosts

    #pip install -q awscli
    #export DEBIAN_FRONTEND=noninteractive
    #sudo -E apt-get -qy install mysql-server
    #sudo apt install mysql-client
    # Nokogiri 1.4.7 requires this
    #sudo yum -y install libxslt-devel

    # /home/vagrant/.rbenv/bin/rbenv install 2.1.3
    #/home/vagrant/.rbenv/shims/gem install bundler
    #echo 'ln -s /vagrant/true-sql/true-sql /usr/local/bin/true-sql' >> ~/.bash_profile
    #echo 'source "/vagrant/true-sql/completion.bash"' >> ~/.bash_profile
  SHELL
end
