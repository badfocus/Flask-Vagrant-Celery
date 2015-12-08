Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        vb.memory = 3072
    end

    config.vm.box = "ubuntu/trusty64"
    config.vm.network "forwarded_port", guest: 8000, host: 8000

    config.vm.provision "puppet" do |puppet|
        puppet.manifests_path = "__provision__/manifests"
        puppet.manifest_file  = "default.pp"
        puppet.module_path = "__provision__/modules"
    end
end
