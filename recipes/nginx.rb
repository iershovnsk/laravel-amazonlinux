# Cookbook Name:: laravel-amazonlinux
# Recipe:: nginx
#
# Copyright 2017, Ivan Ershov
#
# All rights reserved - Do Not Redistribute
#

service "apache2" do
  action [ :stop, :disable ]
end

template "/etc/nginx/sites-available/default" do
  source "default.erb"
  owner "#{node['laravel-amazonlinux']['app_user']}"
  group "#{node['laravel-amazonlinux']['app_group']}"
  mode '0644'
end

service "nginx" do
  action [ :enable, :start ]
end