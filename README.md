# Rails Development Box

## What's in the box?

* Ubuntu 13.10 (saucy) base box
* RVM with ruby-2.0.0
* Gems: bundler, rake, rails
* MySQL
* Redis
* MongoDB
* node.js
* tmux, vim, zsh :-)

## Requirements

* [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](http://vagrantup.com/)

### Install on OSX (using [Homebrew](http://brew.sh))

Musophobia? Read on:

```sh
brew tap phinze/homebrew-cask
brew install brew-cask
brew cask install virtualbox
brew cask install vagrant
```

## Get started

```sh
git clone https://github.com/gewo/living-in-a-box.git
cd living-in-a-box
vagrant up # and get a coffee or two
vagrant ssh
```

The `/vagrant`-folder in the box is synced with the `living-in-a-box`-folder,
so you can edit/commit/... files locally using your favorite tools and
environment.

Have fun!
