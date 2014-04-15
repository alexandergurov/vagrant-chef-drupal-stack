Vagrant.configure("2") do |config|
    config.vm.box = "u1204_64-c11-ga4.46"

    # Memory setting
    config.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    # Network setting
    config.vm.network "private_network", ip: "33.33.33.10"

    # Shared folders
    config.vm.synced_folder "public", "/var/www",
        owner: "www-data", group: "www-data"

    config.vm.synced_folder "db", "/vagrant/db",
        owner: "mysql", group: "mysql"

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