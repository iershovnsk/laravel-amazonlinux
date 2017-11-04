# Cookbook Name:: laravel-amazonlinux
# Recipe:: deploy
#
# Copyright 2017, Ivan Ershov
#
# All rights reserved - Do Not Redistribute
#

include_recipe "laravel-amazonlinux::nginx"


deploy 'laravel-amazonlinux' do
  repo "#{node['laravel-amazonlinux']['repo_url']}"
  user "#{node['laravel-amazonlinux']['app_user']}"
  group "#{node['laravel-amazonlinux']['app_group']}"
  deploy_to "#{node['laravel-amazonlinux']['app_path']}"
  keep_releases 3  
  action :deploy
  notifies :restart, "service[php-fpm]"
  notifies :restart, "service[nginx]"
end

#template "#{node['laravel-amazonlinux']['app_path']}/current/.env" do
#  source '.env.erb'
#  user "#{node['laravel-amazonlinux']['app_user']}"
#  group "#{node['laravel-amazonlinux']['app_group']}"
#  mode 0640
#end

execute "move .env.production to .env" do
  command "mv .env.production .env"
  cwd "#{node['laravel-amazonlinux']['app_path']}/current"
  user "#{node['laravel-amazonlinux']['app_user']}"
end

execute "find ./storage/ -type d -exec chmod 777 {} \\;" do
  cwd "#{node['laravel-amazonlinux']['app_path']}/current"
end


include_recipe "laravel-amazonlinux::composer"