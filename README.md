# Docker Development Environment

A development environment for Rails applications using docker.

Tested on Linux and Mac OS X.

## Requirements

* [Docker](http://www.docker.io/)
* [VirtualBox](https://www.virtualbox.org//) (only on OSX)
* [boot2docker](http://boot2docker.io) (only on OSX)

### Install on OSX (using [Homebrew](http://brew.sh))

Musophobia? Read on:

    brew tap phinze/homebrew-cask
    brew install brew-cask
    brew cask install virtualbox
    brew cask install boot2docker
    brew install docker

### Install on Linux (Tested on [Ubuntu](http://www.ubuntu.com/) and [Fedora](http://fedoraproject.org/)

    # Install docker
    curl -sL https://get.docker.io/ | sudo sh
    sudo adduser $USER docker

## Install living-in-a-box

    git clone https://github.com/gewo/living-in-a-box.git $HOME/.living-in-a-box
    export PATH="~/.living-in-a-box/bin:$PATH" # you want to make this permanent

## Docker images

![Docker image dependencies](https://github.com/gewo/living-in-a-box/raw/master/dependencies.png "Docker image dependencies")

## Get started

First you want to start the background services, that is:

* redis
* mongodb
* mysql

On OSX a the boot2docker VM will be started for the docker daemon, which is
not available on OSX.

    # Start it up. On the first run it will pull all the necessary images
    # from the docker registry.
    dev start

## Start developing

From your project folder just run:

    dev shell

This will open a bash shell inside the docker container with the
background services linked to it. The `/mnt`-folder inside the container
is synced to your current path.

An example:

    $ cd /path/to/project
    $ dev shell
    docker$ cd /mnt # equals /path/to/project on the host
    docker$ bundle install
    docker$ bundle exec rake db:create db:schema:load db:migrate db:seed
    docker$ bundle exec rails server
    docker$ exit
    $

Data in the background-services will be persisted in
[Data Volumes](http://docs.docker.io/en/latest/use/working_with_volumes/).

## Environment Variables

### PORT

Normally the containers port is mapped to a random port on your host
machine. You can specify the `PORT` environment variable to use a fixed
one:

    $ dev shell             # port 3000 forwarded to 0.0.0.0:49157
    $ PORT=3456 dev shell   # port 3000 forwarded to 0.0.0.0:3456

### SYNC_DOTFILES

When setting `SYNC_DOTFILES=1` a few of your favorite dotfiles are
bind-mounted inside the container and your shell is set to zsh if that's
also your current `$SHELL`.

When you want to specify custom files that should be synced into your
containers home directory you can set the `DOTFILES` environment
variable.

    $ SYNC_DOTFILES=1 dev shell                    # sync default dotfiles
    $ SYNC_DOTFILES=1 DOTFILES=".ctags" dev shell  # sync your `~/.ctags`

### SHELL

Set the shell to use in your container.

    $ SHELL=fish dev shell
    docker <><

### EXTRA_ARGS

Sometimes you may want to pass additional arguments to the `docker run`
command.

Lets say you want to forward the Redis port to your local system:

    $ EXTRA_ARGS="--publish 127.0.0.1:9736:6379" dev shell
    docker$

    # another shell on your host
    $ redis-cli -p 9736 INFO | grep redis_version
    redis_version:2.6.15
    $

### RUBY_VER

Per default dev shell uses the gewo/ruby image.  Some guessing is done
to automatically find out the correct version of ruby from your Gemfile.
Sometimes you want to specify the version manually:

    $ RUBY_VER=1.9.3 dev shell
    docker$ ruby -v
    ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-linux]
    docker$

### IMAGE

The docker image. `IMAGE` by default is the latest ruby image.

    $ IMAGE=gewo/ruby:1.9.3 dev shell
    docker$ ruby -v
    ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-linux]
    docker$

### {MONGODB,REDIS,MYSQL}\_VER

Set version of background services on `dev start`

    $ # Run the mongodb server with image gewo/mongodb:2.4.10. Other images
    $ # use :latest per default.
    $ MONGODB_VER=2.4.10 dev start

## Commands

### shell

    dev shell [IMAGE]

`IMAGE` by default is the latest ruby image.

**Example**

    $ dev shell gewo/node
    docker$ nodejs -v
    v0.10.29
    docker$

## TODO

A lot.
