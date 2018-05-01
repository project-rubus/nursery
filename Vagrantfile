# -*- mode: ruby -*-

# Older versions of vagrant can't start the ubuntu bentobox with
# private networking
Vagrant.require_version ">= 1.8.2"

box = "debian/stretch64"
hostname = 'annex-restore-test'

memory = 4096 # in MB
disk_size = 60 # in GB
disk_path = "disk.vdi"

Vagrant.configure(2) do |config|
  # Basic properties
  config.vm.box = box
  config.vm.provider :virtualbox do |vbox|
    vbox.gui = false
    vbox.memory = memory
    unless File.exist?(disk_path)
      vbox.customize ['createhd', '--filename', disk_path,
                      # '--variant', 'Fixed',
                      '--size', disk_size * 1024]
    end
    vbox.customize ['storageattach', :id, '--storagectl', 'SATA Controller',
                    '--port', 1, '--device', 0, '--type', 'hdd',
                    '--medium', disk_path]
  end
  config.vm.synced_folder 'shared', '/vagrant'

  # Provision dependencies
  config.vm.provision :shell do |shell|
    shell.path = 'provision/setup-disk.sh'
  end
  config.vm.provision :shell do |shell|
    shell.path = 'provision/setup-deps.sh'
  end
  config.vm.provision :file do |file|
    file.source = './scripts'
    file.destination = '~vagrant/bin'
  end
  config.vm.provision :shell do |shell|
    shell.inline = "mv ~vagrant/bin/* /usr/local/bin && rmdir ~vagrant/bin"
  end
end
