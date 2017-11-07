# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "harvardcatalyst/centos-6-rails"

  config.vm.synced_folder "..", "/vagrant", type: "rsync",
      rsync__exclude: ".git/"

  # enable this to use ssh agent on host machine
  config.ssh.forward_agent = true

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    ssh-keyscan -H github.com >> ~/.ssh/known_hosts

    pip install -q awscli

    #echo 'ln -s /vagrant/true-sql/true-sql /usr/local/bin/true-sql' >> ~/.bash_profile
    #echo 'source "/vagrant/true-sql/completion.bash"' >> ~/.bash_profile
  SHELL
end
