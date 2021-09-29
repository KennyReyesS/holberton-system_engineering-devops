# This script remplace the class-wp-locale.phpp to class-wp-locale.php in var/www/html/wp-settings.php.
exec { 'fix-wordpress':
  command => 'sudo sed -i s/class-wp-locale.phpp/class-wp-locale.php/g /var/www/html/wp-settings.php',
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
