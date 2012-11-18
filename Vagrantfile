# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.define :client do |client_config|
    #client_config.vm.box = 'centos-62-64-puppet'
    #client_config.vm.box_url = 'http://packages.vstone.eu/vagrant-boxes/centos/6.2/centos-6.2-64bit-puppet-vbox.4.1.12.box'
    client_config.vm.box = "lucid32"
    client_config.vm.network :hostonly, "33.33.33.10"
    client_config.vm.forward_port 80, 20080
    client_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "site.pp"
      puppet.module_path = "modules"
    end
  end

  config.vm.define :service do |service_config|
    service_config.vm.box = "lucid32"
    service_config.vm.network :hostonly, "33.33.33.11"
    service_config.vm.forward_port 80, 30080
    service_config.vm.provision :puppet do |puppet|
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "site.pp"
      puppet.module_path = "modules"
    end
  end

end
