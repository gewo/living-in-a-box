# Docker Development Environment

A development environment for Rails applications using docker.

It runs native on Linux, on Mac OS X Vagrant is used for the docker
daemon.

## Requirements

* [Docker](http://www.docker.io/)
* [Vagrant](http://vagrantup.com/) (only on OSX)

### Install on OSX (using [Homebrew](http://brew.sh))

Musophobia? Read on:

```sh
brew tap phinze/homebrew-cask
brew install brew-cask
brew cask install virtualbox
brew cask install vagrant

# Install the native docker OSX client
brew tap homebrew/binary
brew install docker # yeah, go go go
```

### Install on Linux (Tested on [Ubuntu](http://www.ubuntu.com/))

```sh
# Install docker
curl -sL https://get.docker.io/ | sudo sh
sudo adduser $USER docker
```

## Install living-in-a-box

```sh
git clone https://github.com/gewo/living-in-a-box.git $HOME/.living-in-a-box
export PATH="~/.living-in-a-box/bin:$PATH" # you want to make this permanent
```

## Get started

First you want to start the background services, that is:

* redis
* mongodb
* mysql

On OSX a VirtualBox VM will be started for the docker daemon, which is
not available on OSX.

```sh
# On OSX the vagrant folder that will be shared with the host (and thus
# accessable from within docker) is your current folder.
cd /path/to/project

# Start it up. On the first run it will pull all the necessary images
# from the docker registry.
dev start
```

## Start developing

From your project folder just run:

```sh
dev shell
```

This will open a bash shell inside the docker container with the
background services linked to it. The `/mnt`-folder inside the container
is synced to your current path.

An example:

```
$ cd /path/to/project
$ dev shell
docker$ cd /mnt # equals /path/to/project on the host
docker$ bundle install
docker$ bundle exec rake db:create db:schema:load db:migrate db:seed
docker$ bundle exec rails server
docker$ exit
$
```

Data in the background-services will be persisted in
[Data Volumes](http://docs.docker.io/en/latest/use/working_with_volumes/).

## Commands

A few.

## TODO

A lot.
