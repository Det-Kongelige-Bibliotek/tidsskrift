# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # standard centos box
  config.vm.box = "box-cutter/centos64-i386"
  # application dependencies
  # due to problems with symlinks we are not doing this step
  # config.vm.provision :shell, path: 'apache_php_mysql_centos.sh'
  # application installer
  config.vm.provision :shell, path: 'install_ojs.sh'
  config.vm.network :forwarded_port, host: 4567, guest: 80
  config.vm.network :forwarded_port, host: 3316, guest: 3306

end
