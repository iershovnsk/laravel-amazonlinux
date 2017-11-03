#
# Cookbook Name:: laravel-amazonlinux
# Recipe:: default
#
# Copyright 2017, Ivan Ershov
#
# All rights reserved - Do Not Redistribute
#

#Include all the required recipes to install/setup the deps
include_recipe "laravel-amazonlinux::php"
include_recipe "laravel-amazonlinux::nginx"
#include_recipe "laravel-amazonlinux::configure_deploy"
#include_recipe "laravel-amazonlinux::attach_efs"
#include_recipe "laravel-amazonlinux::deploy"
#include_recipe "laravel-amazonlinux::composer"

#execute "php artisan vendor:publish" do
#  cwd "#{node['laravel-amazonlinux']['app_path']}/current"
#  user "#{node['laravel-amazonlinux']['app_user']}"
#end

#execute "chown -R #{node['laravel-amazonlinux']['deploy_user']}:#{node['laravel-amazonlinux']['deploy_group']} *" do
#  cwd "#{node['laravel-amazonlinux']['app_path']}/current"
#end

#execute "find ./storage/ -type d -exec chmod 777 {} \\;" do
#  cwd "#{node['laravel-amazonlinux']['app_path']}/current"
#end

#Add the link to EFS instead of static directory
#execute "remove storage/app" do
#  command "rm -rf storage/app"
#  cwd "#{node['laravel-amazonlinux']['app_path']}/current"
#end

#link "#{node['laravel-amazonlinux']['app_path']}/current/storage/app" do
#  to "/mnt/files"
#  owner "#{node['laravel-amazonlinux']['app_user']}"
#  group "#{node['laravel-amazonlinux']['app_group']}"
#end 


#execute "chmod 664 storage/logs/laravel.log" do
#   cwd "#{node['laravel-amazonlinux']['app_path']}/"
#end
