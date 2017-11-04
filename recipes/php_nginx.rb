# Cookbook Name:: laravel-amazonlinux
# Recipe:: php_nginx
#
# Copyright 2017, Ivan Ershov
#
# All rights reserved - Do Not Redistribute
#

package "nginx" do
  action :install
end

package "php#{node['laravel-amazonlinux']['php']['version']}" do
  action :install
end

node['laravel-amazonlinux']['php']['packages'].each do |pkg|
  package "php#{node['laravel-amazonlinux']['php']['version']}-#{pkg}" do
    action :install
  end
end

cookbook_file "/etc/nginx/nginx.conf" do
  source "nginx.conf"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[nginx]"
end

directory "/etc/nginx/ssl" do
  mode 0755
  owner "root"
  group "root"
end

cookbook_file "/etc/nginx/ssl/key.pem" do
  source "key.pem"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[nginx]"
end
  
cookbook_file "/etc/nginx/ssl/cert.pem" do
  source "cert.pem"
  mode 0644
  owner "root"
  group "root"
  notifies :restart, "service[nginx]"
end

template "/etc/nginx/conf.d/default.conf" do
  source "default.erb"
  owner "#{node['laravel-amazonlinux']['app_user']}"
  group "#{node['laravel-amazonlinux']['app_group']}"
  mode '0644'
  notifies :restart, "service[nginx]"
end

directory "#{node['laravel-amazonlinux']['app_path']}" do
  owner "#{node['laravel-amazonlinux']['app_user']}"
  group "#{node['laravel-amazonlinux']['app_group']}"
  mode '0755'
end

user "nginx" do
  home "#{node['laravel-amazonlinux']['app_path']}"
  action :modify
end

service "nginx" do
  action [ :enable, :start ]
end

service "php-fpm" do
  action [ :enable, :start ]
end