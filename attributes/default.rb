default['laravel-amazonlinux']['php']['version'] = '71'
default['laravel-amazonlinux']['php']['packages'] = [ 'cli', 'common', 'curl', 'fpm', 'gd', 'json', 'mbstring', 'mcrypt', 'mysqlnd', 'opcache', 'readline', 'zip', 'xml' ]

default['laravel-amazonlinux']['repo_url'] = ''
default['laravel-amazonlinux']['app_path'] = '/var/www'

default['laravel-amazonlinux']['mysql_host'] = ''
default['laravel-amazonlinux']['mysql_db'] = ''
default['laravel-amazonlinux']['mysql_user'] = ''
default['laravel-amazonlinux']['mysql_pass'] = ''

default['laravel-amazonlinux']['app_user'] = 'www-data'
default['laravel-amazonlinux']['app_group'] = 'www-data'

default['laravel-amazonlinux']['access_key'] = ''
default['laravel-amazonlinux']['secret_key'] = ''
default['laravel-amazonlinux']['region'] = ''
default['laravel-amazonlinux']['sns_topic'] = ''

default['laravel-amazonlinux']['efs_mount'] = '/mnt/files'
default['laravel-amazonlinux']['efs_id'] = ''
default['laravel-amazonlinux']['efs_region'] = ''