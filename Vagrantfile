Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.hostname = "customkitchen"
  config.vm.network "private_network", ip: "192.168.56.33"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024 * 4
    v.cpus = 2
  end
  config.vm.provision "shell", path: "scripts/install_go.sh"
  config.vm.provision "shell", path: "scripts/addhashicorprepo.sh"
  config.vm.provision "shell", path: "scripts/install_kitchen.sh"
  config.vm.provision "shell", path: "scripts/run_terraform.sh", privileged: false
end
