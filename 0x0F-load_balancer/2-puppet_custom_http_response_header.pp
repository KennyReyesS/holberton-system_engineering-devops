# configures a brand new Ubuntu machine with puppet
exec { 'update':
  command => 'sudo apt-get -y update',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'install nginx':
  command => 'sudo apt-get -y install nginx',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

package {'nginx':
  ensure  => installed,
}

exec { 'holberton':
  command => 'echo "Holberton School" > index.html',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'move file':
  command => 'sudo mv index.html /var/www/html/',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'nginx start':
  command => 'sudo service nginx start',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

file {'/var/www/html/index.html':
  content => 'Holberton School',
}

file_line {'configuring redirection':
  path  => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line  => "\n\tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t}\n",
}

file_line {'configuring 404':
  path  => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line  => "\n\terror_page 404 /custom_404.html;\n\tlocation = /custom_404.html {\n\t\troot /usr/share/nginx/html;\n\t\tinternal;\n\t}",
}

file_line { 'configuring header':
  path  => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line  => "\n\tadd_header X-Served-By ${hostname};",
}

exec { 'nginx restart':
  command => 'sudo service nginx restart',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
