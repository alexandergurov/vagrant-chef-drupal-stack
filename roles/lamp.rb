name "lamp_stack"
description "A LAMP Stack, clear and untouched."
run_list(
  #"recipe[apparmor]",
  "recipe[apt]",
  "recipe[php]",
  "recipe[apache2]",
  "recipe[apache2::mod_expires]",
  "recipe[apache2::mod_php5]",
  "recipe[apache2::mod_rewrite]",
  "recipe[mysql::server]",
  "recipe[php::module_mysql]",
  "recipe[php::module_curl]",
  "recipe[web_app]",
)

default_attributes(
  :apache => {
    :docroot_dir => '/vagrant/public',
    :default_site_enabled => true,
    :keepaliverequests => 100,
    :prefork => {
      :startservers => 2,
      :minspareservers => 1,
      :maxspareservers => 3,
      :serverlimit => 4,
      :maxclients => 4,
      :maxrequestsperchild => 1000
    },
    :worker => {
      :startservers => 2,
      :maxclients => 128,
      :minsparethreads => 16,
      :maxsparethreads => 128,
      :threadsperchild => 16,
      :maxrequestsperchild => 0
    }
  },
  :php5 => {
    :max_execution_time => "60",
    :memory_limit => "512M"
  },
  :mysql => {
      :bind_address => "127.0.0.1",
      :data_dir => "/vagrant/db",
      :server_root_password => "root",
      :server_repl_password => "root",
      :server_debian_password => "root",
      :tunable => {
        :key_buffer => "384M",
        :table_cache => "4096",
      }
    }
)
