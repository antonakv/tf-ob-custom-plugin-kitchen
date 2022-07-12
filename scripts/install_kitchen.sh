#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y rbenv ruby-build

# Installing ruby
rbenv install -l
rbenv install 2.6.6
rbenv local 2.6.6

# Installing kitchen
bundle install --path vendor/bundle

