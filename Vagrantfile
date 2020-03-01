Vagrant.configure("2") do |config|
  (10..11).each do |i|
    config.vm.define "vhost#{i}" do |virtualhost|
      virtualhost.vm.box = 'ubuntu/bionic64'
      virtualhost.vm.hostname = "virtualhost-#{i}"
#      virtualhost.disksize.size = '30GB'
      virtualhost.ssh.insert_key = true
      virtualhost.vm.network "private_network", ip: "192.168.5.#{i}"
      virtualhost.vm.provider "virtualbox" do |vb|
        vb.name = "honeycomb-vm#{i}"
      end
      virtualhost.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 2
      end
      virtualhost.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/temp.key"
      virtualhost.vm.provision "shell", inline: "cat /home/vagrant/.ssh/temp.key >> /home/vagrant/.ssh/authorized_keys && rm /home/vagrant/.ssh/temp.key"
      virtualhost.vm.provision "shell", inline: "apt-get update && apt-get -y install python"
    end
  end
end