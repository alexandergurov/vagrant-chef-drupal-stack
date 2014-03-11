Vagrant::Config.run do |config|
  config.vm.box = "u12-04-c11-ga-426"
  # config.vm.boot_mode = :gui

  # Memory setting
  config.vm.customize ["modifyvm", :id, "--memory", "1536"]

  # Network setting
  config.vm.network :hostonly, "33.33.33.10"
  #config.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  #config.vm.forward_port 80, 8080

  # Shared folders
  config.vm.share_folder "public", "/var/www", "./public", :owner => "www-data", :group => "www-data"
  config.vm.share_folder "db", "/vagrant/db", "./db"
  # config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  # config.vm.share_folder("v-apt", "/var/cache/apt", "~/temp/vagrant_aptcache/apt", :nfs => true)

  # Provision
  config.vm.provision :chef_solo do |chef|
    # This path will be expanded relative to the project directory
    chef.cookbooks_path = ["cookbooks/site-cookbooks", "cookbooks/drupal-cookbooks", "cookbooks/my-cookbooks", "cookbooks/dev-tools"]
    chef.roles_path = "roles"
    # This role represents our default Drupal development stack.
    chef.add_role("lamp")
    chef.add_role("developer")
    # This is basically the Vagrant role.
    chef.json.merge!({

      })
  end
end
