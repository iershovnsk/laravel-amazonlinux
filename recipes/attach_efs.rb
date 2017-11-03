#
# Cookbook Name:: laravel-amazonlinux
# Recipe:: attach_efs
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package "nfs-common" do
  action :install
end


directory "#{node['laravel-amazonlinux']['efs_mount']}" do
  owner 'root'
  group 'root'
  mode '0755'
end


execute "attach_efs" do
  cwd "/root"
  command "mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).#{node['laravel-amazonlinux']['efs_id']}.efs.#{node['laravel-amazonlinux']['efs_region']}.amazonaws.com:/ #{node['laravel-amazonlinux']['efs_mount']}"
end
