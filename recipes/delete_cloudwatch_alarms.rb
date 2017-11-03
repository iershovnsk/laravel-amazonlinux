#
# Cookbook Name:: laravel-amazonlinux
# Recipe:: delete_cloudwatch_alarms
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'delete cloudwatch alerts for the instance' do
  command "aws cloudwatch delete-alarms --alarm-name nginxIsRunning_`curl http://169.254.169.254/latest/meta-data/instance-id` DiskSpace_`curl http://169.254.169.254/latest/meta-data/instance-id` php-fpmIsRunning_`curl http://169.254.169.254/latest/meta-data/instance-id`"  
end