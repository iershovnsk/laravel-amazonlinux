laravel-amazonlinux cookbook
===================
This cookbook is to be used to setup/configure/update laravel application on AmazonLinux


Requirements
------------
This cookbook has been tested on AmazonLinux 2017.03.


Attributes
----------
- 'php''version' = '71' - defines the PHP version to be installed(the possible values are 5.6 and 7.0)
- 'php''packages' = [ 'cli', 'common', 'curl', 'fpm', 'gd', 'json', 'mbstring', 'mcrypt', 'mysql', 'opcache', 'readline', 'zip', 'xml' ] - defines the php packages to be installed

- 'repo_url' = '' - defines the application repo which is to be deployed
- `app_path` = '/var/www' - defines the path where the laravel-amazonlinux application is being deployed
- 'app_user' = 'nginx' - defines the application user 
- 'app_group' = 'nginx' - defines the application group


#### laravel-amazonlinux::default
Default recipe is beind used to do the initial deploy of the application and all the required assets

#### laravel-amazonlinux::deploy
Deploy recipe is being used to deploy/update the application

#### laravel-amazonlinux::php
Php recipe is being used to install php with its packages and define php-fpm service, being called by deploy recipe

#### laravel-amazonlinux::nginx
Nginx recipe is being used to install nginx and configure default vhost with SSL, being called by deploy recipe

#### laravel-amazonlinux::composer
Composer recipe is being used to install/configure composer, being called by default recipe

Usage
-----

In order to run and deploy the laravel application it is enough to just run the default recipe of this cookbook.
Should the application be updated later deploy recipe could be used