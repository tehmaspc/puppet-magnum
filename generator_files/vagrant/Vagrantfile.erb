# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.4.0"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # For 'magnum-vagrant' we acquire vagrant boxes from: http://puppet-vagrant-boxes.puppetlabs.com/
  config.vm.box = "magnum-vagrant"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-12042-x64-vbox4210.box"

  config.vm.provision :shell, :path => "./.vagrant_puppet/init.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "./.vagrant_puppet"
    puppet.manifest_file  = "init.pp"
    puppet.options = "--verbose"
  end

end
