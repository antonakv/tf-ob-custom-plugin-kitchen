#!/usr/bin/env bash

cd /home/vagrant

go install github.com/petems/terraform-provider-extip@latest

mkdir -p /home/vagrant/.local/share/terraform/plugins/localproviders/petems/extip/0.1.2/linux_amd64

cp $GOPATH/bin/terraform-provider-extip /home/vagrant/.local/share/terraform/plugins/localproviders/petems/extip/0.1.2/linux_amd64

cd /vagrant

terraform init

terraform apply -auto-approve
