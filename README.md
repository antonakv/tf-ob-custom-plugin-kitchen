# tf-ob-custom-plugin-kitchen
sample repo - using a custom plugin + kitchen test (gh repo)

## Intro
This manual is dedicated to apply kitchen test on the vagrant box with terraform code which is using custom provider.

Tested on Mac OS X.

## Requirements
- Oracle Virtualbox recent version installed
[VirtualBox installation manual](https://www.virtualbox.org/manual/ch01.html#intro-installing)

- Hashicorp vagrant recent version installed
[Vagrant installation manual](https://learn.hashicorp.com/tutorials/vagrant/getting-started-install)

- git installed
[Git installation manual](https://git-scm.com/download/mac)

- rbenv installed
[Rbenv installation manual](https://github.com/rbenv/rbenv#installation)

## Preparation 
- Clone git repository. 

```bash
git clone https://github.com/antonakv/tf-ob-custom-plugin-kitchen.git
```

Expected command output looks like this:

```bash
Cloning into 'tf-ob-custom-plugin-kitchen'...
remote: Enumerating objects: 12, done.
remote: Counting objects: 100% (12/12), done.
remote: Compressing objects: 100% (12/12), done.
remote: Total 12 (delta 1), reused 3 (delta 0), pack-reused 0
Receiving objects: 100% (12/12), done.
Resolving deltas: 100% (1/1), done.
```

- Change folder to tf-ob-custom-plugin-kitchen

```bash
cd tf-ob-custom-plugin-kitchen
```

- Install ruby 2.6.6 using rbenv

```bash
rbenv install -l
rbenv install 2.6.6
rbenv local 2.6.6 
```

Sample output

```bash
% rbenv install -l
2.5.8
2.6.6
2.7.2
3.0.0
jruby-9.2.14.0
mruby-2.1.2
rbx-5.0
truffleruby-21.0.0
truffleruby+graalvm-21.0.0

Only latest stable releases for each Ruby implementation are shown.
Use 'rbenv install --list-all / -L' to show all local versions.

➜  packer-ob-bionic64 git:(master) rbenv install 2.6.6
rbenv: /Users/aakulov/.rbenv/versions/2.6.6 already exists
continue with installation? (y/N) y
Downloading ruby-2.6.6.tar.bz2...
-> https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.6.tar.bz2
Installing ruby-2.6.6...
ruby-build: using readline from homebrew
Installed ruby-2.6.6 to /Users/aakulov/.rbenv/versions/2.6.6

% rbenv local 2.6.6 
%
```

- Install kitchen-test locally
```bash
bundle install
```

Expected result

```
% bundle install
Fetching gem metadata from https://rubygems.org/........
Fetching gem metadata from https://rubygems.org/.
Resolving dependencies....
Fetching concurrent-ruby 1.1.8
Installing concurrent-ruby 1.1.8
Fetching i18n 1.8.9
Installing i18n 1.8.9
Fetching minitest 5.14.4

[Skipped some messages]

Installing kitchen-inspec 2.4.1
Fetching kitchen-vagrant 1.8.0
Installing kitchen-vagrant 1.8.0
Bundle complete! 4 Gemfile dependencies, 180 gems now installed.
```

## Running kitchen test

- In the same folder you were before run 

```bash
bundle exec kitchen test
```

Expected output:

```bash
% bundle exec kitchen test
-----> Starting Test Kitchen (v3.3.1)
-----> Cleaning up any prior instances of <default-vbox-bionic64>
-----> Destroying <default-vbox-bionic64>...
       ==> default: Forcing shutdown of VM...
       ==> default: Destroying VM and associated drives...
       Vagrant instance <default-vbox-bionic64> destroyed.
       Finished destroying <default-vbox-bionic64> (0m5.15s).
-----> Testing <default-vbox-bionic64>
-----> Creating <default-vbox-bionic64>...
       Bringing machine 'default' up with 'virtualbox' provider...
       ==> default: Importing base box 'bionic64'...
==> default: Matching MAC address for NAT networking...
       ==> default: Setting the name of the VM: kitchen-tf-ob-custom-plugin-kitchen-default-vbox-bionic64-d2fbfd1b-652c-4d01-b85b-579f991f8981
       ==> default: Fixed port collision for 22 => 2222. Now on port 2200.
       ==> default: Clearing any previously set network interfaces...
       ==> default: Preparing network interfaces based on configuration...
           default: Adapter 1: nat
       ==> default: Forwarding ports...
           default: 22 (guest) => 2200 (host) (adapter 1)
       ==> default: Running 'pre-boot' VM customizations...
       ==> default: Booting VM...
       ==> default: Waiting for machine to boot. This may take a few minutes...
           default: SSH address: 127.0.0.1:2200
           default: SSH username: vagrant
           default: SSH auth method: private key
           default: 
           default: Vagrant insecure key detected. Vagrant will automatically replace
           default: this with a newly generated keypair for better security.
           default: 
           default: Inserting generated public key within guest...
           default: Removing insecure key from the guest if it's present...
           default: Key inserted! Disconnecting and reconnecting using new SSH key...
       ==> default: Machine booted and ready!
       ==> default: Checking for guest additions in VM...
       ==> default: Setting hostname...
       ==> default: Mounting shared folders...
           default: /vagrant => /Users/aakulov/Documents/Development/Hashicorp/tf-ob-custom-plugin-kitchen
       [SSH] Established
       Vagrant instance <default-vbox-bionic64> created.
       Finished creating <default-vbox-bionic64> (0m35.23s).
-----> Converging <default-vbox-bionic64>...
       Preparing files for transfer
       Preparing script
       Transferring files to <default-vbox-bionic64>
Get:1 http://mirrors.ubuntu.com/mirrors.txt Mirrorlist [1,061 B]
Get:5 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]    
Hit:2 http://mirror.transip.net/ubuntu/ubuntu bionic InRelease                 
Hit:6 https://apt.releases.hashicorp.com bionic InRelease                      
Get:3 https://nl.mirrors.clouvider.net/ubuntu bionic-updates InRelease [88.7 kB]
Get:7 http://security.ubuntu.com/ubuntu bionic-security/main amd64 Packages [2,327 kB]
Get:8 https://nl.mirrors.clouvider.net/ubuntu bionic-updates/main amd64 Packages [2,669 kB]
Get:4 http://archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]    
Get:9 http://security.ubuntu.com/ubuntu bionic-security/main i386 Packages [1,214 kB]
Get:10 http://security.ubuntu.com/ubuntu bionic-security/main Translation-en [405 kB]
Get:11 http://security.ubuntu.com/ubuntu bionic-security/restricted amd64 Packages [824 kB]
Get:12 http://security.ubuntu.com/ubuntu bionic-security/restricted Translation-en [113 kB]
Get:13 http://security.ubuntu.com/ubuntu bionic-security/universe amd64 Packages [1,213 kB]
Get:14 http://security.ubuntu.com/ubuntu bionic-security/universe i386 Packages [1,028 kB]
Get:15 http://security.ubuntu.com/ubuntu bionic-security/universe Translation-en [279 kB]
Get:16 https://nl.mirrors.clouvider.net/ubuntu bionic-updates/main i386 Packages [1,514 kB]
Get:17 https://nl.mirrors.clouvider.net/ubuntu bionic-updates/main Translation-en [494 kB]
Get:18 https://nl.mirrors.clouvider.net/ubuntu bionic-updates/restricted amd64 Packages [856 kB]
Get:19 https://nl.mirrors.clouvider.net/ubuntu bionic-updates/restricted Translation-en [118 kB]
Get:20 https://nl.mirrors.clouvider.net/ubuntu bionic-updates/universe amd64 Packages [1,828 kB]
Get:21 https://nl.mirrors.clouvider.net/ubuntu bionic-updates/universe i386 Packages [1,618 kB]
Get:22 https://nl.mirrors.clouvider.net/ubuntu bionic-updates/universe Translation-en [396 kB]
Fetched 17.1 MB in 4s (4,169 kB/s)                           
Reading package lists... Done
Reading package lists... Done
Building dependency tree       
Reading state information... Done
       The following additional packages will be installed:
         dbus-user-session liblzo2-2 squashfs-tools
       Suggested packages:
         zenity | kdialog
       Recommended packages:
         gnupg
       The following NEW packages will be installed:
         dbus-user-session liblzo2-2 snapd squashfs-tools
       0 upgraded, 4 newly installed, 0 to remove and 4 not upgraded.
       Need to get 35.8 MB of archives.
       After this operation, 151 MB of additional disk space will be used.
Get:1 http://mirrors.ubuntu.com/mirrors.txt Mirrorlist [1,061 B]
Get:4 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 squashfs-tools amd64 1:4.3-6ubuntu0.18.04.4 [111 kB]
Get:5 http://archive.ubuntu.com/ubuntu bionic-updates/main amd64 snapd amd64 2.55.5+18.04 [35.6 MB]
Get:3 http://mirrors.evoluso.com/ubuntu bionic-updates/main amd64 dbus-user-session amd64 1.12.2-1ubuntu1.3 [9,392 B]
Get:2 https://mirrors.xtom.nl/ubuntu bionic/main amd64 liblzo2-2 amd64 2.08-1.2 [48.7 kB]
Fetched 35.8 MB in 5s (6,528 kB/s)                                   
       Selecting previously unselected package liblzo2-2:amd64.
(Reading database ... 100206 files and directories currently installed.)
       Preparing to unpack .../liblzo2-2_2.08-1.2_amd64.deb ...
       Unpacking liblzo2-2:amd64 (2.08-1.2) ...
       Selecting previously unselected package dbus-user-session.
       Preparing to unpack .../dbus-user-session_1.12.2-1ubuntu1.3_amd64.deb ...
       Unpacking dbus-user-session (1.12.2-1ubuntu1.3) ...
       Selecting previously unselected package squashfs-tools.
       Preparing to unpack .../squashfs-tools_1%3a4.3-6ubuntu0.18.04.4_amd64.deb ...
       Unpacking squashfs-tools (1:4.3-6ubuntu0.18.04.4) ...
       Selecting previously unselected package snapd.
       Preparing to unpack .../snapd_2.55.5+18.04_amd64.deb ...
       Unpacking snapd (2.55.5+18.04) ...
       Setting up dbus-user-session (1.12.2-1ubuntu1.3) ...
       Setting up liblzo2-2:amd64 (2.08-1.2) ...
       Setting up squashfs-tools (1:4.3-6ubuntu0.18.04.4) ...
       Setting up snapd (2.55.5+18.04) ...
       Created symlink /etc/systemd/system/multi-user.target.wants/snapd.apparmor.service → /lib/systemd/system/snapd.apparmor.service.
       Created symlink /etc/systemd/system/multi-user.target.wants/snapd.autoimport.service → /lib/systemd/system/snapd.autoimport.service.
       Created symlink /etc/systemd/system/multi-user.target.wants/snapd.core-fixup.service → /lib/systemd/system/snapd.core-fixup.service.
       Created symlink /etc/systemd/system/multi-user.target.wants/snapd.recovery-chooser-trigger.service → /lib/systemd/system/snapd.recovery-chooser-trigger.service.
       Created symlink /etc/systemd/system/multi-user.target.wants/snapd.seeded.service → /lib/systemd/system/snapd.seeded.service.
       Created symlink /etc/systemd/system/cloud-final.service.wants/snapd.seeded.service → /lib/systemd/system/snapd.seeded.service.
       Created symlink /etc/systemd/system/multi-user.target.wants/snapd.service → /lib/systemd/system/snapd.service.
       Created symlink /etc/systemd/system/timers.target.wants/snapd.snap-repair.timer → /lib/systemd/system/snapd.snap-repair.timer.
       Created symlink /etc/systemd/system/sockets.target.wants/snapd.socket → /lib/systemd/system/snapd.socket.
       Created symlink /etc/systemd/system/final.target.wants/snapd.system-shutdown.service → /lib/systemd/system/snapd.system-shutdown.service.
       snapd.failure.service is a disabled or a static unit, not starting it.
       snapd.snap-repair.service is a disabled or a static unit, not starting it.
       Processing triggers for dbus (1.12.2-1ubuntu1.3) ...
       Processing triggers for mime-support (3.60ubuntu1) ...
       Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
       Processing triggers for libc-bin (2.27-3ubuntu1.6) ...
2022-07-13T09:26:39Z INFO Waiting for automatic snapd restart...
go 1.18.3 from Michael Hudson-Doyle (mwhudson) installed
       export GOROOT=/snap/go/current
       export PATH=$PATH:/snap/bin:$GOROOT/bin
       export GOPATH=~/go
       go: downloading github.com/petems/terraform-provider-extip v0.1.2
       go: downloading github.com/hashicorp/terraform-plugin-sdk v1.7.0
       go: downloading github.com/hashicorp/go-hclog v0.9.2
       go: downloading github.com/hashicorp/go-plugin v1.0.1
       go: downloading github.com/zclconf/go-cty v1.2.1
       go: downloading google.golang.org/grpc v1.23.0
       go: downloading github.com/hashicorp/go-uuid v1.0.1
       go: downloading github.com/agext/levenshtein v1.2.2
       go: downloading github.com/hashicorp/errwrap v1.0.0
       go: downloading github.com/hashicorp/go-multierror v1.0.0
       go: downloading github.com/hashicorp/go-version v1.2.0
       go: downloading github.com/hashicorp/hcl/v2 v2.0.0
       go: downloading github.com/hashicorp/hcl v1.0.0
       go: downloading github.com/mitchellh/copystructure v1.0.0
       go: downloading github.com/mitchellh/reflectwalk v1.0.1
       go: downloading github.com/mitchellh/mapstructure v1.1.2
       go: downloading golang.org/x/net v0.0.0-20191009170851-d66e71096ffb
       go: downloading github.com/hashicorp/go-getter v1.4.0
       go: downloading github.com/hashicorp/terraform-svchost v0.0.0-20191011084731-65d371908596
       go: downloading github.com/mitchellh/cli v1.0.0
       go: downloading golang.org/x/crypto v0.0.0-20190820162420-60c769a6c586
       go: downloading github.com/golang/protobuf v1.3.2
       go: downloading github.com/hashicorp/yamux v0.0.0-20181012175058-2f1d1f20f75d
       go: downloading github.com/mitchellh/go-testing-interface v1.0.0
       go: downloading github.com/oklog/run v1.0.0
       go: downloading golang.org/x/text v0.3.2
       go: downloading github.com/vmihailenco/msgpack v4.0.1+incompatible
       go: downloading github.com/apparentlymart/go-textseg v1.0.0
       go: downloading github.com/mitchellh/go-wordwrap v1.0.0
       go: downloading github.com/spf13/afero v1.2.2
       go: downloading github.com/zclconf/go-cty-yaml v1.0.1
       go: downloading cloud.google.com/go v0.45.1
       go: downloading github.com/aws/aws-sdk-go v1.25.3
       go: downloading github.com/bgentry/go-netrc v0.0.0-20140422174119-9fd32a8b3d3d
       go: downloading github.com/hashicorp/go-cleanhttp v0.5.1
       go: downloading github.com/hashicorp/go-safetemp v1.0.0
       go: downloading github.com/mitchellh/go-homedir v1.1.0
       go: downloading github.com/ulikunitz/xz v0.5.5
       go: downloading google.golang.org/api v0.9.0
       go: downloading golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45
       go: downloading github.com/armon/go-radix v1.0.0
       go: downloading github.com/bgentry/speakeasy v0.1.0
       go: downloading github.com/fatih/color v1.7.0
       go: downloading github.com/mattn/go-isatty v0.0.5
       go: downloading github.com/posener/complete v1.2.1
       go: downloading google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55
       go: downloading golang.org/x/sys v0.0.0-20190804053845-51ab0e2deafa
       go: downloading github.com/apparentlymart/go-cidr v1.0.1
       go: downloading github.com/google/uuid v1.1.1
       go: downloading github.com/googleapis/gax-go/v2 v2.0.5
       go: downloading github.com/mattn/go-colorable v0.1.1
       go: downloading github.com/google/go-cmp v0.3.1
       go: downloading go.opencensus.io v0.22.0
       go: downloading github.com/jmespath/go-jmespath v0.0.0-20180206201540-c2b33e8439af
       go: downloading github.com/hashicorp/golang-lru v0.5.1
       
       Initializing the backend...
       
       Initializing provider plugins...
       - Finding localproviders/petems/extip versions matching "0.1.2"...
       - Installing localproviders/petems/extip v0.1.2...
       - Installed localproviders/petems/extip v0.1.2 (unauthenticated)
       
       Terraform has created a lock file .terraform.lock.hcl to record the provider
       selections it made above. Include this file in your version control repository
       so that Terraform can guarantee to make the same selections by default when
       you run "terraform init" in the future.
       
       Terraform has been successfully initialized!
       
       You may now begin working with Terraform. Try running "terraform plan" to see
       any changes that are required for your infrastructure. All Terraform commands
       should now work.
       
       If you ever set or change modules or backend configuration for Terraform,
       rerun this command to reinitialize your working directory. If you forget, other
       commands will detect it and remind you to do so if necessary.
       data.extip.external_ip: Reading...
       data.extip.external_ip: Read complete after 0s [id=2022-07-13 09:27:51.987726667 +0000 UTC]
       
       No changes. Your infrastructure matches the configuration.
       
       Terraform has compared your real infrastructure against your configuration and
       found no differences, so no changes are needed.
       
       Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
       
       Outputs:
       
       external_ip = "7.1.2.1"
       Downloading files from <default-vbox-bionic64>
       Finished converging <default-vbox-bionic64> (1m40.36s).
-----> Setting up <default-vbox-bionic64>...
       Finished setting up <default-vbox-bionic64> (0m0.00s).
-----> Verifying <default-vbox-bionic64>...
       Loaded tests from {:path=>".Users.aakulov.Documents.Development.Hashicorp.tf-ob-custom-plugin-kitchen.test.integration.default"} 

Profile:   tests from {:path=>"/Users/aakulov/Documents/Development/Hashicorp/tf-ob-custom-plugin-kitchen/test/integration/default"} (tests from {:path=>".Users.aakulov.Documents.Development.Hashicorp.tf-ob-custom-plugin-kitchen.test.integration.default"})
Version:   (not specified)
Target:    ssh://vagrant@127.0.0.1:2200
Target ID: a68cf2ce-751a-53cb-a43d-9a806d2d7a73

  Bash command cd /vagrant && terraform output -raw external_ip
     ✔  is expected not to match "0.0.0.0"
     ✔  is expected not to match "127.0.0.1"
     ✔  exit_status is expected to eq 0

Test Summary: 3 successful, 0 failures, 0 skipped
       Finished verifying <default-vbox-bionic64> (0m3.17s).
-----> Destroying <default-vbox-bionic64>...
       ==> default: Forcing shutdown of VM...
       ==> default: Destroying VM and associated drives...
       Vagrant instance <default-vbox-bionic64> destroyed.
       Finished destroying <default-vbox-bionic64> (0m6.30s).
       Finished testing <default-vbox-bionic64> (2m30.25s).
-----> Test Kitchen is finished. (2m31.20s)
```
