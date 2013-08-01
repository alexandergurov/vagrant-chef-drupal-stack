#
# Cookbook Name:: apparmor
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when "ubuntu"
  actions = node[:apparmor][:disable] ? [:stop, :disable] : [:start, :enable]
  service "apparmor" do
    stop_command "service apparmor teardown"
    action actions
    supports [ :restart, :reload, :status ]
  end

  actions = node[:apparmor][:remove] ? [:remove] : [:nothing]
  package "apparmor" do
    action actions
  end
end