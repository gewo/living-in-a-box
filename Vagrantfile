# vi: set ft=ruby :

# Vagrant box with docker and living-in-a-box.
#
# Based on (thanks):
#   https://github.com/flynn/flynn-dev/blob/master/Vagrantfile
#   https://github.com/dotcloud/docker/blob/master/Vagrantfile
VAGRANTFILE_API_VERSION = '2'

BOX_NAME = ENV['BOX_NAME'] || 'flynn-precise64'
BOX_URI = ENV['BOX_URI'] || 'https://s3.amazonaws.com/flynn/flynn-virtualbox-ubuntu_12.04.3-amd64.box'
BOX_CHECKSUM = ENV['BOX_CHECKSUM'] || 'd222d515e83e0d8a547c55f9e5cbaec703fd414f0d761193d9fee1c6066504cf'
BOX_CHECKSUM_TYPE = ENV['BOX_CHECKSUM_TYPE'] || 'sha256'

DOCKER_PORT = 4243
SHOW_GUI = !!ENV['SHOW_GUI'] || false
FORWARD_DOCKER_PORTS = ENV['FORWARD_DOCKER_PORTS']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = BOX_NAME
  config.vm.box_url = BOX_URI
  config.vm.box_download_checksum = BOX_CHECKSUM
  config.vm.box_download_checksum_type = BOX_CHECKSUM_TYPE
  config.vm.synced_folder './', '/vagrant'
  config.ssh.forward_agent = true

  config.vm.network :forwarded_port, host: DOCKER_PORT, guest: DOCKER_PORT

  unless FORWARD_DOCKER_PORTS.nil?
    (49_000..49_900).each do |port|
      config.vm.network :forwarded_port, host: port, guest: port
    end
  end

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
    vb.customize ['modifyvm', :id, '--memory', '2048']
    vb.customize ['modifyvm', :id, '--ioapic', 'on']
    vb.customize ['modifyvm', :id, '--cpus', '2']
    vb.gui = SHOW_GUI
  end

  config.vm.provision :shell, inline: <<-SCRIPT
    set -x
    user="$1"
    if [ -z "$user" ]; then
      user=vagrant
    fi

    # Install docker
    apt-key adv --keyserver keyserver.ubuntu.com \
      --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
    echo 'deb http://get.docker.io/ubuntu docker main' > \
      /etc/apt/sources.list.d/docker.list
    apt-get update -q
    apt-get install -q -y lxc-docker
    usermod -a -G docker "$user"

    sed -i -e \
      's/^[# ]*DOCKER_OPTS=.*/DOCKER_OPTS=\"-H unix:\\/\\/ -H tcp:\\/\\/0.0.0.0:4243\"/g' \
      /etc/default/docker
     service docker stop
     service docker start

    # Install living-in-a-box
    if [ ! -d /opt/living-in-a-box/ ]; then
      apt-get install -q -y git
      git clone https://github.com/gewo/living-in-a-box /opt/living-in-a-box
      ln -s -t /usr/local/bin /opt/living-in-a-box/bin/dev
    fi

    sudo -u vagrant sh -c "echo 'cd /vagrant' >> /home/vagrant/.bashrc"
    SCRIPT
end
