#!/usr/bin/env bash

which go || {
  # make sure apt database is up-to date
  apt-get update

  # install golang
  apt-get install -y snapd
  snap install go --classic

  # set base
  # if we are in sudo use the calling user
  # we use eval as ~ won't be expanded
  if [ "${SUDO_USER}" ]; then
    BASE="`eval echo ~${SUDO_USER}`"
  else
    BASE="`eval echo ~`"
  fi

  PROFILE=${BASE}/.bash_profile
  touch ${PROFILE}
  
  grep 'GOROOT' ${PROFILE} &>/dev/null || {
    mkdir -p ${BASE}/go
    [ -f ${PROFILE} ] && cp ${PROFILE} ${PROFILE}.ori
    grep -v 'GOPATH|GOROOT' ${PROFILE}.ori | sudo tee -a ${PROFILE}
    echo 'export GOROOT=/snap/go/current' | sudo tee -a ${PROFILE}
    echo 'export PATH=$PATH:/snap/bin:$GOROOT/bin' | sudo tee -a ${PROFILE}
    echo 'export GOPATH=~/go' | sudo tee -a ${PROFILE}
  }

  if [ "${SUDO_USER}" ]; then
    [ -f ${PROFILE}.ori ] && chown ${SUDO_USER} ${PROFILE}.ori
    chown ${SUDO_USER} ${PROFILE}
  fi
}

sudo chown -R vagrant: /home/vagrant/go
#!/usr/bin/env bash

# pre-req
which apt-add-repository &>/dev/null || {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get install -y software-properties-common
}
# hashicorp repo
grep hashicorp /etc/apt/sources.list &>/dev/null || {
  export DEBIAN_FRONTEND=noninteractive
  curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
  apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  apt-get update
  apt-get install -y terraform
}
#!/usr/bin/env bash

cd /home/vagrant

mkdir -p /home/vagrant/go

export GOPATH=/home/vagrant/go

go install github.com/petems/terraform-provider-extip@latest

mkdir -p /home/vagrant/.local/share/terraform/plugins/localproviders/petems/extip/0.1.2/linux_amd64

cp $GOPATH/bin/terraform-provider-extip /home/vagrant/.local/share/terraform/plugins/localproviders/petems/extip/0.1.2/linux_amd64

cd /vagrant

rm -Rf .terraform*

terraform init

terraform apply -auto-approve
