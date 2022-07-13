# tf-ob-custom-plugin-kitchen
sample repo - using a custom plugin + kitchen test (gh repo)

## Intro
This manual is dedicated to run vagrant box with terraform code which use custom provider
and apply kitchen test. 

Tested on Mac OS X.

## Requirements
- Oracle Virtualbox recent version installed
[VirtualBox installation manual](https://www.virtualbox.org/manual/ch01.html#intro-installing)

- Hashicorp vagrant recent version installed
[Vagrant installation manual](https://learn.hashicorp.com/tutorials/vagrant/getting-started-install)

- git installed
[Git installation manual](https://git-scm.com/download/mac)

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

## Provisioning

- In the same folder you were before run 

```bash
vagrant up
```

Expected output:

```bash
% vagrant up     
Bringing machine 'default' up with 'virtualbox' provider...
==> default: Importing base box 'ubuntu/focal64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'ubuntu/focal64' version '20220706.0.0' is up to date...
==> default: Setting the name of the VM: tf-ob-custom-plugin-kitchen_default_1657627265558_92865
==> default: Fixed port collision for 22 => 2222. Now on port 2200.
==> default: Clearing any previously set network interfaces...
==> default: Preparing network interfaces based on configuration...
    default: Adapter 1: nat
    default: Adapter 2: hostonly
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
==> default: Configuring and enabling network interfaces...
==> default: Mounting shared folders...
    default: /vagrant => /Users/aakulov/Documents/Development/Hashicorp/tf-ob-custom-plugin-kitchen
==> default: Running provisioner: shell...
    default: Running: /var/folders/_d/p7jhkm3n29d8q5mr_7k18yb00000gp/T/
    
    [ Output was cut ]

    default: Fetching options 2.3.2
    default: Installing options 2.3.2
    default: Fetching progress_bar 1.3.3
    default: Installing progress_bar 1.3.3
    default: Using little-plugger 1.1.4
    default: Using logging 2.3.1
    default: Using nori 2.6.0
    default: Using rubyntlm 0.6.3
    default: Using winrm 2.3.6
    default: Using winrm-fs 1.3.5
    default: Using winrm-elevated 1.2.3
    default: Using train-winrm 0.2.13
    default: Fetching train 3.10.1
    default: Installing train 3.10.1
    default: Using train-aws 0.2.24
    default: Using train-habitat 0.2.22
    default: Fetching inspec 5.17.4
    default: Installing inspec 5.17.4
    default: Using mixlib-versioning 1.2.12
    default: Using mixlib-install 3.12.19
    default: Using net-ssh-gateway 2.0.0
    default: Using test-kitchen 3.3.1
    default: Using kitchen-inspec 2.6.1
    default: Bundle complete! 3 Gemfile dependencies, 210 gems now installed.
    default: Bundled gems are installed into `./vendor/bundle`
```

## Implementation

- Connect to VM. In the same folder you were before run 

```bash
vagrant ssh
```

Sample result

```bash
% vagrant ssh
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.4.0-122-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jul 12 12:03:49 UTC 2022

  System load:  0.41              Processes:               134
  Usage of /:   5.2% of 38.70GB   Users logged in:         0
  Memory usage: 7%                IPv4 address for enp0s3: 10.0.2.15
  Swap usage:   0%                IPv4 address for enp0s8: 192.168.56.33


1 update can be applied immediately.
To see these additional updates run: apt list --upgradable


vagrant@customkitchen:~$
```

- Build and install provider

```
go install github.com/petems/terraform-provider-extip@latest
```

Simple result:

```bash
$ go install github.com/petems/terraform-provider-extip@latest
go: downloading github.com/petems/terraform-provider-extip v0.1.2
go: downloading github.com/hashicorp/terraform-plugin-sdk v1.7.0
go: downloading github.com/hashicorp/go-hclog v0.9.2
go: downloading github.com/hashicorp/go-plugin v1.0.1
go: downloading github.com/zclconf/go-cty v1.2.1
go: downloading google.golang.org/grpc v1.23.0
go: downloading github.com/hashicorp/go-uuid v1.0.1
go: downloading github.com/hashicorp/go-multierror v1.0.0
go: downloading github.com/mitchellh/copystructure v1.0.0
go: downloading github.com/mitchellh/mapstructure v1.1.2
go: downloading github.com/agext/levenshtein v1.2.2
go: downloading github.com/hashicorp/errwrap v1.0.0
go: downloading github.com/hashicorp/go-version v1.2.0
go: downloading github.com/hashicorp/hcl/v2 v2.0.0
go: downloading github.com/hashicorp/hcl v1.0.0
go: downloading github.com/mitchellh/reflectwalk v1.0.1
go: downloading golang.org/x/net v0.0.0-20191009170851-d66e71096ffb
go: downloading github.com/hashicorp/go-getter v1.4.0
go: downloading github.com/hashicorp/terraform-svchost v0.0.0-20191011084731-65d371908596
go: downloading github.com/mitchellh/cli v1.0.0
go: downloading golang.org/x/crypto v0.0.0-20190820162420-60c769a6c586
go: downloading github.com/golang/protobuf v1.3.2
go: downloading github.com/hashicorp/yamux v0.0.0-20181012175058-2f1d1f20f75d
go: downloading github.com/mitchellh/go-testing-interface v1.0.0
go: downloading github.com/oklog/run v1.0.0
go: downloading github.com/vmihailenco/msgpack v4.0.1+incompatible
go: downloading golang.org/x/text v0.3.2
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
```

- Create plugin directory. In the same terminal run:

```bash
mkdir -p ~/.local/share/terraform/plugins/localproviders/petems/extip/0.1.2/linux_amd64
```

Sample result

```bash
$ mkdir -p ~/.local/share/terraform/plugins/localproviders/petems/extip/0.1.2/linux_amd64
$
```

- Copy plugin to the required path. Run:

```bash
cp $GOPATH/bin/terraform-provider-extip ~/.local/share/terraform/plugins/localproviders/petems/extip/0.1.2/linux_amd64
```

- Change current directory to /vagrant. Run:

```bash
cd /vagrant
```

-  In the same folder run 

```bash
terraform init
```

Sample result

```bash
$ terraform init

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

```

- Run the `terraform apply -auto-approve`

Sample output

```bash
$ terraform apply -auto-approve
data.extip.external_ip: Reading...
data.extip.external_ip: Read complete after 1s [id=2022-07-12 13:57:57.606838364 +0000 UTC]

Changes to Outputs:
  + external_ip = "7.1.2.1"

You can apply this plan to save these new output values to the Terraform state, without changing any real infrastructure.

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

external_ip = "7.1.2.1"
```

