    web_app "pma" do
      server_name "pma.stars.vag"
      server_aliases ["pma.stars.vag"]
      docroot "/opt/phpmyadmin"
      allow_override "All"
    end

    #web_app "star" do
    #  server_name "stars.vag"
    #  server_aliases ["stars.vag"]
    #  docroot "/vagrant/public"
    #  allow_override "All"
    #end

