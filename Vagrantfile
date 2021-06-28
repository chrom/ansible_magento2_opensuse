Vagrant.configure("2") do |config|
  config.vm.define "mage_env" do |mage_env|
    mage_env.vm.box = "opensuse/Leap-15.3.x86_64"
    mage_env.vm.hostname = 'mage'
    mage_env.vm.network "private_network", ip: "192.168.56.225"
    mage_env.vm.provision "file", source: "/home/ratio/.ssh/default_key.pub", destination: "/home/vagrant/.ssh/me.pub"
    mage_env.vm.provision "shell", inline: "cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys"
    mage_env.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true
    mage_env.vm.provision :ansible do |ansible|
      ansible.playbook = 'playbook.yml'
    end
    mage_env.vm.provision "shell",
      inline: <<-SCRIPT_DOC
        zypper update -y
        zypper install -y python
      SCRIPT_DOC
  end
end