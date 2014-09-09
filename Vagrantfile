Vagrant.configure('2') do |config|
  config.vm.box = "thoughtbot/ubuntu-14-04-server-with-laptop"
  config.vm.network "forwarded_port", guest: 3000, host: 30000
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
