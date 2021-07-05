# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "mage_app" do |mage_app|
    mage_app.vm.box = "opensuse/Tumbleweed.x86_64"
    mage_app.vm.hostname = 'mage'
    mage_app.ssh.shell = 'sh'
    mage_app.vm.network "private_network", ip: "192.168.56.225"
    mage_app.vm.provision "file", source: "/home/ratio/.ssh/hillel_1.pub", destination: "/home/vagrant/.ssh/me.pub"
    mage_app.vm.provision "shell", inline: "cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys"
    mage_app.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true
    mage_app.vm.provision :ansible do |ansible|
      ansible.playbook = 'playbook.yml'
      ansible.verbose = "vvv"
    end
    mage_app.vm.provision "shell",
      inline: <<-SCRIPT_DOC
        zypper update -y
        zypper install -y python
      SCRIPT_DOC
  end
#     config.vm.define "mage_db" do |mage_db|
#       mage_db.vm.box = "opensuse/Leap-15.3.x86_64"
#       mage_db.vm.hostname = 'mage'
#       mage_db.vm.network "private_network", ip: "192.168.56.220"
#       mage_db.vm.provision "file", source: "/home/ratio/.ssh/hillel_2.pub", destination: "/home/vagrant/.ssh/me.pub"
#       mage_db.vm.provision "shell", inline: "cat /home/vagrant/.ssh/me.pub >> /home/vagrant/.ssh/authorized_keys"
#       mage_db.vm.synced_folder '.', '/vagrant', id: 'vagrant-root', disabled: true
#       mage_db.vm.provision :ansible do |ansible|
#         ansible.playbook = 'playbook.yml'
#       end
#       mage_db.vm.provision "shell",
#         inline: <<-SCRIPT_DOC
#           zypper update -y
#           zypper install -y python
#         SCRIPT_DOC
#     end
end