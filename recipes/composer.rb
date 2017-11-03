# Cookbook Name:: laravel-amazonlinux
# Recipe:: composer
#
# Copyright 2017, Ivan Ershov
#
# All rights reserved - Do Not Redistribute
#

bash "install composer" do
  cwd "/root"
  code <<-EOH
  curl -sS https://getcomposer.org/installer | php
  mv /root/composer.phar /usr/bin/composer
  chmod +x /usr/bin/composer
  EOH
  not_if { File.exist?("/usr/bin/composer") }
end

execute "composer install" do
  cwd "#{node['laravel-amazonlinux']['app_path']}/current"
  user "#{node['laravel-amazonlinux']['app_user']}"
end