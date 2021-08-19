#!/usr/bin/env bash
# Configuring Nginx with puppet
package {'nginx':
  ensure  => installed,
}

file {'/var/www/html/index.html':
  content => 'Holberton School',
}

file_line {'configuring redirection':
  path => '/etc/nginx/sites-available/default',
  after => 'server_name _;',
  line => "\n\tlocation /redirect_me {\n\t\treturn 301 https://www.youtube.com/watch?v=QH2-TGUlwu4;\n\t}\n",
}

exec { 'sudo service nginx restart':
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

service {'nginx':
  ensure  => running,
}
