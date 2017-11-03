# Cookbook Name:: laravel-amazonlinux
# Recipe:: configure_deploy
#
# Copyright 2017, Ivan Ershov
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['laravel-amazonlinux']['app_path']}/.ssh" do
  mode '0700'
  owner "#{node['laravel-amazonlinux']['app_user']}"
  group "#{node['laravel-amazonlinux']['app_group']}"
end

cookbook_file "#{node['laravel-amazonlinux']['app_path']}/.ssh/config" do
  source 'config'
  mode '0600'
  owner "#{node['laravel-amazonlinux']['app_user']}"
  group "#{node['laravel-amazonlinux']['app_group']}"
end

cookbook_file "#{node['laravel-amazonlinux']['app_path']}/.ssh/deploy.pem" do
  source 'deploy.pem'
  mode '0600'
  owner "#{node['laravel-amazonlinux']['app_user']}"
  group "#{node['laravel-amazonlinux']['app_group']}"
end

package 'git' do
  action :install
end
