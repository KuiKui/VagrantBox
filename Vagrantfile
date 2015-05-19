Vagrant::Config.run do |config|
    config.vm.host_name = "TestKuiKuiBox"

    config.vm.box = "kuikui-test"

    config.vm.network :hostonly, "10.0.0.100", :netmask => "255.255.255.0"
    config.vm.share_folder("vagrant-root", "/vagrant", ".", :nfs => true)
    config.vm.forward_port 80, 8080
end

