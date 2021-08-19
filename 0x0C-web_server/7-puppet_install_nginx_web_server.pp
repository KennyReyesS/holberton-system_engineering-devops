#!/usr/bin/env bash
# Configuring Nginx with puppet

exec { 'sudo apt-get update':
  path      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
  logoutput => on_failure
}

exec { 'sudo apt-get -y install nginx':
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

package {'nginx':
  ensure  => installed,
}

exec { 'echo "Holberton School" > index.html':
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'sudo mv index.html /var/www/html/':
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}

exec { 'sudo service nginx start':
  path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
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
