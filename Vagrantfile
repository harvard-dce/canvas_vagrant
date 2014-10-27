Vagrant.configure('2') do |config|
  config.vm.box = "harvard-dce/ubuntu-14-04-canvas-lms"
  config.vm.network "forwarded_port", guest: 3000, host: 33000
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
