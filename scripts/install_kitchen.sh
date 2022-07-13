#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get -y install gnupg2

gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

\curl -sSL https://get.rvm.io | bash -s stable

sudo usermod -a -G rvm vagrant

source /etc/profile.d/rvm.sh

rvm install 2.7.6

rvm --default use 2.7.6

# Installing kitchen

cd /vagrant

bundle update --bundler

bundle install
