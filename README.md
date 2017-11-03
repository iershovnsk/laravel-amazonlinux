laravel-amazonlinux cookbook
===================
This cookbook is being used to setup/configure/update laravel-amazonlinux application.


Requirements
------------
This cookbook has been designed and tested on Ubuntu 16.04.
Requires:

Attributes
----------
- 'php''version' = '71' - defines the PHP version to be installed(the possible values are 5.6 and 7.0)
- 'php''packages' = [ 'cli', 'common', 'curl', 'fpm', 'gd', 'json', 'mbstring', 'mcrypt', 'mysql', 'opcache', 'readline', 'zip', 'xml' ] - defines the php packages to be installed

- 'repo_url' = '' - defines the application repo which is to be deployed
- `app_path` = '/var/www' - defines the path where the laravel-amazonlinux application is being deployed

- `mysql_host` = '' - defines MySQL host
- `mysql_db` = '' - defines MySQL database
- `mysql_user` = '' - defines MySQL user
- `mysql_pass` = '' - defines MySQL password

- `access_key` = '' - defines AWS access key for CloudWatch monitoring
- `secret_key` = '' - defines AWS access key for CloudWatch monitoring
- `region` = '' - defines AWS region for CloudWatch monitoring
- `sns_topic` = '' defines AWS SNS topic for CloudWatch monitoring

#### laravel-amazonlinux::default
Default recipe is beind used to do the initial deploy of the application and required assets

#### laravel-amazonlinux::deploy
Deploy recipe is being used to deploy/update the application

#### laravel-amazonlinux::php
Php recipe is being used to install php with its packages and define php-fpm service, being called by deploy recipe

#### laravel-amazonlinux::nginx
Nginx recipe is being used to install nginx and configure default vhost, being called by deploy recipe

#### laravel-amazonlinux::composer
Composer recipe is being used to install/configure composer, being called by default recipe

#### laravel-amazonlinux::setup_cloudwatch
The recipe which sets up the cloudwatch scripts, AWS API CLI tools, two cronjobs for DiskSpace and Nginx process metrics 
and creates two CloudWatch alarms for these metrics.Being called on Configure phase.

#### laravel-amazonlinux::delete_cloudwatch_alarms
The recipe is being called on the instance shutdown and deletes early created CloudWatch alarms

License and Authors
-------------------
Authors: Ivan Ershov iershov.nsk@gmail.com
