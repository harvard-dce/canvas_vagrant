Vagrant.configure('2') do |config|
  config.vm.box = "harvard-dce/ubuntu-14-04-canvas-lms"
  config.vm.network :private_network, ip: "192.168.50.4"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
