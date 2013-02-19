# Class: gdash::params
#
class gdash::params {
  $config_dir        = '/usr/local/gdash'
  $graphitehost      = '127.0.0.1'
  $vhost_config_file = "${config_dir}/apache2_gdash.conf"
  $vhost_dir         = '/usr/local/gdash'

  case $::osfamily {
    'Debian': {
      $log_dir        = '/var/log/apache2'
      $package_deps   = undef
      $package_ensure = true
      $package_name   = undef
      $service_name   = 'apache2'
    }


    'RedHat': {
      $log_dir        = '/var/log/httpd'
      $package_deps   = [ 'rubygem-bundler', 'gdash-bundled-deps' ]
      $package_ensure = true
      $package_name   = [ 'gdash' ]
      $service_name   = 'httpd'
    }

    default: {
      fail 'Operating system not supported.'
    }
  }
}

