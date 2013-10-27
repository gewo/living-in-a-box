# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box       = 'precise64.box'
  config.vm.box_url   = 'http://files.vagrantup.com/precise64.box'
  config.vm.host_name = 'rails-dev-box.boost-project.com'

  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # config.vm.synced_folder 'apps', '/apps'

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    # vb.gui = true # Don't boot with headless mode
  end

  config.vm.provision :puppet do |puppet|
    # puppet.manifests_path = 'manifests'
    # puppet.manifest_file  = 'default.pp'
    puppet.module_path = 'modules'
    # puppet.options     = '--verbose --debug'
  end
end
