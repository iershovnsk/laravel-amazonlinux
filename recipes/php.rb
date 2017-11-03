# Cookbook Name:: laravel-amazonlinux
# Recipe:: php
#
# Copyright 2017, Ivan Ershov
#
# All rights reserved - Do Not Redistribute
#

package "php#{node['laravel-amazonlinux']['php']['version']}" do
  action :install
end

node['laravel-amazonlinux']['php']['packages'].each do |pkg|
  package "php#{node['laravel-amazonlinux']['php']['version']}-#{pkg}" do
    action :install
  end
end

service "php-fpm" do
  action [ :enable, :start ]
end