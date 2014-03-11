name "developer"
description "PHP development tools for lamp stack."
run_list(
  "recipe[chef-phpmyadmin]",
)
default_attributes(
  :phpmyadmin => {
    :fpm => false
  }
)
