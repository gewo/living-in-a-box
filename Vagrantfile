# coding: utf-8
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'saucy64-gewo1'
  config.vm.box_url = 'https://dl.dropboxusercontent.com/s/eaf6cljbs2zjj9h/saucy64-gewo1.box'
  # config.vm.host_name = 'lib.pwroff.de'
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    # vb.gui = true # Don't boot with headless mode
  end

  config.vm.provider :aws do |aws, override|
    aws.access_key_id             = ENV['AWS_ACCESS_KEY_ID']
    aws.secret_access_key         = ENV['AWS_SECRET_ACCESS_KEY']
    aws.keypair_name              = 'aws-dev-box' # ENV['AWS_KEYPAIR_NAME']
    aws.ami                       = 'ami-f5f51782' # saucy64 instance
    aws.availability_zone         = 'eu-west-1'
    aws.instance_type             = 'm1.small'
    override.ssh.private_key_path = 'aws-dev-box.pem'
    override.ssh.username         = 'ubuntu'
    override.vm.box               = 'dummy'
  end

  config.vm.provision :puppet do |puppet|
    puppet.module_path = 'modules'
    # puppet.options     = '--verbose --debug'
  end
end
