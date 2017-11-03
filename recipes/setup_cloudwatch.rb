#
# Cookbook Name:: laravel-amazonlinux
# Recipe:: setup_cloudwatch
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


%w{libwww-perl libdatetime-perl unzip awscli}.each do |pkg|
  apt_package pkg do
    action :install
    options '--allow-unauthenticated'
  end
end

directory '/root/.aws' do
  mode '0700'
  owner 'root'
  group 'root'
end

bash 'prepare the dirs and files' do
  cwd "/root"
  code <<-EOH
    wget http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip
    unzip -q CloudWatchMonitoringScripts-1.2.1.zip
    rm CloudWatchMonitoringScripts-1.2.1.zip
  EOH
  not_if { File.exist?("/root/aws-scripts-mon") }
end

template '/root/aws-scripts-mon/awscreds.conf' do
  source 'awscreds.conf.erb'
  owner  'root'
  owner  'root'
  mode   '0644'
end

template '/root/.aws/config' do
  source 'config.erb'
  owner  'root'
  owner  'root'
  mode   '0644'
end

execute 'create diskspace alarm' do
  command "aws cloudwatch put-metric-alarm --alarm-name DiskSpace_`curl http://169.254.169.254/latest/meta-data/instance-id`  --metric-name DiskSpaceUtilization --namespace 'System/Linux' --statistic Average --period 300 --threshold 80 --comparison-operator GreaterThanThreshold  --dimensions  Name=InstanceId,Value=`curl http://169.254.169.254/latest/meta-data/instance-id` Name=Filesystem,Value=/dev/xvda1 Name=MountPath,Value=/ --evaluation-periods 1 --alarm-actions #{node['laravel-amazonlinux']['sns_topic']}"
end

cron 'disk_space_metrics' do
  user    'root'
  minute  '*/5'
  hour    '*'
  weekday '*'
  command '/root/aws-scripts-mon/mon-put-instance-data.pl --mem-util --disk-space-util --disk-path=/ --from-cron'
end

%w{nginx php-fpm}.each do |process|

  template "/root/check_#{process}.sh" do
    source 'check_process.sh.erb'
    mode   '0755'
    owner  'root'
    group  'root'
    variables ({ :process_name => process })
  end


  cron "process_#{process}_metrics" do
    user    'root'
    minute  '*/5'
    hour    '*'
    weekday '*'
    command "/root/check_#{process}.sh"
  end

  execute "create #{process} alarm" do
    command "aws cloudwatch put-metric-alarm --alarm-name #{process}IsRunning_`curl http://169.254.169.254/latest/meta-data/instance-id` --metric-name #{process}IsRunning --namespace '#{process}' --statistic Average --period 300 --threshold 1 --comparison-operator LessThanThreshold --evaluation-periods 2 --alarm-actions #{node['laravel-amazonlinux']['sns_topic']}"
  end

end
