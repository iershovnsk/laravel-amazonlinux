default['laravel-amazonlinux']['php']['version'] = '71'
default['laravel-amazonlinux']['php']['packages'] = [ 'cli', 'common', 'curl', 'fpm', 'gd', 'json', 'mbstring', 'mcrypt', 'mysqlnd', 'opcache', 'readline', 'xml' ]

default['laravel-amazonlinux']['repo_url'] = 'git@github.com:Alavida/alavida-app.git'
default['laravel-amazonlinux']['app_path'] = '/var/www'

default['laravel-amazonlinux']['app_user'] = 'nginx'
default['laravel-amazonlinux']['app_group'] = 'nginx'