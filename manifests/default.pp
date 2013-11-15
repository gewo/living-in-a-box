stage { 'preinstall': before => Stage['main'] }
class apt_get_update {
  exec { '/usr/bin/apt-get -y update':
    user => 'root',
  }
}
class { 'apt_get_update':
  stage => preinstall,
}

package { [
  # Base dependencies
  'build-essential', 'zlib1g-dev', 'libssl-dev', 'libreadline-dev',

  # Git
  'git',

  # Ruby
  'ruby', 'rubygems',

  # SQLite
  'sqlite3', 'libsqlite3-dev',

  # Nokogiri
  'libyaml-dev', 'libxml2', 'libxml2-dev', 'libxslt1-dev',

  # RMagick system dependencies
  'libmagickwand5', 'libmagickwand-dev',

  # Java (for Solr)
  # 'openjdk-7-jre',

  # ExecJS runtime
  'nodejs',

  # Redis
  'redis-server',

  # MongoDB
  'mongodb',

  # Dev Essentials :-)
  'tmux', 'vim-nox', 'zsh'

  ]:
  ensure => installed,
}

# MySQL
class install_mysql {
  class { '::mysql::server': }

  package { 'libmysqlclient15-dev':
    ensure => installed,
  }
}
include install_mysql

# RVM
class install_rvm {
  include rvm
  rvm::system_user { vagrant: ; }

  rvm_system_ruby {
    'ruby-2.0.0-p247':
      ensure      => 'present',
      default_use => false;
    # 'ruby-1.9.3-p448':
      # ensure => 'present',
      # default_use => false;
  }

  rvm_gem {
    'ruby-2.0.0-p247/bundler':
      ensure => latest,
      require => Rvm_system_ruby['ruby-2.0.0-p247'];
    'ruby-2.0.0-p247/rails':
      ensure => latest,
      require => Rvm_system_ruby['ruby-2.0.0-p247'];
    'ruby-2.0.0-p247/rake':
      ensure => latest,
      require => Rvm_system_ruby['ruby-2.0.0-p247'];
    # 'ruby-1.9.3-p448/bundler':
      # ensure => latest,
      # require => Rvm_system_ruby['ruby-1.9.3-p448'];
    # 'ruby-1.9.3-p448/rails':
      # ensure => latest,
      # require => Rvm_system_ruby['ruby-1.9.3-p448'];
    # 'ruby-1.9.3-p448/rake':
      # ensure => latest,
      # require => Rvm_system_ruby['ruby-1.9.3-p448'];
  }
}
include install_rvm

# vcsrepo { "/home/vagrant/.dotfiles":
  # ensure => latest,
  # provider => git,
  # source => 'https://github.com/gewo/dotfiles.git',
  # user => 'vagrant'
# }

# make zsh the default shell
# user { 'vagrant':
    # ensure  => present,
    # shell => '/usr/bin/zsh',
# }
