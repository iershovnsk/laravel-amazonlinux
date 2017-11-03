#
# Cookbook Name:: laravel-amazonlinux
# Recipe:: detach_efs
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


execute 'detach_efs' do
  cwd "/root"
  command "umount #{node['laravel-amazonlinux']['efs_mount']}"
end
