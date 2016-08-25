VAGRANTFILE_API_VERSION = '2'

Vagrant.require_version ">= 1.7.2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = "kuikui-test"

    config.vm.host_name = "TestKuiKuiBox"

    config.vm.network "private_network", type: 'dhcp'
    config.vm.network "forwarded_port", guest: 80, host: 8080
    config.vm.network "forwarded_port", guest: 15672, host: 15672

    config.vm.synced_folder '.', '/vagrant', type: 'nfs', mount_options: ['nolock', 'actimeo=1', 'fsc']
end

