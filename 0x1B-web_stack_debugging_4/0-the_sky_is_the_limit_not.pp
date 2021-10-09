# Fix Failed requests: 943 to Failed request: 0
exec { 'fix--for-nginx':
  command => 'sed -i s/15/4096/g /etc/default/nginx',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'nginx-restart':
  command => 'sudo service nginx restart',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
